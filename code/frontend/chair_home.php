<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
include('../middleend/db_connect.php');

if (!isset($_SESSION['roleid'])) {
    header("Location: login.html");
    exit();
}

$roleid = $_SESSION['roleid'];
$facultyid = $_SESSION['facultyid'];
$query = "SELECT firstname, lastname, office, email, phonenumber, facultyrole FROM faculty WHERE id = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("i", $facultyid);
$stmt->execute();
$result = $stmt->get_result();
$faculty = $result->fetch_assoc();

$fullname = $faculty['firstname'] . ' ' . $faculty['lastname'];
$office = $faculty['office'];
$email = $faculty['email'];
$phonenumber = $faculty['phonenumber'];
$facultyrole = $faculty['facultyrole'];

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

$students_query = "
    SELECT s.studentid, s.firstname, s.lastname, s.classification, s.degree, s.major
    FROM student s
    JOIN advisor a ON s.studentid = a.studentid
    WHERE a.facultyid = ?
";

$stmt_students = $conn->prepare($students_query);
$stmt_students->bind_param("i", $facultyid);
$stmt_students->execute();
$students_result = $stmt_students->get_result();

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
                    <form action='../middleend/withdraw.php' method='POST'>
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
                        <form action='../middleend/enrollment.php' method='POST'>
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
            <li><a href="#" id="email-tab">Email</a></li>
            <li><a href="../middleend/process_logout.php"><i class="bx bx-log-out"></i>Logout</a></li>
        </ul>
      
        <div class="action-box">
            <div class="tabs"> 
                <ol>
                    <li class="active">
                        <span class="icon"><i class='bx bxs-book'></i></span>
                        <span class="text">My Info</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-chalkboard'></i></span>
                        <span class="text">Courses</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">Students</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">Advisees</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-user-pin'></i></span>
                        <span class="text">Manage Internships</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-user-pin'></i></span>
                        <span class="text">Manage Organizations</span>
                    </li>
                </ol>
            </div>

        <div class="content">

        <!-- personal information tab -->
            <div class="tab_wrap" style="display: block;">
                <div class="title">Faculty Information</div>
                <div class="tab-content">
                    <p><strong>Name:</strong> <?= htmlspecialchars($fullname) ?></p>
                    <p><strong>Role:</strong> <?= htmlspecialchars($facultyrole) ?></p>
                    <p><strong>Office:</strong> <?= htmlspecialchars($office) ?></p>
                    <p><strong>Email:</strong> <?= htmlspecialchars($email) ?></p>
                    <p><strong>Phone Number:</strong> <?= htmlspecialchars($phonenumber) ?></p>
                </div>
            </div>
        
        <!-- COURSES TAB -->
            <div class="tab_wrap" style="display: none;">
                <div class="title">Teaching Schedule</div>
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

        <!-- Student Info Tab -->
            <div class="tab_wrap" style="display: none;">
                <div class="title">Student Information</div>
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
                </div>
        <!-- Advisor Selection List -->
        <div class="tab_wrap" style="display: none;">
    <div class="title">Advisees Information</div>
    <div class="tab-content" id="advisorList">
        <div class="student-manage">
            <div class="row">
                <?php if ($students_result->num_rows > 0): ?>
                    <div class="col-3">
                        <?= $student_buttons ?>
                    </div>
                    <div class="col-9">
                        <p>Please select a student to view their enrolled courses.</p>
                        <?= $student_infos ?>
                    </div>
                <?php else: ?>
                    <div class="col-12">
                        <p>No advisees assigned.</p>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
            
        <!-- Hidden Input for Student ID -->
            <input type="hidden" id="currentStudentId" value="">
            
        <!-- MANAGEMENT internship TAB -->
             <div class="tab_wrap" style="display: none;">
                    <div class="title">Manage Internship Information</div>
                    <div class="tab-content" id="internshipList">
                        <button onclick="showInternshipAdd()">Add New Internship</button>
                        <table id="internshipTable">
                            <thead>
                                <tr>
                                    <th>Internship ID</th>
                                    <th>Information</th>
                                    <th>Type</th>
                                    <th>Contact</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php include('../middleend/get_internships.php'); ?>
                            </tbody>
                        </table>
                    </div>

                <!-- Add New Internship Form -->
                    <div class="tab-content" id="internshipAdd" style="display: none;">
                        <button onclick="showInternshipList()">Back to Internship List</button>
                        <form id="addInternshipForm">
                            <label for="internid">Internship ID:</label><br>
                            <input type="text" id="internid" name="internid" required><br>
                            
                            <label for="interninfo">Internship Info:</label><br>
                            <input type="text" id="interninfo" name="interninfo" required><br>

                            <label for="interntype">Internship Type:</label><br>
                            <input type="text" id="interntype" name="interntype" required><br>

                            <label for="contact">Contact:</label><br>
                            <input type="text" id="contact" name="contact" required><br>

                            <label for="startdate">Start Date:</label><br>
                            <input type="date" id="startdate" name="startdate" required><br>

                            <label for="enddate">End Date:</label><br>
                            <input type="date" id="enddate" name="enddate" required><br><br>

                            <input type="submit" value="Insert Internship">
                        </form>
                    </div>
                </div>
                
            <!-- MANAGEMENT  org TAB -->
                <div class="tab_wrap" style="display: none;">
                    <div class="title">Manage Organization Information</div>
                    <div class="tab-content" id="organizationList">
                        
                    <!-- ADD SERACHBAR HERE -->

                    <!-- BUTTONS -->
                        <button onclick="showOrganizationAdd()">Add New Organization</button>
                        
                    <!-- TABLE -->
                        <table id = organizationTable>
                            <thread>
                                <tr>
                                    <th>Organization ID</th>
                                    <th>Organization Name</th>
                                    <th>Organization Position</th>
                                    <th>Department</th>
                                    <th>Contact</th>
                                </tr>
                            </thread>
                            <tbody>
                                <?php include('../middleend/get_organizations.php'); ?>
                            </tbody>
                        </table>
                    </div>


                <!-- ADD NEW ORG PAGE -->
                    <div class="tab-content" id="organizationAdd" style="display: none;">
                        <button onclick="showOrganizationList()">Back to Organization List</button>
                        <form form id="addOrganizationForm">
                            <label for="orgid">Organization ID:</label><br>
                            <input type="text" id="orgid" name="orgid" required><br>

                            <label for="orgname">Organization Name:</label><br>
                            <input type="text" id="orgname" name="orgname" required><br>

                            <label for="orgpos">Organization Position:</label><br>
                            <input type="text" id="orgpos" name="orgpos" required><br>

                            <label for="dpt">Department:</label><br>
                            <input type="text" id="dpt" name="dpt" required><br>

                            <label for="contact">Contact:</label><br>
                            <input type="text" id="contact" name="contact" required><br><br>

                            <input type="submit" value="Insert Organization">
                        </form>
                    </div>
                </div>


            <!-- CONTACTS -->
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
    </div>

    <script src="scripts.js"></script>
</body>
</html>
