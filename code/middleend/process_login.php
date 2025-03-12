<?php
// process_login.php

// Include database connection
include('db_connect.php');

// Start the session to track the logged-in user
session_start();

// Check if the form was submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and get user input
    $email = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);
    
    // Query to check if the username exists in the database
    $sql = "SELECT * FROM login WHERE username = '$username'"; 
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
       
        $row = $result->fetch_assoc();

        // Check if the plain-text password matches
        if ($password == $row['password']) { 

            // Password is correct, set session variables

            $_SESSION['id'] = $row['id']; 
            $_SESSION['username'] = $row['username']; 

            // Redirect user to their respective home page 
            
            if ($row['role'] == 'faculty') {
                header("Location: code/faculty_home.html"); // THIS WILL NEED TO BE REPLACED
            } else if ($row['role'] == 'student') {
                header("Location: code/student_home.html"); // THIS WILL NEED TO BE REPLACED
            }
            exit(); // Always call exit after header redirection to stop further code execution
        } else {
            // If the password is incorrect
            echo "Invalid credentials.";
        }
    } else {
        // If the email does not exist
        echo "No account found with this email.";
    }
}

// Close the database connection
$conn->close();
?>
