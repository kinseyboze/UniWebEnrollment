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

    <body class="chair">
        <ul class="sidebar">
            <img src="../../assets/images/cameron.png" class="logo">
            <li><a>Department Chair</a></li>
            <li><a>CS Department</a></li>
            <li><a href="#"id="contact-tab">Contact</a></li>
            <li><a href="#"><i class="bx bx-log-out"></i>Logout</a></li>
        </ul>
      
        <div class="action-box">
            <div class="tabs"> 
                <ol>
                    <li class="active">
                        <span class="icon"><i class='bx bxs-book'></i></span>
                        <span class="text">Student</span>
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
                    <div class="title">Student Information</div>
                    <div class="tab-content">
                        <p>student information goes here
                        </p>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Advisor Information</div>
                    <div class="tab-content">
                        <p>advisor information goes here
                        </p>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Course Information</div>
                    <div class="tab-content">
                        <p>course information goes here
                        </p>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Management Information</div>
                    <div class="tab-content">
                        <p>management information goes here
                        </p>
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