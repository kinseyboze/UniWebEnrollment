<?php
session_start();
include('../middleend/db_connect.php');

if (!isset($_SESSION['userid'])) {
    header("Location: login.html");
    exit();
}

$facultyid = $_SESSION['roleid'];
$query = "SELECT firstname, lastname, office, email, phonenumber, facultyrole FROM faculty WHERE id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $facultyid);
$stmt->execute();
$result = $stmt->get_result();
$faculty = $result->fetch_assoc();

$fullname = $faculty['firstname'] . ' ' . $faculty['lastname'];
$office = $faculty['office'];
$email = $faculty['email'];
$phonenumber = $faculty['phonenumber'];
$facultyrole = $faculty['facultyrole'];

// Get student info
$studentsql = "
    SELECT 
        s.studentid, 
        s.firstname, 
        s.lastname, 
        s.classification, 
        s.degree, 
        s.major, 
        f.firstname AS advisor_firstname, 
        f.lastname AS advisor_lastname
    FROM 
        student s
    LEFT JOIN 
        advisor a ON s.studentid = a.studentid
    LEFT JOIN 
        faculty f ON a.facultyid = f.id
";
$studentresult = $conn->query($studentsql);
?>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../../assets/css/style.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body class="faculty">
    <ul class="sidebar">
        <img src="../../assets/images/cameron.png" class="logo">
        <li><a>Faculty</a></li>
        <li><a>CS Department</a></li>
        <li><a href="#" id="contact-tab">Contact</a></li>
        <li><a href="../middleend/process_logout.php"><i class="bx bx-log-out"></i>Logout</a></li>
    </ul>

    <div class="action-box">
        <div class="tabs"> 
            <ol>
                <li class="active"><span class="icon"><i class='bx bxs-book'></i></span><span class="text">Faculty Info</span></li>
                <li><span class="icon"><i class='bx bxs-briefcase'></i></span><span class="text">Student</span></li>
            </ol>
        </div>

        <div class="content">

            <!-- Faculty Info Tab -->
            <div class="tab_wrap" style="display: block;">
                <div class="title">Faculty Information</div>
                <div class="tab-content">
                    <p><strong>Name:</strong> <?= htmlspecialchars($fullname) ?></p>
                    <p><strong>Role:</strong> <?= htmlspecialchars($facultyrole) ?></p>
                    <p><strong>Office:</strong> <?= htmlspecialchars($office) ?></p>
                    <p><strong>Email:</strong> <?= htmlspecialchars($email) ?></p>
                    <p><strong>Phone Number:</strong> <?= htmlspecialchars($phonenumber) ?></p>
                </div>
            </div>

            <!-- Student Info Tab -->
            <div class="tab_wrap" style="display: none;" id="studentList">
                <div class="title">Student Information</div>
                <div class="tab-content">
                    <table>
                        <thead>
                            <tr>
                                <th>Student ID</th>
                                <th>Name</th>
                                <th>Classification</th>
                                <th>Degree</th>
                                <th>Major</th>
                                <th>Advisor</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if ($studentresult->num_rows > 0) {
                                while ($row = $studentresult->fetch_assoc()) {
                                    echo "<tr>";
                                    echo "<td>" . htmlspecialchars($row['studentid']) . "</td>";
                                    echo "<td>" . htmlspecialchars($row['firstname'] . " " . $row['lastname']) . "</td>";
                                    echo "<td>" . htmlspecialchars($row['classification']) . "</td>";
                                    echo "<td>" . htmlspecialchars($row['degree']) . "</td>";
                                    echo "<td>" . htmlspecialchars($row['major']) . "</td>";
                                    echo "<td>" . htmlspecialchars($row['advisor_firstname'] . " " . $row['advisor_lastname']) . "</td>";
                                    echo "<td><button onclick='showAdvisorList(" . $row['studentid'] . ")'>Change Advisor</button></td>";
                                    echo "</tr>";
                                }
                            } else {
                                echo "<tr><td colspan='7'>No students found</td></tr>";
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Advisor Selection List -->
            <div class="tab_wrap" style="display: none;" id="advisorList">
                <div class="title">Choose a New Advisor</div>
                <button onclick="showStudentList()">Back to Students</button>
                <table>
                    <thead>
                        <tr>
                            <th>Advisor ID</th>
                            <th>Name</th>
                            <th>Office</th>
                            <th>Phone</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $faculty_sql = "SELECT id, firstname, lastname, office, phonenumber FROM faculty WHERE facultyrole IN ('advisor', 'chair')";
                        $faculty_result = $conn->query($faculty_sql);

                        while ($faculty = $faculty_result->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . htmlspecialchars($faculty['id']) . "</td>";
                            echo "<td>" . htmlspecialchars($faculty['firstname'] . " " . $faculty['lastname']) . "</td>";
                            echo "<td>" . htmlspecialchars($faculty['office']) . "</td>";
                            echo "<td>" . htmlspecialchars($faculty['phonenumber']) . "</td>";
                            echo "<td><button onclick='changeAdvisor(" . $faculty['id'] . ")'>Assign Advisor</button></td>";
                            echo "</tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>

            <!-- Hidden Student ID Field -->
            <input type="hidden" id="currentStudentId" value="">

        </div>
    </div>

    <script>
    function showAdvisorList(studentId) {
        document.getElementById("currentStudentId").value = studentId;
        document.getElementById("studentList").style.display = "none";
        document.getElementById("advisorList").style.display = "block";
    }

    function showStudentList() {
        document.getElementById("advisorList").style.display = "none";
        document.getElementById("studentList").style.display = "block";
    }

    function changeAdvisor(advisorId) {
        const studentId = document.getElementById("currentStudentId").value;

        fetch('../middleend/update_advisor.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'studentid=' + studentId + '&advisorid=' + advisorId
        })
        .then(response => response.text())
        .then(result => {
            alert('Advisor updated successfully!');
            location.reload();
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Failed to update advisor.');
        });
    }
    </script>
</body>
</html>
