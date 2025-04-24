<?php
include "db_connect.php";

$courseid = isset($_GET['courseid']) ? intval($_GET['courseid']) : 0;

if ($courseid <= 0) {
    die("Invalid request: Course ID missing or not numeric.");
}

$delete_sql = "DELETE FROM course WHERE courseid = ?";
$delete_stmt = $conn->prepare($delete_sql);
$delete_stmt->bind_param("i", $courseid);

if ($delete_stmt->execute()) {
    echo "Course deleted successfully. <a href='../frontend/admin_home.php#courses'>Back</a>";
} else {
    echo "Error: " . $delete_stmt->error;
}

$delete_stmt->close();
$conn->close();
?>