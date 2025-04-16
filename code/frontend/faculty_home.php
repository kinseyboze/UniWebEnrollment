<?php
// Include the database connection if needed


// includes access to the database
include('../middleend/db_connect.php');

/*
// makes sure the person logged in before accessing a webpage
if (!isset($_SESSION['roleid'])) {
header("Location: login.html");
exit();
}
*/

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

                <!-- Other Tabs (Student, Advisor, Manage) go here... -->
            </div>
        </div>

        <script src="scripts.js"></script>
    </body>
</html>