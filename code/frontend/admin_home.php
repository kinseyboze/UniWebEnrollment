<?php
session_start();

include('../middleend/db_connect.php');

if (!isset($_SESSION['userid'])) {
    header("Location: login.html");
    exit();
}
?>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../../assets/css/style.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="shortcut icon" href="#" />
    </head>

    <body class="admin">
        <ul class="sidebar">
            <img src="../../assets/images/cameron.png" class="logo">
            <li><a>Admin</a></li>
            <li><a href="#"id="contact-tab">Contact</a></li>
            <li><a href="../middleend/process_logout.php"><i class="bx bx-log-out"></i>Logout</a></li>
        </ul>
      
        <div class="action-box">
            <div class="tabs"> 
                <ol>
                    <li id="tab-printlist" class="active" >
                        <span class="icon"><i class='bx bxs-user'></i></span>
                        <span class="text">Students & Faculty</span>
                    </li>

                    <li id="tab-accounts">
                        <span class="icon"><i class='bx bxs-cog'></i></span>
                        <span class="text">Manage Accounts</span>
                    </li>

                    <li id="tab-courses">
                        <span class="icon"><i class='bx bxs-buildings'></i></span>
                        <span class="text">Manage Courses</span>
                    </li>

                    <li id="tab-buildings">
                        <span class="icon"><i class='bx bxs-door-open'></i></span>
                        <span class="text">Manage Buildings</span>
                    </li>
                </ol>
            </div>

            <div class="content">
                <div class="tab_wrap" id="content-printlist" style="display: block;">
                    <div class="title">Students & Faculty</div>
                    <div class="tab-content">
                        <div class="button-group">
                            <button onclick="loadAccounts('student')">Students</button>
                            <button onclick="loadAccounts('faculty')">Faculty</button>
                            <button onclick="loadAccounts('advisor')">Advisors</button>
                            <button onclick="loadAccounts('chair')">Chairs</button>
                            <button onclick="loadAccounts('admin')">Admins</button>
                        </div>
                        <div id="accountList">Select a role to view users.</div>
                    </div>
                </div>

                <div class="tab_wrap" id="content-accounts" style="display: none;">
                    <div class="title">Manage Accounts</div>
                    <div class="tab-content">
                        <input type="text" id="accountSearch" onkeyup="filterAccounts()" placeholder="Search by name">
                        <div id="allAccountList">Loading...</div>
                    </div>
                </div>

                <div class="tab_wrap" id="content-courses" style="display: none;">
                    <div class="title">Manage Courses</div>
                    <div class="tab-content">

                <!-- search bar for classes -->
                    <input type="text" id="courseSearch" placeholder="Search for courses..." onkeyup="filterCourses()" />

                <!-- add & edit course button -->

                <button onclick="window.location.href='../middleend/add_course.php'">Add New Course</button>
                <button onclick="window.location.href='../middleend/manage_course.php'">Manage Course functionality</button>


                <!-- table to display data -->
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


                </div>
                </div>

                <div class="tab_wrap" id="content-buildings" style="display: none;">
                    <div class="title">Manage Buildings</div>
                    <div class="tab-content">
                        <p>In this tab you will be able to add and delete buildings. This tab may be deleted all together.</p>
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
