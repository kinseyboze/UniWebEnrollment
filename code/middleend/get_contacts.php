<?php
include "db_connect.php";

header('Content-Type: application/json');

$sql = "SELECT firstname, lastname, office, email, phonenumber FROM faculty";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $contacts = [];
    while ($row = $result->fetch_assoc()) {
        $contacts[] = $row;
    }

    // Return the results as JSON
    echo json_encode($contacts);
} else {
    echo json_encode([]); // return an empty array
}

$conn->close();
?>
