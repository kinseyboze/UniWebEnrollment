<?php
include "db_connect.php";

$desc = $_POST['buildingdesc'];
$order = $_POST['orderby'];
$isactive = isset($_POST['isactive']) ? 1 : 0;

$sql = "INSERT INTO building (buildingdesc, orderby, isactive) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sii", $desc, $order, $isactive);

if ($stmt->execute()) {
    header("Location: ../frontend/your_manage_page.php"); // fix
} else {
    echo "Error: " . $stmt->error;
}
?>
