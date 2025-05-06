<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

if (!isset($_SESSION['userid'])) {
    echo "You must be logged in.";
    exit;
}

$student_id = $_POST['studentid'] ?? $_SESSION['roleid']; // updating to pass student ID
$course_id = $_POST['courseid'] ?? null;

// Check if already enrolled
$check = $conn->prepare("SELECT * FROM enrollment WHERE studentid = ? AND courseid = ?");
$check->bind_param("ii", $student_id, $course_id);
$check->execute();
$result = $check->get_result();

if ($result->num_rows > 0) {
    echo "Already enrolled.";
    exit;
}

$sql = "SELECT facultyid FROM course WHERE courseid = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $course_id); // 'i' for integer
$stmt->execute();

// Get the result
$result = $stmt->get_result();

if ($row = $result->fetch_assoc()) {
    $faculty_id = $row['facultyid'];
} else {
    echo "No course found with that ID.";
    exit;
}

// Insert new enrollment - made to navigate for advisor & student
$stmt = $conn->prepare("INSERT INTO enrollment (facultyid, studentid, courseid) VALUES (?, ?, ?)");
$stmt->bind_param("iii", $faculty_id, $student_id, $course_id);

if ($stmt->execute()) {
    echo "Course sucessfully added.";
    if (isset($_POST['studentid'])) {
        // Advisor initiated action
        echo '<a href="../frontend/advisor.php#advisees"><button>Back to Advisor Dashboard</button></a>';
    } else {
        // Student initiated action
        echo '<a href="../frontend/student_home.php"><button>Back to Courses</button></a>';
    }} else {
    echo "Failed to enroll: " . $conn->error;
}
?>
