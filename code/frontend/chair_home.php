<?php
session_start();

// includes access to the database
include('../middleend/db_connect.php');

// makes sure the person logged in before accessing a webpage
if (!isset($_SESSION['userid'])) {
header("Location: login.html");
exit();
}
$roleid = $_SESSION['roleid'];
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
                <!-- MY INFO TAB -->
                 <div class="tab_wrap" style="display: block;">
                    <div class="title">My Information</div>
                    <div class="tab-content">
                        <p><strong>Name:    </strong> <?php echo htmlspecialchars($faculty_name); ?></p>
                        <p><strong>Your ID: </strong> <?php echo htmlspecialchars($ID); ?></p>
                        <p><strong>Email:   </strong> <?php echo htmlspecialchars($Email); ?></p>
                        <p><strong>Phone number:   </strong> <?php echo htmlspecialchars($phone); ?></p>
                        <p><strong>Office:   </strong> <?php echo htmlspecialchars($office); ?></p>
                    </div>
                </div>
                <!-- COURSES TAB -->
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
                <!-- STUDNET TAB -->
                <div class="tab_wrap" style="display: none;">
                    <div class="title">Student Information</div>
                    <div class="tab-content">
                        <p>student information goes here
                        </p>
                    </div>
                </div>
                <!-- ADVISOR TAB -->
                <div class="tab_wrap" style="display: none;">
                    <div class="title">Advisor Information</div>
                    <div class="tab-content">
                         <?php
                        $query = "SELECT firstname, lastname, email, office, phonenumber FROM faculty WHERE facultyrole = 'advisor'";
                        $result = $conn->query($query);

                        if ($result->num_rows > 0) {
                            while ($advisor = $result->fetch_assoc()) {
                                $name = $advisor['firstname'] . ' ' . $advisor['lastname'];
                                $email = $advisor['email'];
                                $office = $advisor['office'];
                                $phonenumber = $advisor['phonenumber'];
                                ?>
                                <div class="advisor-card" style="margin-bottom: 1em; border-bottom: 1px solid #ccc; padding-bottom: 1em;">
                                    <p><strong>Name:</strong> <?php echo htmlspecialchars($name); ?></p>
                                    <p><strong>Email:</strong> <?php echo htmlspecialchars($email); ?></p>
                                    <p><strong>Office:</strong> <?php echo htmlspecialchars($office); ?></p>
                                    <p><strong>Phone Number:</strong> <?php echo htmlspecialchars($phonenumber); ?></p>
                                </div>
                                <?php
                            }
                        } else {
                            echo "<p>No advisor information found.</p>";
                        }
                        ?>

                    </div>
                </div>
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
                    <div div class="tab-content" id="organizationAdd" style="display: none;">
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
            </div>
        </div>

        <script src="scripts.js"></script>
    </body>
</html>