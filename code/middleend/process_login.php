<?php
// process_login.php

// Include database connection
include('db_connect.php');

// Start the session to track the logged-in user
session_start();

// Check if the form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and get user input
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);
    
    // Query to check if the username exists in the database
    $sql = "SELECT * FROM login WHERE username = '$username'"; 
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {

        $row = $result->fetch_assoc();

        // Check if the plain-text password matches
        if ($password == $row['password']) { 

            // Password is correct, set session variables
            $_SESSION['roleid'] = $row['roleid']; 

            $_SESSION['username'] = $row['username']; 

            // Redirect user to their respective home page 
            switch ($row['role']) {
                case "admin":
                    header("Location: ../frontend/admin_home.html");
                    exit();
                case "chair":
                    header("Location: ../frontend/");
                    exit();
                case "faculty":
                    header("Location: ../frontend/faculty_home.html");
                    exit();
                case "advisor":
                    header("Location: ../frontend/advisor.php");
                    exit();
                case "student":
                    header("Location: ../frontend/student_home.php");
                    exit();
                default:
                    header("Location: ../frontend/login.html");
                    exit();
            }
        } else {
            // If password is incorrect
            echo "Incorrect password. Please try again.";
            header("Location: ../frontend/login.html");
            exit();
        }
    } else {
        // Username not found
        echo "No account found with this username.";
        header("Location: ../frontend/login.html");
        exit();
    }
}

// Close the database connection
$conn->close();
?>

