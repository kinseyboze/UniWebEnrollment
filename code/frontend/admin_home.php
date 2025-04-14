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
        <ul>
            <img src="../../assets/images/cameron.png" class="logo">
            <li><a>Admin</a></li>
            <li><a>CS Department</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="../login.html"><i class="bx bx-log-out"></i>Logout</a></li>
        </ul>
      
        <div class="action-box">
            <div class="tabs"> 
                <ol>
                    <li class="active">
                        <span class="icon"><i class='bx bxs-user'></i></span>
                        <span class="text">Students & Faculty</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-cog'></i></span>
                        <span class="text">Manage Accounts</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-buildings'></i></span>
                        <span class="text">Manage Buildings</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-door-open'></i></span>
                        <span class="text">Manage Rooms</span>
                    </li>
                </ol>
            </div>

            <div class="content">
                <div class="tab_wrap" style="display: block;">
                    <div class="title">Students & Faculty</div>
                    <div class="tab-content">
                        <div id="userList">Loading...</div>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Manage Accounts</div>
                    <div class="tab-content">
                        <p>In this tab you will be able to add and delete student and faculty accounts.</p>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Manage Buildings</div>
                    <div class="tab-content">
                        <p>In this tab you will be able to add and delete school buildings in the course descriptions.</p>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Manage Rooms</div>
                    <div class="tab-content">
                        <p>In this tab you will be able to add and delete classrooms in the course descriptions.</p>
                    </div>
                </div>
            </div>
        </div>

        <script src="scripts.js"></script>
    </body>
</html>
