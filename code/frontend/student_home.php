<?php
session_start();


include('../middleend/db_connect.php');

$roleid = $_SESSION['roleid'];
$username = $_SESSION['username'];

$sql = "SELECT * FROM student WHERE studentid = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $roleid);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $student = $result->fetch_assoc();
    $student_name = $student['firstname'] . " " . $student['lastname'];
    $classification = $student['classification'];
    $major = $student['major'];
    $minor = $student['minor'];
} else {
    $student_name = "Student";
}

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Home - UniEnroll</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body class = "chair">
    <ul class="sidebar">
            <img src="../../assets/images/cameron.png" class="logo">
            <li><a>Student Information</a></li>
            <li><a href="#"id="contact-tab">Contact</a></li>
            <li><a href="../login.html"><i class="bx bx-log-out"></i>Logout</a></li>
    </ul>

    <div class="action-box">
        <div class="tabs"> 
            <ol>
                <li class="active">
                    <span class="icon"><i class='bx bxs-book'></i></span>
                    <span class="text">Student</span>
                </li>
                <li>
                    <span class="icon"><i class='bx bxs-book'></i></span>
                    <span class="text">Courses</span>
                </li>

                <li>
                    <span class="icon"><i class='bx bxs-briefcase'></i></span>
                    <span class="text">Enrollment</span>
                </li>

                <li>
                    <span class="icon"><i class='bx bxs-chalkboard'></i></span>
                    <span class="text">Organizations</span>
                </li>

                <li>
                    <span class="icon"><i class='bx bxs-user-pin'></i></span>
                    <span class="text">Internship</span>
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
            <div class="tab_wrap" style="display: block;">
                <div class="title">Course Information</div>
                <div class="tab-content">
                    <p>Coruse information goes here
                    </p>
                </div>
            </div>
            <div class="tab_wrap" style="display: none;">
                <div class="title">Enrollment</div>
                <div class="tab-content">
                    <p>Enrollment information goes here
                    </p>
                </div>
            </div>
            <div class="tab_wrap" style="display: none;">
                <div class="title">Organizations</div>
                <div class="tab-content">
                    <p>Organizations information goes here
                    </p>
                </div>
            </div>
            <div class="tab_wrap" style="display: none;">
                <div class="title">Internship</div>
                <div class="tab-content">
                    <p>Internship information goes here
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
