<?php
//Include the database connection if needed
session_start(); // Start the session to manage login or other session-related tasks
error_reporting(E_ALL);
ini_set('display_errors', 1);
//includes access to the database
include('../middleend/db_connect.php');

// makes sure the person logged in before accessing a webpage
if (!isset($_SESSION['roleid'])) {
header("Location: login.html");
exit();
}

$roleid = $_SESSION['roleid'];
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
    SELECT c.courseid, c.coursedesc, c.time, c.building, c.room, c.days, 
           f.firstname AS faculty_firstname, f.lastname AS faculty_lastname
    FROM enrollment e
    JOIN course c ON e.courseid = c.courseid
    JOIN faculty f ON c.facultyid = f.id
    WHERE e.studentid = $student_id
";
$courses_result = mysqli_query($conn, $courses_query);

if (mysqli_num_rows($courses_result) > 0) {
    $course_list = "
    <table>
        <thead>
            <tr>
                <th>Course Name</th>
                <th>Time</th>
                <th>Building</th>
                <th>Room</th>
                <th>Days</th>
                <th>Faculty</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>";
    while ($course = mysqli_fetch_assoc($courses_result)) {
        $course_list .= "
            <tr>
                <td>" . htmlspecialchars($course['coursedesc']) . "</td>
                <td>" . htmlspecialchars($course['time']) . "</td>
                <td>" . htmlspecialchars($course['building']) . "</td>
                <td>" . htmlspecialchars($course['room']) . "</td>
                <td>" . htmlspecialchars($course['days']) . "</td>
                 <td>" . htmlspecialchars($course['faculty_firstname'] . ' ' . $course['faculty_lastname']) . "</td>
                <td>
                    <form action='../middleend/withdraw_course.php' method='POST'>
                        <input type='hidden' name='studentid' value='$student_id'>
                        <input type='hidden' name='courseid' value='" . $course['courseid'] . "'>
                        <button type='submit'>Withdraw</button>
                    </form>
                </td>
            </tr>";
    }
    $course_list .= "</tbody></table>";
} else {
    $course_list = "<em>No courses enrolled.</em>";
}


     // query available courses 
    $all_courses_query = mysqli_query($conn, "
        SELECT c.courseid, c.coursedesc, c.time, c.building, c.room, c.days,
               f.firstname AS faculty_firstname, f.lastname AS faculty_lastname
        FROM course c
        JOIN faculty f ON c.facultyid = f.id;
    ");

    // building student block of information
    $student_infos .= "
    <div class='student-info' id='student$student_id' style='display: none;'>
        <h3>Course Information</h3>"
    . $course_list .
    "<h3>Available Courses</h3>";

    if (mysqli_num_rows($all_courses_query) > 0) {
        $student_infos .= "
        <table>
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Time</th>
                    <th>Building</th>
                    <th>Room</th>
                    <th>Days</th>
                    <th>Faculty</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>";
        while ($course = mysqli_fetch_assoc($all_courses_query)) {
            $student_infos .= "
                <tr>
                    <td>" . htmlspecialchars($course['coursedesc']) . "</td>
                    <td>" . htmlspecialchars($course['time']) . "</td>
                    <td>" . htmlspecialchars($course['building']) . "</td>
                    <td>" . htmlspecialchars($course['room']) . "</td>
                    <td>" . htmlspecialchars($course['days']) . "</td>
                    <td>" . htmlspecialchars($course['faculty_firstname'] . ' ' . $course['faculty_lastname']) . "</td>
                    <td>
                        <form action='../middleend/enroll_course.php' method='POST'>
                            <input type='hidden' name='studentid' value='$student_id'>
                            <input type='hidden' name='courseid' value='" . $course['courseid'] . "'>
                            <button type='submit'>Enroll</button>
                        </form>
                    </td>
                </tr>";
        }
        $student_infos .= "
            </tbody>
        </table>";
    } else {
        $student_infos .= "<p>No available courses to enroll.</p>";
    }

    $student_infos .= "</div>"; // close student-info
}

$all_courses_sql = "SELECT c.courseid, c.coursedesc, c.time, c.building, c.room, c.days, f.firstname AS faculty_firstname, f.lastname AS faculty_lastname
FROM course c
JOIN faculty f ON c.facultyid = f.id";
$all_courses_stmt = $conn->prepare($all_courses_sql);
$all_courses_stmt->execute();
$all_courses_result = $all_courses_stmt->get_result();

$all_courses = [];
while ($course = $all_courses_result->fetch_assoc()) {
    $all_courses[] = $course;
}

// faculty information
$sql1 = "SELECT * FROM faculty WHERE id = ?";
$stmt1 = $conn->prepare($sql1);
$stmt1->bind_param("i", $roleid);
$stmt1->execute();
$result1 = $stmt1->get_result();

if ($result1->num_rows > 0) {
    $faculty        = $result1->fetch_assoc();
    $faculty_name   = $faculty['firstname'] . " " . $faculty['lastname'];
    $Email          = $faculty['email'];
    $office         = $faculty['office'];
    $ID             = $faculty['id']; 
    $phone          = $faculty['phonenumber'];
} else {
    $faculty_name = "Faculty member";
    $Email = "Not on record";
}

// org & intern query
$sql2 = "SELECT * FROM organization";
$result2 = $conn->query($sql2);

$organizations = [];
if ($result2 && $result2->num_rows > 0) {
    while ($org = $result2->fetch_assoc()) {
        $organizations[] = $org;
    }
}

$sql3 = "SELECT * FROM internship";
$result3 = $conn->query($sql3);

$internships = [];
if ($result3 && $result3->num_rows > 0) {
    while ($intern = $result3->fetch_assoc()) {
        $internships[] = $intern;
    }
}

/*
$sql2 = "SELECT * FROM organization";
$stmt = $conn->prepare($sql2);
$stmt->bind_param("i", $roleid);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $organization   = $result->fetch_assoc();
    $orgID          = $organization["orgid"];
    $orgName        = $organization["orgname"];
    $orgPOS         = $organization["orgpos"];
    $orgContact     = $organization["contact"];
    $DPT            = $organization["dpt"];
} else {
    
}

$sql3 = "SELECT * FROM internship";
$stmt3 = $conn->prepare($sql3);
$stmt3->bind_param("i", $roleid);
$stmt3->execute();
$result3 = $stmt3->get_result();

if ($result3->num_rows > 0) {
    $internship     = $result3->fetch_assoc();
    $internID       = $internship["internid"];
    $internName     = $internship["interninfo"];
    $internType     = $internship["interntype"];
    $internContact  = $internship["contact"];
    $startDate      = $internship["startdate"];
    $endDate        = $internship["enddate"];
}else {
   
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

    <body class="advisor">
        <ul class="sidebar">
            <img src="../../assets/images/cameron.png" class="logo">
            <li><a>Advisor</a></li>                                                         <!--php for advisor's name?--> 
            <li><a>CS Department</a></li>                                                   <!--No need for php, only one department?-->
            <li><a href="#"id="contact-tab">Contact</a></li> 
            <li><a href="#" id="email-tab">Email</a></li>                               
            <li><a href="../middleend/process_logout.php"><i class="bx bx-log-out"></i>Logout</a></li>
        </ul>
      
        <div class="action-box">
            <div class="tabs">
                <ol>
                    <li  id="tab-personalinfo" class="active">
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">My Info</span>                                      
                    </li>
                    <li id="tab-courses">
                        <span class="icon"><i class='bx bxs-book'></i></span>
                        <span class="text">Courses</span>
                    </li>
                    <li id="tab-advisees">
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">Advisees</span>
                    </li>
                    <li id="tab-organization">
                        <span class="icon"><i class='bx bxs-chalkboard'></i></span>
                        <span class="text">Organizations</span>
                    </li>
                    <li id="tab-internship">
                        <span class="icon"><i class='bx bxs-user-pin'></i></span>
                        <span class="text">Internships</span>
                    </li>
                </ol>
            </div>

            <div class="content active">

            <!-- personal information tab -->
                <div class="tab_wrap" id="tab-personalinfo" style="display: block;">

                    <div class="title">Personal Information</div>

                    <div class="tab-content">
                        <p><strong>Name:    </strong> <?php echo htmlspecialchars($faculty_name); ?></p>
                        <p><strong>Your ID: </strong> <?php echo htmlspecialchars($ID); ?></p>
                        <p><strong>Email:   </strong> <?php echo htmlspecialchars($Email); ?></p>
                        <p><strong>Phone number:   </strong> <?php echo htmlspecialchars($phone); ?></p>
                        <p><strong>Office:   </strong> <?php echo htmlspecialchars($office); ?></p>
                    </div>
                </div>

            <!-- courses teaching tab -->
                <div class="tab_wrap" id="tab-courses" style="display: none;">
                    <div class="title">Teaching Schedule </div>
                    <div class="tab-content">
                        <?php
                        // Get all courses taught by this faculty
                        $courses_query = "
                            SELECT c.courseid, c.coursedesc, c.time, c.building, c.room, c.days
                            FROM course c
                            WHERE c.facultyid = $facultyid
                        ";
                        $courses_result = mysqli_query($conn, $courses_query);

                        if (mysqli_num_rows($courses_result) > 0) {
                            while ($course = mysqli_fetch_assoc($courses_result)) {
                                $course_id = $course['courseid'];
                                $course_desc = htmlspecialchars($course['coursedesc']);
                                $time = htmlspecialchars($course['time']);
                                $building = htmlspecialchars($course['building']);
                                $room = htmlspecialchars($course['room']);
                                $days = htmlspecialchars($course['days']);

                                echo "<div class='course-block'>";
                                echo "<h3>$course_desc</h3>";
                                echo "<p><strong>Time:</strong> $time | <strong>Days:</strong> $days | <strong>Location:</strong> $building  $room </p>";

                                // Get students enrolled in this course
                                $students_query = "
                                    SELECT s.studentid, s.firstname, s.lastname
                                    FROM enrollment e
                                    JOIN student s ON e.studentid = s.studentid
                                    WHERE e.courseid = $course_id
                                ";
                                $students_result = mysqli_query($conn, $students_query);

                                if (mysqli_num_rows($students_result) > 0) {
                                    echo "<table>
                                            <thead>
                                                <tr>
                                                    <th>Student Name</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                        <tbody>";
                                    while ($student = mysqli_fetch_assoc($students_result)) {
                                        $student_id = $student['studentid'];
                                        $student_name = htmlspecialchars($student['firstname'] . ' ' . $student['lastname']);
                                        echo "<tr>
                                                <td>$student_name</td>
                                                <td>
                                                    <form action='../middleend/withdraw.php' method='POST'>
                                                        <input type='hidden' name='studentid' value='$student_id'>
                                                        <input type='hidden' name='courseid' value='$course_id'>
                                                        <button type='submit'>Withdraw</button>
                                                    </form>
                                                </td>
                                            </tr>";
                                    }
                                    echo "</tbody></table>";
                                } else {
                                    echo "<p><em>No students enrolled in this course.</em></p>";
                                }

                                // Add student to course form
                                echo "<h5>Add a Student to $course_desc:</h5>";

                                // Get students NOT enrolled in this course
                                $available_students_query = "
                                    SELECT s.studentid, s.firstname, s.lastname
                                    FROM student s
                                    WHERE s.studentid NOT IN (
                                        SELECT e.studentid FROM enrollment e WHERE e.courseid = $course_id
                                    )
                                ";
                                $available_students_result = mysqli_query($conn, $available_students_query);

                                if (mysqli_num_rows($available_students_result) > 0) {
                                    echo "<form action='../middleend/enrollment.php' method='POST'>
                                            <input type='hidden' name='courseid' value='$course_id'>
                                            <input type='text' name='studentid' required>
                                            <button type='submit'>Enroll Student</button>
                                        </form>";
                                } else {
                                    echo "<p><em>All students are already enrolled in this course.</em></p>";
                                }

                                echo "<hr></div>"; // close course-block
                            }
                        } else {
                            echo "<p>No courses found for this faculty.</p>";
                        }
                        ?>
                    </div>
                </div>

            <!-- student advisees tab -->
                <div class="tab_wrap" id="tab-advisees" style="display: none;">

                    <div class="title">Advisees Information</div>
                    <div class="tab-content">
                        <div class="student-manage">
                            <div class="row">
                                <div class="col-3">
                                    <?= $student_buttons ?>
                                </div>
                                <div class="col-9">
                                    <p>Please select a student to view their enrolled courses.</p>
                                    <?= $student_infos ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            <!-- listed organization tab -->
                <div class="tab_wrap" id="tab-organization" style="display: none;">
                    <div class="title">Organizations</div>
                    <div class="tab-content">
                        <?php foreach ($organizations as $org): ?>
                            <div>
                                <p>Name: <?= htmlspecialchars($org['orgname']) ?></p>
                                <p>Position: <?= htmlspecialchars($org['orgpos']) ?></p>
                                <p>Contact: <?= htmlspecialchars($org['contact']) ?></p>
                                <p>Department: <?= htmlspecialchars($org['dpt']) ?></p>
                                <hr>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>

            <!-- listed internships tab -->
                <div class="tab_wrap" id="tab-internship" style="display: none;">
                    <div class="title">Internships</div>
                    <div class="tab-content">
                        <?php foreach ($internships as $intern): ?>
                        <div>
                            <p>Info: <?= htmlspecialchars($intern['interninfo']) ?></p>
                            <p>Type: <?= htmlspecialchars($intern['interntype']) ?></p>
                            <p>Contact: <?= htmlspecialchars($intern['contact']) ?></p>
                            <p>Start Date: <?= htmlspecialchars($intern['startdate']) ?></p>
                            <p>End Date: <?= htmlspecialchars($intern['enddate']) ?></p>
                            <hr>
                        </div>
                    <?php endforeach; ?>
                    </div>
                </div>

                <div id="contact-content" class="tab_wrap" style="display: none;">
                    <input type="text" id="contactSearch" onkeyup="filterContacts()" placeholder="Search contacts by name..." class="contact-search">
                    <div class="title">Contacts</div>
                    <div class="tab-content" id="contact-info">
                    </div>
                </div>
                <!-- Email sidebar -->
                <div id="email-content" class="tab_wrap" style="display: none; padding: 20px;">
                    <div class="title">Send Email</div>
                    <div class="tab-content">
                        <form action="../middleend/send_email.php" method="POST" style="display: flex; flex-direction: column; gap: 20px; max-width: 600px;">
                            <!-- Recipient Section -->
                            <div style="display: flex; flex-direction: column;">
                                <label style="margin-bottom: 5px;">Recipient:</label>
                                <select name="recipient" id="email-recipient" style="padding: 8px; font-size: 14px;">
                                    <!-- Options dynamically inserted -->
                                </select>
                            </div>
                            
                            <!-- Subject Section -->
                            <div style="display: flex; flex-direction: column;">
                                <label style="margin-bottom: 5px;">Subject:</label>
                                <input type="text" name="subject" required style="padding: 8px; font-size: 14px;">
                            </div>
                            
                            <!-- Message Section -->
                            <div style="display: flex; flex-direction: column;">
                                <label style="margin-bottom: 5px;">Message:</label>
                                <textarea name="message" rows="6" required style="padding: 8px; font-size: 14px;"></textarea>
                            </div>

                            <!-- Submit Button -->
                            <button type="submit" style="padding: 10px; font-size: 16px;">
                                Send Email
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    <!-- JS -->
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
