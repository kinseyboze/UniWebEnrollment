<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

$sql = "
    SELECT b.buildingid, b.buildingdesc, b.orderby, b.isactive, 
           COUNT(r.roomid) AS room_count
    FROM building b
    LEFT JOIN room r ON b.buildingid = r.buildingid
    GROUP BY b.buildingid
    ORDER BY b.orderby ASC
";

$result = $conn->query($sql);

echo "<h2>Manage Buildings</h2>";
echo "<button onclick=\"location.href='add_building.php'\">Add New Building</button>";
echo "<table border='1'>
<tr>
    <th>ID</th>
    <th>Description</th>
    <th>Order</th>
    <th>Rooms</th>
    <th>Active</th>
    <th>Actions</th>
</tr>";

while ($row = $result->fetch_assoc()) {
    $isActive = unpack("C", $row['isactive'])[1] ? 'Yes' : 'No';

    echo "<tr>
        <td>{$row['buildingid']}</td>
        <td>{$row['buildingdesc']}</td>
        <td>{$row['orderby']}</td>
        <td>{$row['room_count']}</td>
        <td>{$isActive}</td>
        <td>
            <a href='edit_building.php?id={$row['buildingid']}'>Edit</a> | 
            <a href='delete_building.php?id={$row['buildingid']}' onclick='return confirm(\"Are you sure?\")'>Delete</a>
        </td>
    </tr>";
}
echo "</table>";
?>
