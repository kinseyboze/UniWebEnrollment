<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
include "db_connect.php";

// get course with id 
$courseid = isset($_GET['courseid']) ? intval($_GET['courseid']) : 0;

// if the course is not found then...
if ($courseid <= 0) {
    die("Invalid request: Course ID missing or not numeric <a href='../frontend/admin_home.php#courses'>Back</a>");
}

// check if any students are enrolled in found course
$check_sql = "SELECT COUNT(*) AS total FROM enrollment WHERE courseid = ?";
$check_stmt = $conn->prepare($check_sql);
$check_stmt->bind_param("i", $courseid);
$check_stmt->execute();
$check_result = $check_stmt->get_result();
$row = $check_result->fetch_assoc();

// if there is a student enrolled then...
if ($row['total'] > 0) {
    echo "Cannot delete course: $row[total] student(s) are still enrolled in this course. <a href='../frontend/admin_home.php#courses'>Back</a>";
    $check_stmt->close();
    $conn->close();
    exit;
}
$check_stmt->close();

// if no students then remove from courses table
$delete_sql = "DELETE FROM course WHERE courseid = ?";
$delete_stmt = $conn->prepare($delete_sql);
$delete_stmt->bind_param("i", $courseid);

// if course was able to be deleted
if ($delete_stmt->execute()) {
    echo "Course deleted successfully. <a href='../frontend/admin_home.php#courses'>Back</a>";
} else {
    echo "Error: " . $delete_stmt->error;
}

$delete_stmt->close();
$conn->close();
?>