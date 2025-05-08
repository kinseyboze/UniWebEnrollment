<?php
session_start();
include('../middleend/db_connect.php');

if (!isset($_SESSION['userid'])) {
    header("Location: login.html");
    exit();
}

$facultyid = $_SESSION['roleid'];
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
                        <span class="text">Student</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">Advisor</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-user-pin'></i></span>
                        <span class="text">Manage Internships</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-user-pin'></i></span>
                        <span class="text">Manage organizations</span>
                    </li>
                </ol>
            </div>

        <div class="content">

            <!-- Faculty Info Tab -->
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
                <div class="title">All Courses</div>
                <div class="tab-content">
                    <!-- search bar for classes -->
                    <input type="text" id="courseSearch" placeholder="Search for courses..." onkeyup="filterCourses()" />
                    <table id="coursesTable">
                        <tbody>
                            <?php include('../middleend/get_courses.php'); ?>
                        </tbody>
                    </table>
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

            <!-- Advisor Selection List -->
            <div class="tab_wrap" style="display: none;" id="advisorList">
                <button onclick="showStudentList()">Back to Students</button>
                <h3>Select an Advisor</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Advisor ID</th>
                            <th>Name</th>
                            <th>Office</th>
                            <th>Phone</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $faculty_sql = "SELECT id, firstname, lastname, office, phonenumber FROM faculty WHERE facultyrole IN ('advisor', 'chair')";
                        $faculty_result = $conn->query($faculty_sql);

                        while ($faculty = $faculty_result->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td>" . htmlspecialchars($faculty['id']) . "</td>";
                            echo "<td>" . htmlspecialchars($faculty['firstname'] . " " . $faculty['lastname']) . "</td>";
                            echo "<td>" . htmlspecialchars($faculty['office']) . "</td>";
                            echo "<td>" . htmlspecialchars($faculty['phonenumber']) . "</td>";
                            echo "<td><button onclick='changeAdvisor(" . $faculty['id'] . ")'>Assign Advisor</button></td>";
                            echo "</tr>";
                        }
                        ?>
                    </tbody>
                </table>
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
