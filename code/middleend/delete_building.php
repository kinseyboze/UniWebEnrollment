<?php
include "db_connect.php";
$id = $_GET['id'];

// Check if rooms exist under this building
$checkRooms = $conn->prepare("SELECT COUNT(*) FROM room WHERE buildingid = ?");
$checkRooms->bind_param("i", $id);
$checkRooms->execute();
$checkRooms->bind_result($count);
$checkRooms->fetch();
$checkRooms->close();

if ($count > 0) {
    echo "<script>alert('Cannot delete building with existing rooms.'); window.location.href='../frontend/your_manage_page.php';</script>";
    exit();
}

$sql = "DELETE FROM building WHERE buildingid = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    header("Location: ../frontend/admin_home.php");   //edit this
} else {
    echo "Delete error: " . $stmt->error;
}
?>
