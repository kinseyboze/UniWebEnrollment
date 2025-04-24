<?php
session_start();

// includes access to the database
include('../middleend/db_connect.php');

// makes sure the person logged in before accessing a webpage
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

$firstname = $faculty['firstname'];
$lastname = $faculty['lastname'];
$fullname = $firstname . ' ' . $lastname;
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
if (!$studentresult) {
    die("Query failed: " . $conn->error);
}

$row2 = $studentresult->fetch_assoc()


?>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../../assets/css/style.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="shortcut icon" href="#" />
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

                    <li class="active">
                        <span class="icon"><i class='bx bxs-book'></i></span>
                        <span class="text">Faculty Info</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">Student</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">Advisor</span>
                    </li>

                </ol>
            </div>

            <div class="content">
            <div class="tab_wrap" style="display: block;">
                    <div class="title">Faculty Information</div>
                    <div class="tab-content">
                        <p><strong>Name:</strong> <?php echo htmlspecialchars($fullname); ?></p>
                        <p><strong>Role:</strong> <?php echo htmlspecialchars($facultyrole); ?></p>
                        <p><strong>Office:</strong> <?php echo htmlspecialchars($office); ?></p>
                        <p><strong>Email:</strong> <?php echo htmlspecialchars($email); ?></p>
                        <p><strong>Phone Number:</strong> <?php echo htmlspecialchars($phonenumber); ?></p>
                    </div>
                </div>
                <!-- Tyler -->

<!-- ADVISOR TAB -->
<div class="tab_wrap" style="display: none;">
                    <div class="title">Advisor Information</div>
                    <div class="tab-content" id="studentList">

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
                    
                    <!-- Advisor List (Initially hidden) -->
                    <div class="tab-content" id="advisorList" style="display: none;">
                        <button onclick="showStudentList()">Back to Students</button>
                        <h3>Select an Advisor</h3>
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
                                // Fetch all advisors
                                $faculty_sql = "SELECT id, firstname, lastname, office, phonenumber FROM faculty WHERE facultyrole IN ('advisor', 'chair')";
                                $faculty_result = $conn->query($faculty_sql);

                                while ($faculty = $faculty_result->fetch_assoc()) {
                                    echo "<tr>";
                                    echo "<td>" . htmlspecialchars($faculty['id']) . "</td>";
                                    echo "<td>" . htmlspecialchars($faculty['firstname'] . " " . $faculty['lastname']) . "</td>";
                                    echo "<td>" . htmlspecialchars($faculty['office']) . "</td>";
                                    echo "<td>" . htmlspecialchars($faculty['phonenumber']) . "</td>";
                                    echo "<td><button onclick='changeAdvisor(" . htmlspecialchars($faculty['id']) . ")'>Change Advisor</button></td>";
                                    echo "</tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Hidden Input for Student ID -->
                <input type="hidden" id="currentStudentId" value="">



                <!-- Tyler -->
                 
                <div class="tab_wrap" style="display: none;">
                    <div class="title">Advisor Information</div>
                    <div class="tab-content">
                    <?php
$query = "SELECT firstname, lastname, email, office, phonenumber FROM faculty WHERE facultyrole = 'advisor'";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    while ($advisor = $result->fetch_assoc()) {
        $name = $advisor['firstname'] . ' ' . $advisor['lastname'];
        $email = $advisor['email'];
        $office = $advisor['office'];
        $phonenumber = $advisor['phonenumber'];
        ?>
        <div class="advisor-card" style="margin-bottom: 1em; border-bottom: 1px solid #ccc; padding-bottom: 1em;">
            <p><strong>Name:</strong> <?php echo htmlspecialchars($name); ?></p>
            <p><strong>Email:</strong> <?php echo htmlspecialchars($email); ?></p>
            <p><strong>Office:</strong> <?php echo htmlspecialchars($office); ?></p>
            <p><strong>Phone Number:</strong> <?php echo htmlspecialchars($phonenumber); ?></p>
        </div>
        <?php
    }
} else {
    echo "<p>No advisor information found.</p>";
}
?>

                    </div>
                </div>


                <div id="contact-content" class="tab_wrap" style="display: none;">
                <input type="text" id="contactSearch" onkeyup="filterContacts()" placeholder="Search contacts by name..." class="contact-search">
                    <div class="title">Contacts</div>
                    <div class="tab-content" id="contact-info">

                    </div>
                </div>


                <!-- Other Tabs (Student, Advisor, Manage) go here... -->
            </div>
        </div>

        <script src="scripts.js"></script>
    </body>
</html>