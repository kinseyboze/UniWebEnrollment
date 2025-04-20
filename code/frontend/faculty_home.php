<?php
session_start();

// includes access to the database
include('../middleend/db_connect.php');

// makes sure the person logged in before accessing a webpage
if (!isset($_SESSION['userid'])) {
header("Location: login.html");
exit();
}

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
            <li><a href="#">Contact</a></li>
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

                    <li > 
                        <span class="icon"><i class='bx bxs-chalkboard'></i></span>
                        <span class="text">Student</span>
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
                                $faculty_sql = "SELECT id, firstname, lastname, office, phonenumber FROM faculty WHERE facultyrole = 'advisor'";
                                $faculty_result = $conn->query($faculty_sql);
                                
                                while ($faculty = $faculty_result->fetch_assoc()) {
                                    echo "<tr>";
                                    echo "<td>" . htmlspecialchars($faculty['id']) . "</td>";
                                    echo "<td>" . htmlspecialchars($faculty['firstname'] . " " . $faculty['lastname']) . "</td>";
                                    echo "<td>" . htmlspecialchars($faculty['office']) . "</td>";
                                    echo "<td>" . htmlspecialchars($faculty['phonenumber']) . "</td>";
                                    echo "<td><button onclick='changeAdvisor(" . htmlspecialchars($row2['studentid']) . ", " . $faculty['id'] . ")'>Change Advisor</button></td>"; 
                                    echo "</tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Other Tabs (Student, Advisor, Manage) go here... -->
            </div>
        </div>

        <script src="scripts.js"></script>
    </body>
</html>