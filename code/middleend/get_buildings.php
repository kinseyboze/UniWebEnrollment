<?php
include "db_connect.php";

$sql = "
    SELECT b.buildingid, b.buildingdesc, b.orderby, b.isactive, COUNT(r.roomid) AS roomcount
    FROM building b
    LEFT JOIN room r ON b.buildingid = r.buildingid
    GROUP BY b.buildingid, b.buildingdesc, b.orderby, b.isactive
    ORDER BY b.orderby ASC
";

$result = $conn->query($sql);

echo "<table border='1'>
        <tr>
            <th>ID</th>
            <th>Description</th>
            <th>Rooms</th>
            <th>Order</th>
            <th>Active</th>
            <th>Actions</th>
        </tr>";

while ($row = $result->fetch_assoc()) {
    $isActive = ord($row['isactive']) ? "Yes" : "No";
    echo "<tr>
            <td>{$row['buildingid']}</td>
            <td>{$row['buildingdesc']}</td>
            <td>{$row['roomcount']}</td>
            <td>{$row['orderby']}</td>
            <td>{$isActive}</td>
            <td>
                <button onclick=\"editBuilding({$row['buildingid']})\">Edit</button>
                <button onclick=\"deleteBuilding({$row['buildingid']})\">Delete</button>
            </td>
          </tr>";
}
echo "</table>";
?>
