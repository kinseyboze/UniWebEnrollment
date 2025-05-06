<?php
session_start();
include "db_connect.php";

if (!isset($_SESSION['userid'])) {
    echo "You must be logged in.";
    exit;
}

$student_id = $_POST['studentid'] ?? $_SESSION['roleid'];
$course_id = $_POST['courseid'] ?? null;

if ($student_id && $course_id) {
    $sql = "DELETE FROM enrollment WHERE studentid = ? AND courseid = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $student_id, $course_id);

    if ($stmt->execute()) {
        echo "Course successfully withdrawn.<br>";
        if (isset($_POST['studentid'])) {
            // Advisor initiated action
            echo '<a href="../frontend/advisor.php#advisees"><button>Back to Advisor Dashboard</button></a>';
        } else {
            // Student initiated action
            echo '<a href="../frontend/student_home.php"><button>Back to Courses</button></a>';
            }} else {
        echo "Failed to withdraw: " . $conn->error;
    }

    $stmt->close();
} else {
    echo "Missing student ID or course ID.";
}

$conn->close();
?>