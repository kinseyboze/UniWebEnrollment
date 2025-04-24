<?php
// Include the database connection if needed
session_start(); // Start the session to manage login or other session-related tasks

// includes access to the database
include('../middleend/db_connect.php');

// makes sure the person logged in before accessing a webpage
if (!isset($_SESSION['roleid'])) {
header("Location: login.html");
exit();
}

$roleid = $_SESSION['roleid'];

$facultyid = $_SESSION['facultyid']; // make sure this is set on login

// Get students only assigned to this advisor
$students_query = "
    SELECT s.studentid, s.firstname, s.lastname
    FROM student s
    JOIN advisor a ON s.studentid = a.studentid
    WHERE a.facultyid = $facultyid
";

$students_result = mysqli_query($conn, $students_query);

$student_buttons = '';
$student_infos = '';

while ($student = mysqli_fetch_assoc($students_result)) {
    $student_id = $student['studentid'];
    $student_name = $student['firstname'] . ' ' . $student['lastname'];

    // Build button
    $student_buttons .= "<button class='btn' data-target='#student$student_id'>{$student_name}</button>";

    // Get their courses
    $courses_query = "
        SELECT c.coursedesc
        FROM enrollment e
        JOIN course c ON e.courseid = c.courseid
        WHERE e.studentid = $student_id
    ";
    $courses_result = mysqli_query($conn, $courses_query);

    $course_list = '';
    while ($course = mysqli_fetch_assoc($courses_result)) {
        $course_list .= "<button type='button' class='student-courses'>{$course['coursedesc']}</button><br />";
    }

    if ($course_list === '') {
        $course_list = "<em>No courses enrolled.</em>";
    }

    // Add to output
    $student_infos .= "
        <div class='student-info' id='student$student_id' style='display: none;'>
            <h3>Course Information</h3>
            <p class='student-course'>$course_list</p>
        </div>
    ";
}

$sql1 = "SELECT * FROM faculty WHERE id = ?";
$stmt1 = $conn->prepare($sql1);
$stmt1->bind_param("i", $roleid);
$stmt1->execute();
$result1 = $stmt1->get_result();

if ($result1->num_rows > 0) {
    $faculty        = $result1->fetch_assoc();
    $faculty_name   = $faculty['firstname'] . " " . $faculty['lastname'];
    $Email          = $faculty['email'];
    $office         = $faculty['office'];
    $ID             = $faculty['id']; 
    $phone          = $faculty['phonenumber'];
} else {
    $faculty_name = "Faculty member";
    $Email = "Not on record";
}

/*
$sql2 = "SELECT * FROM organization";
$stmt = $conn->prepare($sql2);
$stmt->bind_param("i", $roleid);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $organization   = $result->fetch_assoc();
    $orgID          = $organization["orgid"];
    $orgName        = $organization["orgname"];
    $orgPOS         = $organization["orgpos"];
    $orgContact     = $organization["contact"];
    $DPT            = $organization["dpt"];
} else {
    
}

$sql3 = "SELECT * FROM internship";
$stmt3 = $conn->prepare($sql3);
$stmt3->bind_param("i", $roleid);
$stmt3->execute();
$result3 = $stmt3->get_result();

if ($result3->num_rows > 0) {
    $internship     = $result3->fetch_assoc();
    $internID       = $internship["internid"];
    $internName     = $internship["interninfo"];
    $internType     = $internship["interntype"];
    $internContact  = $internship["contact"];
    $startDate      = $internship["startdate"];
    $endDate        = $internship["enddate"];
}else {
   
}
*/
$sql2 = "SELECT * FROM organization";
$result2 = $conn->query($sql2);

$organizations = [];
if ($result2 && $result2->num_rows > 0) {
    while ($org = $result2->fetch_assoc()) {
        $organizations[] = $org;
    }
}

$sql3 = "SELECT * FROM internship";
$result3 = $conn->query($sql3);

$internships = [];
if ($result3 && $result3->num_rows > 0) {
    while ($intern = $result3->fetch_assoc()) {
        $internships[] = $intern;
    }
}





?>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../../assets/css/style.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="shortcut icon" href="#" />
    </head>

    <body class="advisor">
        <ul class="sidebar">
            <img src="../../assets/images/cameron.png" class="logo">
            <li><a>Advisor</a></li>                                                         <!--php for advisor's name?--> 
            <li><a>CS Department</a></li>                                                   <!--No need for php, only one department?-->
            <li><a href="#"id="contact-tab">Contact</a></li>                                
            <li><a href="../middleend/process_logout.php"><i class="bx bx-log-out"></i>Logout</a></li>
        </ul>
      
        <div class="action-box">
            <div class="tabs">
                <ol>
                    <li class="active">
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">My Info</span>                                      
                    </li>
                    <li >
                        <span class="icon"><i class='bx bxs-book'></i></span>
                        <span class="text">Courses</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">Advisor</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-chalkboard'></i></span>
                        <span class="text">Organizations</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-user-pin'></i></span>
                        <span class="text">Internships</span>
                    </li>
                </ol>
            </div>

            <div class="content active">
                <div class="tab_wrap" style="display: block;">
                    <div class="title">Personal Info</div>
                    <div class="tab-content">
                        <p><strong>Name:    </strong> <?php echo htmlspecialchars($faculty_name); ?></p>
                        <p><strong>Your ID: </strong> <?php echo htmlspecialchars($ID); ?></p>
                        <p><strong>Email:   </strong> <?php echo htmlspecialchars($Email); ?></p>
                        <p><strong>Phone number:   </strong> <?php echo htmlspecialchars($phone); ?></p>
                        <p><strong>Office:   </strong> <?php echo htmlspecialchars($office); ?></p>
                    </div>
                </div>
                <div class="tab_wrap" style="display: none;">
                    <div class="title">All Courses</div>
                    <div class="tab-content">
                        <input type="text" id="courseSearch" placeholder="Search for courses..." onkeyup="filterCourses()" />
                        <table id="coursesTable">
                            <thead>
                                <tr>
                                    <th>Course ID</th>
                                    <th>Course Name</th>
                                    <th>Building</th>
                                    <th>Room</th>
                                    <th>Time</th>
                                    <th>Days</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php include('../middleend/get_courses.php'); ?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Student Information</div>
                    <div class="tab-content">
                        <div class="student-manage">
                            <div class="row">
                            <div class="col-3">
                                    <?= $student_buttons ?>
                                </div>
                                <div class="col-9">
                                    <?= $student_infos ?>
                                </div>  
                            </div>
                            <button type="button" class="add-remove-course">Remove Course</button>
                            <button type="button" class="add-remove-course">Adding Course</button>
                        </div>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Organizations</div>
                    <div class="tab-content">
                        <?php foreach ($organizations as $org): ?>
                            <div>
                                <p>Name: <?= htmlspecialchars($org['orgname']) ?></p>
                                <p>Position: <?= htmlspecialchars($org['orgpos']) ?></p>
                                <p>Contact: <?= htmlspecialchars($org['contact']) ?></p>
                                <p>Department: <?= htmlspecialchars($org['dpt']) ?></p>
                                <hr>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Internships</div>
                    <div class="tab-content">
                        <?php foreach ($internships as $intern): ?>
                        <div>
                            <p>Info: <?= htmlspecialchars($intern['interninfo']) ?></p>
                            <p>Type: <?= htmlspecialchars($intern['interntype']) ?></p>
                            <p>Contact: <?= htmlspecialchars($intern['contact']) ?></p>
                            <p>Start Date: <?= htmlspecialchars($intern['startdate']) ?></p>
                            <p>End Date: <?= htmlspecialchars($intern['enddate']) ?></p>
                            <hr>
                        </div>
                    <?php endforeach; ?>
                    </div>
                </div>

                <div id="contact-content" class="tab_wrap" style="display: none;">
                    <input type="text" id="contactSearch" onkeyup="filterContacts()" placeholder="Search contacts by name..." class="contact-search">
                    <div class="title">Contacts</div>
                    <div class="tab-content" id="contact-info">
                    </div>
                </div>
            </div>
        </div>
        <script>
                document.querySelectorAll(".btn[data-target]").forEach(button => {
                button.addEventListener("click", () => {
                    const targetId = button.getAttribute("data-target");

                    // Hide all student info boxes
                    document.querySelectorAll(".student-info").forEach(info => {
                        info.style.display = "none";
                    });

                    // Show the clicked student's info
                    const target = document.querySelector(targetId);
                    if (target) {
                        target.style.display = "block";
                    } else {
                        console.error("No matching element for:", targetId);
                    }
                });
            });
        </script>

        <script src="scripts.js"></script>
    </body>
</html>
