<?php
session_start();
include('../middleend/db_connect.php');

// Check if the form is submitted before accessing the POST variables
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get username and password from POST request
    $username = isset($_POST['username']) ? $_POST['username'] : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';

    // Ensure the database connection is working
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Use prepared statements to prevent SQL injection
    $stmt = $conn->prepare("SELECT * FROM user WHERE username = ? AND password = ? LIMIT 1");

    // Check if the query preparation was successful
    if ($stmt === false) {
        // Output error message if the statement preparation fails
        die("MySQLi prepare error: " . $conn->error);
    }

    // Bind the parameters for username and password
    $stmt->bind_param("ss", $username, $password);  // "ss" means two string parameters

    // Execute the statement
    $stmt->execute();

    // Get the result
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Fetch the user data from the result
        $user = $result->fetch_assoc();

        // Set session variables
        $_SESSION['userid'] = $user['userid'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['role'] = $user['role'];  // Store role in session

        // Redirect based on role
        if ($user['role'] == 'advisor') {
            header("Location: advisor.php"); // Advisor Dashboard
        } elseif ($user['role'] == 'admin') {
            header("Location: admin_dashboard.php"); // Admin Dashboard
        } elseif ($user['role'] == 'faculty') {
            header("Location: faculty_faculty.php"); // Faculty Dashboard
        } elseif ($user['role'] == 'student') {
            header("Location: student_home.php"); // Student Dashboard
        } else {
            // Redirect to a default page if the role is not recognized
            header("Location: login.php");
        }
        exit();
    } else {
        // If login fails, redirect to login page with an error
        $_SESSION['error'] = "Invalid username or password";
        header("Location: login.php");
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cameron University</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body class="login">

<header>
    <div class="background">
        <div class="content-login">
            <img src="../../assets/images/cameron.png" width="200" height="200" class="center" alt="Cameron University Logo">
            <div class="text">
                <h2>Welcome<br><span>To UniEnroll.</span></h2>
                <p>We come from different backgrounds, with diverse interests and unique learning styles. Finding classes that fit your individual needs isn't a challenge at Cameron University. Our small campus and dedicated faculty ensure that there's always someone close by to guide you on your journey. Your success is our success and your education is our mission. At Cameron, you're not a number ... you're part of the family.</p>
            </div>
        </div>
        <div class="box">
            <div class="login-box">
                <!-- Form that posts to the same page to process login -->
                <form action="login.php" method="POST">
                    <h2>Sign In</h2>
                    
                    <!-- Username Input -->
                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-envelope'></i></span>
                        <input type="text" name="username" required>
                        <label>Username</label>                        
                    </div>

                    <!-- Password Input -->
                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-lock-alt'></i></span>
                        <input type="password" name="password" required>
                        <label>Password</label>                        
                    </div>

                    <div class="forgot">
                        <label><input type="checkbox" name="remember"> Remember me</label>
                        <a href="#">Forgot password?</a>
                    </div>

                    <!-- Display error message if login fails -->
                    <?php if (isset($error_message)): ?>
                        <p class="error-message"><?php echo $error_message; ?></p>
                    <?php endif; ?>

                    <!-- Submit Button -->
                    <button type="submit" class="signinbutton">Sign In</button>
                </form>
            </div>
        </div>
    </div>
</header>

</body>
</html>
