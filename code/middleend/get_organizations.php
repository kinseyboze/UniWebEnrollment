<?php
include('db_connect.php');

$query = "SELECT * FROM organization";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($row['orgid']) . "</td>";
        echo "<td>" . htmlspecialchars($row['orgname']) . "</td>";
        echo "<td>" . htmlspecialchars($row['orgpos']) . "</td>";
        echo "<td>" . htmlspecialchars($row['dpt']) . "</td>";
        echo "<td>" . htmlspecialchars($row['contact']) . "</td>";
        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='3'>No Organizations found</td></tr>";
}