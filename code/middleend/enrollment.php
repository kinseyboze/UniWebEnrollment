<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

if (!isset($_SESSION['userid']) || !isset($_SESSION['role'])) {
    echo "You must be logged in.";
    exit;
}

$faculty_id = $_SESSION['roleid'];
$role = $_SESSION['role']; // get user role

$student_id = $_POST['studentid'] ?? $_SESSION['roleid']; 
$course_id = $_POST['courseid'] ?? null;

if (!$course_id) {
    echo "No course selected.";
    display_back_button($role);
    exit;
}

// Check if already enrolled
$check = $conn->prepare("SELECT * FROM enrollment WHERE studentid = ? AND courseid = ?");
$check->bind_param("ii", $student_id, $course_id);
$check->execute();
$result = $check->get_result();

if ($result->num_rows > 0) {
    echo "Student is already enrolled in this course.";
    display_back_button($role);
    exit;
}

// check if course exists and get faculty id
$sql = "SELECT facultyid FROM course WHERE courseid = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $course_id);
$stmt->execute();
$result = $stmt->get_result();

if ($row = $result->fetch_assoc()) {
    $faculty_id = $row['facultyid'];
} else {
    echo "No course found with that ID.";
    display_back_button($role);
    exit;
}

// check if student exists
$student_check = $conn->prepare("SELECT 1 FROM student WHERE studentid = ?");
$student_check->bind_param("i", $student_id);
$student_check->execute();
$student_check_result = $student_check->get_result();

if ($student_check_result->num_rows === 0) {
    echo "Student ID $student_id does not exist. Cannot enroll.";
    display_back_button($role);
    exit;
}

// Insert new enrollment - made to navigate for advisor & student
$stmt = $conn->prepare("INSERT INTO enrollment (facultyid, studentid, courseid) VALUES (?, ?, ?)");

// insert in enrollment table
$stmt = $conn->prepare("INSERT INTO enrollment (facultyid, studentid, courseid) VALUES (?, ?, ?)");
$stmt->bind_param("iii", $faculty_id, $student_id, $course_id);

if ($stmt->execute()) {
    echo "Course successfully added.";
} else {
    echo "Failed to enroll: " . $conn->error;
}

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