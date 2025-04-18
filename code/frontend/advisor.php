<?php
// Include the database connection if needed
session_start(); // Start the session to manage login or other session-related tasks

// includes access to the database
include('../middleend/db_connect.php');

// makes sure the person logged in before accessing a webpage
if (!isset($_SESSION['userid'])) {
header("Location: login.html");
exit();
}

$sql = "SELECT * FROM advisor WHERE advisorid = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $roleid);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $advisor        = $result->fetch_assoc();
    $advisor_name   = $advisor['firstname'] . " " . $advisor['lastname'];
    $Email          = $advisor['email'];
    $ID             = $advisor['advisorID'];
} else {
    $advisor_name = "Advisor";
    $Email = "Not on record";
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
            <li><a href="#"><i class="bx bx-log-out"></i>Logout</a></li>
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
                        <p><strong>Name:    </strong> <?php echo htmlspecialchars($advisor_name); ?></p>
                        <p><strong>Your ID: </strong> <?php echo htmlspecialchars($ID); ?></p>
                        <p><strong>Email:   </strong> <?php echo htmlspecialchars($email); ?></p>
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
                                            <button type="button" class="student-courses">History</button><br />
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
                    <div class="title">Organizations</div>
                    <div class="tab-content">
                        <p>All school-wide Organizations go here </p>
                        <!-- not sure if i need to hard code a list or not -->
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Internships</div>
                    <div class="tab-content">
                        <p>Here are all of the local internships that are being offered.</p>
                        <!-- not sure if i need to hard code a list or not -->
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
