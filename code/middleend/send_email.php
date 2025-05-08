<?php
session_start();
include "db_connect.php";

// Check if role is set
if (!isset($_SESSION['role'])) {
    header("Location: ../frontend/login.html");
    exit();
}

// Helper function to get redirect URL based on role
function getRedirectURLByRole($role) {
    switch ($role) {
        case "admin":
            return "../frontend/admin_home.php";
        case "chair":
            return "../frontend/chair_home.php";
        case "faculty":
            return "../frontend/faculty_home.php";
        case "advisor":
            return "../frontend/advisor.php";
        case "student":
            return "../frontend/student_home.php";
        default:
            return "../frontend/login.html";
    }
}

$redirectURL = getRedirectURLByRole($_SESSION['role']);

// Handle POST request
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $recipient = $_POST['recipient'];
    $subject = $_POST['subject'];
    $message = $_POST['message'];

    // Email headers
    $headers = "From: admin@yourdomain.com\r\n";
    $headers .= "Reply-To: admin@yourdomain.com\r\n";
    $headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

    // Only allow valid single recipient
    if (filter_var($recipient, FILTER_VALIDATE_EMAIL)) {
        if (mail($recipient, $subject, $message, $headers)) {
            echo "Email successfully sent to $recipient. <a href='$redirectURL'>Back</a>";
        } else {
            echo "Failed to send email to $recipient. <a href='$redirectURL'>Back</a>";
        }
    } else {
        echo "Invalid email address. <a href='$redirectURL'>Back</a>";
    }

    $conn->close();
} else {
    echo "Invalid request. <a href='$redirectURL'>Back</a>";
}
?>
