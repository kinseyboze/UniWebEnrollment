<?php
// Include the database connection if needed
session_start(); // Start the session to manage login or other session-related tasks

// includes access to the database
include('../middleend/db_connect.php');

// makes sure the person logged in before accessing a webpage
if (!isset($_SESSION['roleid'])) {
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

$firstname = $faculty['firstname'];
$lastname = $faculty['lastname'];
$fullname = $firstname . ' ' . $lastname;
$office = $faculty['office'];
$email = $faculty['email'];
$phonenumber = $faculty['phonenumber'];
$facultyrole = $faculty['facultyrole'];


?>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../../assets/css/style.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="shortcut icon" href="#" />
    </head>

    <body class="faculty">
        <ul class="sidebar">
            <img src="../../assets/images/cameron.png" class="logo">
            <li><a>Faculty</a></li>
            <li><a>CS Department</a></li>
            <li><a href="#"id="contact-tab">Contact</a></li>
            <li><a href="#"><i class="bx bx-log-out"></i>Logout</a></li>
        </ul>
      
        <div class="action-box">
            <div class="tabs"> 
                <ol>

                    <li class="active">
                        <span class="icon"><i class='bx bxs-book'></i></span>
                        <span class="text">Faculty Info</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">Student</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">Advisor</span>
                    </li>

                    <!-- <li>
                        <span class="icon"><i class='bx bxs-chalkboard'></i></span>
                        <span class="text">Courses</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-user-pin'></i></span>
                        <span class="text">Manage</span>
                    </li> -->
                </ol>
            </div>

            <div class="content">
            <div class="tab_wrap" style="display: block;">
                    <div class="title">Faculty Information</div>
                    <div class="tab-content">
                        <p><strong>Name:</strong> <?php echo htmlspecialchars($fullname); ?></p>
                        <p><strong>Role:</strong> <?php echo htmlspecialchars($facultyrole); ?></p>
                        <p><strong>Office:</strong> <?php echo htmlspecialchars($office); ?></p>
                        <p><strong>Email:</strong> <?php echo htmlspecialchars($email); ?></p>
                        <p><strong>Phone Number:</strong> <?php echo htmlspecialchars($phonenumber); ?></p>
                    </div>
                </div>
                <!-- Tyler -->
                <div class="tab_wrap" style="display: none;">
                    <div class="title">Student Information</div>
                    <div class="tab-content">
                        <p>student information goes here
                        </p>
                    </div>
                </div>
                <!-- Tyler -->
                 
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

                <!-- <div class="tab_wrap" style="display: none;">
                    <div class="title">Course Information</div>
                    <div class="tab-content">
                        <p>course information goes here
                        </p>
                    </div>
                </div> -->

                <!-- <div class="tab_wrap" style="display: none;">
                    <div class="title">Management Information</div>
                    <div class="tab-content">
                        <p>management information goes here
                        </p>
                    </div>
                </div> -->
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