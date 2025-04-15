<?php

include('../middleend/db_connect.php');

?>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../../assets/css/style.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="shortcut icon" href="#" />
    </head>

    <body class="advisor">
        <ul class = "sidebar">
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
                <div id="contact-content" class="tab_wrap" style="display: none;">
                <input type="text" id="contactSearch" onkeyup="filterContacts()" placeholder="Search contacts by name..." class="contact-search">
                    <div class="title">Contacts</div>
                    <div class="tab-content" id="contact-info">

                </div>

                <!-- Other Tabs (Student, Advisor, Manage) go here... -->

                <div class="tab_wrap" style="display: none;">
                <div class="title">Student Information</div>
                        <div class="tab-content">
                            <div class="student-manage">
                                <div class="row">
                                    <div class="col-3">
                                        <button class="btn" data-target="#student1">Thien Tran</button>
                                        <button class="btn" data-target="#student2">Bell Ngu</button>
                                        <button class="btn" data-target="#student3">Toan Phan</button>
                                        <button class="btn" data-target="#student4">John Smith</button>
                                    </div>
                                    <div class="col-9">
                                        <div class="student-info" id="student1">
                                            <h3>Course Information</h3>
                                            <p class="student-course">
                                                Art <br />
                                                CS2 <br />
                                                Gender Study <br />
                                                Economy <br />
                                                Nutrient <br />
                                            </p>
                                        </div>
                                        <div class="student-info" id="student2">
                                            <h3>Course Information</h3>
                                            <p class="student-course">
                                                Gender Study <br />
                                                Music <br />
                                                History <br />
                                                Calculus <br />
                                                Biology <br />
                                            </p>
                                        </div>
                                        <div class="student-info" id="student3">
                                            <h3>Course Information</h3>
                                            <p class="student-course">
                                                CS2 <br />
                                                World History <br />
                                                IT <br />
                                                English II <br />
                                                Lab <br />
                                            </p>
                                        </div>

                                        <div class="student-info" id="student4">
                                            <h3>Course Information</h3>
                                            <p class="student-course">
                                                CS1 <br />
                                                World History <br />
                                                IT Lab <br />
                                                English III <br />
                                                Lab 2 <br />
                                            </p>
                                        </div>
                                    </div>
                            </div>
                        </div>
                </div>

                <!-- Other Tabs (Student, Advisor, Manage) go here... -->


            </div>
        </div>

        <script src="scripts.js"></script>
    </body>
</html>