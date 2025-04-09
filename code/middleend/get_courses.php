<?php
include('db_connect.php');

$query = "SELECT * FROM course";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($row['courseid']) . "</td>";
        echo "<td>" . htmlspecialchars($row['coursedesc']) . "</td>";
        echo "<td>" . htmlspecialchars($row['building']) . "</td>";
        echo "<td>" . htmlspecialchars($row['room']) . "</td>";
        echo "<td>" . htmlspecialchars($row['time']) . "</td>";
        echo "<td>" . htmlspecialchars($row['days']) . "</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='3'>No courses found</td></tr>";
}
