<?php
session_start();


include('../middleend/db_connect.php');

$roleid = $_SESSION['roleid'];
$username = $_SESSION['username'];

// Get student info
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
    $email = $student['email'];

    // Get faculty ID from advisor table
    $advisor_sql = "SELECT facultyid FROM advisor WHERE studentid = ?";
    $advisor_stmt = $conn->prepare($advisor_sql);
    $advisor_stmt->bind_param("i", $roleid);
    $advisor_stmt->execute();
    $advisor_result = $advisor_stmt->get_result();

    if ($advisor_result->num_rows > 0) {
        $advisor_row = $advisor_result->fetch_assoc();
        $faculty_id = $advisor_row['facultyid'];

        // Look up faculty name using faculty ID
        $faculty_sql = "SELECT firstname, lastname FROM faculty WHERE id = ?";
        $faculty_stmt = $conn->prepare($faculty_sql);
        $faculty_stmt->bind_param("i", $faculty_id);
        $faculty_stmt->execute();
        $faculty_result = $faculty_stmt->get_result();

        if ($faculty_result->num_rows > 0) {
            $faculty_row = $faculty_result->fetch_assoc();
            $advisor_name = $faculty_row['firstname'] . " " . $faculty_row['lastname'];
        } else {
            $advisor_name = "Advisor not found";
        }

        $faculty_stmt->close();
    } else {
        $advisor_name = "No advisor assigned";
    }

    $advisor_stmt->close();

   // Corrected SQL query for fetching student courses
    $enroll_sql = "SELECT c.coursedesc, c.time, c.building, c.room, c.days, f.firstname AS faculty_firstname, f.lastname AS faculty_lastname
    FROM enrollment e
    JOIN course c ON e.courseid = c.courseid
    JOIN faculty f ON c.facultyid = f.id
    WHERE e.studentid = ?"; // Ensure 'studentid' is correct in the enrollment table

    $enroll_stmt = $conn->prepare($enroll_sql);
    $enroll_stmt->bind_param("i", $roleid);  // Assuming $roleid is the student id
    $enroll_stmt->execute();
    $enroll_result = $enroll_stmt->get_result();

    if ($enroll_result->num_rows > 0) {
    while ($course = $enroll_result->fetch_assoc()) {
    $courses[] = $course;
    }
    } else {
    // Handle case where no courses are found
    $courses = [];
    }

$enroll_stmt->close();
    
} else {
    // Defaults
    $student_name = "Student";
    $classification = $major = $minor = $advisor_name = "";
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
                    <span class="icon"><i class='bx bxs-graduation'></i></span>
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
            <!-- Student information -->
            <div class="tab_wrap" style="display: block;">
                <div class="title">Student Information</div>
                <div class="tab-content">
                    <p><strong>Name:</strong> <?php echo htmlspecialchars($student_name); ?></p>
                    <p><strong>Classification:</strong> <?php echo htmlspecialchars($classification); ?></p>
                    <p><strong>Major:</strong> <?php echo htmlspecialchars($major); ?></p>
                    <p><strong>Minor:</strong> <?php echo htmlspecialchars($minor); ?></p>
                    <p><strong>Email:</strong> <?php echo htmlspecialchars($email); ?></p>
                    <!-- <p><strong>Phone Number:</strong> <?php echo htmlspecialchars($phonenumber); ?></p>
                    <p><strong>Date of Birth:</strong> <?php echo htmlspecialchars($dob); ?></p> -->
                    <p><strong>Advisor:</strong> <?= htmlspecialchars($advisor_name) ?></p>
                </div>
            </div>
            <!-- Course Information -->
            <div class="tab_wrap" style="display: none;">
            <div class="title">Course Information</div>
            <div class="tab-content">
                <?php if (!empty($courses)): ?>
                    <table>
                        <thead>
                            <tr>
                                <th>Course Description</th>
                                <th>Time</th>
                                <th>Building</th>
                                <th>Room</th>
                                <th>Days</th>
                                <th>Faculty Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($courses as $course): ?>
                                <tr>
                                    <td><?= htmlspecialchars($course['coursedesc']) ?></td>
                                    <td><?= htmlspecialchars($course['time']) ?></td>
                                    <td><?= htmlspecialchars($course['building']) ?></td>
                                    <td><?= htmlspecialchars($course['room']) ?></td>
                                    <td><?= htmlspecialchars($course['days']) ?></td>
                                    <td><?= htmlspecialchars($course['faculty_firstname']) . ' ' . htmlspecialchars($course['faculty_lastname']) ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php else: ?>
                    <p>No courses found.</p>
                <?php endif; ?>
            </div>
        </div>
        <!-- Enrollment information -->
        <div class="tab_wrap" style="display: none;">
            <div class="title">Enrollment</div>
            <div class="tab-content">
                <p>Enrollment information goes here
                </p>
            </div>
        </div>
        <!-- Organization information -->
        <div class="tab_wrap" style="display: none;">
            <div class="title">Organizations</div>
            <div class="tab-content">
                <p>Organizations information goes here
                </p>
            </div>
        </div>
        <!-- Internship information -->
            <div class="tab_wrap" style="display: none;">
                <div class="title">Internship</div>
                <div class="tab-content">
                    <p>Internship information goes here
                    </p>
                </div>
            </div>
            <!-- Contact sidebar -->
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
