<?php
include "db_connect.php";

$internid = $_POST['internid'] ?? '';
$interninfo = $_POST['interninfo'] ?? '';
$interntype = $_POST['interntype'] ?? '';
$contact    = $_POST['contact'] ?? '';
$startdate  = $_POST['startdate'] ?? '';
$enddate    = $_POST['enddate'] ?? '';

$stmt = $conn->prepare("INSERT INTO internship (internid, interninfo, interntype, contact, startdate, enddate) VALUES (?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssssss", $internid, $interninfo, $interntype, $contact, $startdate, $enddate);

if ($stmt->execute()) {
    echo "Internship added successfully.";
} else {
    // maybe a back button should go here?
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
