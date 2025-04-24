<?php
include('db_connect.php');

$query = "SELECT * FROM internship";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($row['internid']) . "</td>";
        echo "<td>" . htmlspecialchars($row['interninfo']) . "</td>";
        echo "<td>" . htmlspecialchars($row['interntype']) . "</td>";
        echo "<td>" . htmlspecialchars($row['contact']) . "</td>";
        echo "<td>" . htmlspecialchars($row['startdate']) . "</td>";
        echo "<td>" . htmlspecialchars($row['enddate']) . "</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='3'>No Organizations found</td></tr>";
}