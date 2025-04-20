<?php
include "db_connect.php";

$role = isset($_GET['role']) ? $_GET['role'] : 'student';
$id   = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($id <= 0) {
    die("Invalid ID.");
}

if ($role == 'student') {
    $sql = "DELETE FROM student WHERE studentid = ?";
} else {
    $sql = "DELETE FROM faculty WHERE id = ?";
}

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo "User deleted successfully. <a href='../frontend/admin_home.php#accounts'>Back</a>";
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>