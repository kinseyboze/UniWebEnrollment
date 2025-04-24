<?php
include "db_connect.php";

$orgid    = $_POST['orgid'];
$orgname  = $_POST['orgname'];
$orgpos   = $_POST['orgpos'];
$dpt      = $_POST['dpt'];
$contact  = $_POST['contact'];

$stmt = $conn->prepare("INSERT INTO organization (orgid, orgname, orgpos, dpt, contact) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("sssss", $orgid, $orgname, $orgpos, $dpt, $contact);

if ($stmt->execute()) {
    echo "Organization added successfully.";
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>