<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

if (!isset($_SESSION['userid']) || !isset($_SESSION['role'])) {
    echo "You must be logged in.";
    exit;
}

$role = $_SESSION['role']; // Get user role
$student_id = $_POST['studentid'] ?? $_SESSION['roleid']; // If advisor provided student ID, use it; else assume student withdrawing self
$course_id = $_POST['courseid'] ?? null;

if (!$course_id) {
    echo "No course selected.";
    display_back_button($role);
    exit;
}

$sql = "DELETE FROM enrollment WHERE studentid = ? AND courseid = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $student_id, $course_id);

if ($stmt->execute()) {
    if ($stmt->affected_rows > 0) {
        echo "Course successfully withdrawn.";
    } else {
        echo "Student was not enrolled in this course.";
    }
} else {
    echo "Failed to withdraw: " . $conn->error;
}

$stmt->close();
$conn->close();

display_back_button($role);

// Helper function to show back button
function display_back_button($role) {
    $url = '';
    $label = '';

    switch ($role) {
        case 'student':
            $url = '../frontend/student_home.php';
            $label = 'Back to Student Dashboard';
            break;
        case 'advisor':
            $url = '../frontend/advisor.php#courses';
            $label = 'Back to Advisor Dashboard';
            break;
        case 'chair':
            $url = '../frontend/chair_home.php';
            $label = 'Back to Chair Dashboard';
            break;
        default:
            $url = '../frontend/login.html';
            $label = 'Back to Home';
    }

    echo "<br><a href='$url'><button>$label</button></a>";
}
?>