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
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Dashboard</title>
    <link rel="stylesheet" href="../../assets/css/style.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="shortcut icon" href="../../assets/images/favicon.ico" />
</head>
<body class="advisor">

    <!-- Faculty Dashboard Header -->
    <img src="../../assets/images/cameron.png" alt="Logo">

    <!-- Tabs Navigation -->
    <div class="tabs">
        <div class="tab" onclick="showContent('Faculty Information')">Faculty Information</div>
        <div class="tab" onclick="showContent('Class and Schedule')">Class and Schedule</div>
        <div class="tab" onclick="showContent('Advisees')">Advisees</div>
        <div class="tab" onclick="showContent('Contact')">Contact</div>
        <div class="tab" onclick="showContent('Logout')">Logout</div>
    </div>

    <!-- Faculty Information Section -->
    <div id="Faculty Information" class="content active">
        <h2>Faculty Information</h2>
        <div class="faculty-info">
            <form method="POST" action="update_faculty_info.php"> <!-- This form can post data to a PHP script to update the information -->
                <label for="faculty-name">Name:</label>
                <input type="text" id="faculty-name" name="faculty_name" placeholder="Enter faculty name" value="<?php echo htmlspecialchars($_SESSION['faculty_name'] ?? ''); ?>" required>

                <label for="faculty-department">Department:</label>
                <input type="text" id="faculty-department" name="faculty_department" placeholder="Enter department" value="<?php echo htmlspecialchars($_SESSION['faculty_department'] ?? ''); ?>" required>

                <label for="faculty-email">Email:</label>
                <input type="email" id="faculty-email" name="faculty_email" placeholder="Enter email" value="<?php echo htmlspecialchars($_SESSION['faculty_email'] ?? ''); ?>" required>

                <label for="faculty-phone">Phone:</label>
                <input type="text" id="faculty-phone" name="faculty_phone" placeholder="Enter phone number" value="<?php echo htmlspecialchars($_SESSION['faculty_phone'] ?? ''); ?>" required>

                <label for="faculty-office">Office Location:</label>
                <input type="text" id="faculty-office" name="faculty_office" placeholder="Enter office location" value="<?php echo htmlspecialchars($_SESSION['faculty_office'] ?? ''); ?>" required>

                <button type="submit">Update Information</button>
            </form>
        </div>
    </div>

    <!-- Class and Schedule Section -->
    <div id="Class and Schedule" class="content">
        <h2>Class and Schedule</h2>
        <p>Here you can view your classes and schedule for the upcoming semester.</p>
        <!-- Optionally, fetch and display schedule from database -->
    </div>

    <!-- Advisees Section -->
    <div id="Advisees" class="content">
        <h2>Advisees</h2>
        <p>This section will list your advisees and allow you to manage their academic progress.</p>
        <!-- Optionally, fetch and display advisees from database -->
    </div>

    <!-- Contact Section -->
    <div id="Contact" class="content">
        <h2>Contact</h2>
        <p>This section will display your contact information and possibly allow students to contact you via email.</p>
    </div>

    <!-- Logout Section -->
    <div id="Logout" class="content">
        <h2>Logout</h2>
        <p>Are you sure you want to log out?</p>
        <form method="POST" action="logout.php">
            <button type="submit">Logout</button>
        </form>
    </div>

    <script>
        // Function to switch between tabs
        function showContent(theme) {
            const contents = document.querySelectorAll('.content');
            contents.forEach(content => {
                content.classList.remove('active');
            });
            document.getElementById(theme).classList.add('active');
            
            const tabs = document.querySelectorAll('.tab');
            tabs.forEach(tab => {
                tab.setAttribute('aria-selected', 'false');
            });
            document.querySelector(`.tab[onclick="showContent('${theme}')"]`).setAttribute('aria-selected', 'true');
        }
    </script>

</body>
</html>
