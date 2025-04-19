<?php
// Include the database connection if needed
session_start(); // Start the session to manage login or other session-related tasks

// includes access to the database
include('../middleend/db_connect.php');

/*
// makes sure the person logged in before accessing a webpage
if (!isset($_SESSION['userid'])) {
header("Location: login.html");
exit();
}
*/
// Get all students
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
            <li><a>Advisor</a></li>
            <li><a>CS Department</a></li>
            <li><a href="#"id="contact-tab">Contact</a></li>
            <li><a href="#"><i class="bx bx-log-out"></i>Logout</a></li>
        </ul>
      
        <div class="action-box">
            <div class="tabs">
                <ol>
                    <li class="active">
                        <span class="icon"><i class='bx bxs-book'></i></span>
                        <span class="text">Courses</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">Advisor</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-chalkboard'></i></span>
                        <span class="text">Courses</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-user-pin'></i></span>
                        <span class="text">Manage</span>
                    </li>
                </ol>
            </div>

            <div class="content">
                <div class="tab_wrap" style="display: block;">
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
                    <div class="title">Course Information</div>
                    <div class="tab-content">
                        <p>course information goes here</p>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Management Information</div>
                    <div class="tab-content">
                        <p>management information goes here</p>
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
