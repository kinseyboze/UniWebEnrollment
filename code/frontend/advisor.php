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
                                    <button class="btn" data-target="#student1">Thien Tran</button>
                                    <button class="btn" data-target="#student2">Bell Ngu</button>
                                    <button class="btn" data-target="#student3">Toan Phan</button>
                                    <button class="btn" data-target="#student4">John Smith</button>
                                </div>
                                <div class="col-9">
                                    <div class="student-info" id="student1">
                                        <h3>Course Information</h3>
                                        <p class="student-course">
                                            <button type="button" class="student-courses">Art</button><br />
                                            <button type="button" class="student-courses">CS2</button><br />
                                            <button type="button" class="student-courses">Gender Study</button><br />
                                            <button type="button" class="student-courses">Economy</button><br />
                                            <button type="button" class="student-courses">Nutrient</button><br />
                                        </p>
                                    </div>
                                    <div class="student-info" id="student2">
                                        <h3>Course Information</h3>
                                        <p class="student-course">
                                            <button type="button" class="student-courses">Gender Study</button><br />
                                            <button type="button" class="student-courses">Music</button><br />
                                            <button type="button" class="student-courses">Hitory</button><br />
                                            <button type="button" class="student-courses">Calculus</button><br />
                                            <button type="button" class="student-courses">Biology</button><br />
                                        </p>
                                    </div>
                                    <div class="student-info" id="student3">
                                        <h3>Course Information</h3>
                                        <p class="student-course">
                                            <button type="button" class="student-courses">CS2</button><br />
                                            <button type="button" class="student-courses">World History</button><br />
                                            <button type="button" class="student-courses">IT</button><br />
                                            <button type="button" class="student-courses">English II</button><br />
                                            <button type="button" class="student-courses">Lab</button><br />
                                        </p>
                                    </div>
                                    <div class="student-info" id="student4">
                                        <h3>Course Information</h3>
                                        <p class="student-course">
                                            <button type="button" class="student-courses">CS1</button><br />
                                            <button type="button" class="student-courses">World History</button><br />
                                            <button type="button" class="student-courses">IT Lab</button><br />
                                            <button type="button" class="student-courses">English III</button><br />
                                            <button type="button" class="student-courses">Lab 2</button><br />
                                        </p>
                                    </div>
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

        <script src="scripts.js"></script>
    </body>
</html>
