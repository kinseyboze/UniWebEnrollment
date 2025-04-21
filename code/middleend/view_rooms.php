<?php
include "db_connect.php";

$buildingId = $_GET['buildingid'] ?? 0;

// Handle delete request
if (isset($_GET['delete'])) {
    $deleteId = $_GET['delete'];
    $deleteStmt = $conn->prepare("DELETE FROM room WHERE roomid = ?");
    $deleteStmt->bind_param("i", $deleteId);
    $deleteStmt->execute();
    $deleteStmt->close();

    // Redirect to prevent repeated delete on refresh
    header("Location: view_rooms.php?buildingid=$buildingId");
    exit();
}

// Handle new room submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $roomDesc = $_POST['roomdesc'];
    $isActive = isset($_POST['isactive']) ? 1 : 0;

    $stmt = $conn->prepare("INSERT INTO room (roomdesc, buildingid, isactive) VALUES (?, ?, ?)");
    $stmt->bind_param("sii", $roomDesc, $buildingId, $isActive);
    $stmt->execute();
    $stmt->close();
}

// Get the building name
$buildingNameQuery = $conn->prepare("SELECT buildingdesc FROM building WHERE buildingid = ?");
$buildingNameQuery->bind_param("i", $buildingId);
$buildingNameQuery->execute();
$buildingNameResult = $buildingNameQuery->get_result();
$buildingName = $buildingNameResult->fetch_assoc()['buildingdesc'] ?? "Unknown";
$buildingNameQuery->close();

// Add Room Form
echo "<h2>Manage Rooms for {$buildingName}</h2>";
echo "<form method='POST' style='margin-bottom: 20px;'>
        <input type='text' name='roomdesc' placeholder='Room Name/Number' required>
        <label><input type='checkbox' name='isactive' checked> Active</label>
        <button type='submit'>Add Room</button>
      </form>";

// Show Room Table
$query = $conn->prepare("SELECT roomid, roomdesc, isactive FROM room WHERE buildingid = ?");
$query->bind_param("i", $buildingId);
$query->execute();
$result = $query->get_result();

echo "<table border='1'>
        <tr>
            <th>ID</th>
            <th>Room</th>
            <th>Active</th>
            <th>Action</th>
        </tr>";

while ($row = $result->fetch_assoc()) {
    $activeText = ord($row['isactive']) ? 'Yes' : 'No';
    echo "<tr>
            <td>{$row['roomid']}</td>
            <td>{$row['roomdesc']}</td>
            <td>{$activeText}</td>
            <td>
                <button onclick=\"editRoom({$row['roomid']})\">Edit</button>
                <button onclick=\"deleteRoom({$row['roomid']})\">Delete</button>
            </td>
          </tr>";
}
echo "</table>";

echo "<br><a href='../frontend/admin_home.php'>Go back</a>"; 

$query->close();
$conn->close();
?>

<script>
function editRoom(roomId) {
    window.location.href = `edit_room.php?roomid=${roomId}`;
}

function deleteRoom(roomId) {
    if (confirm("Are you sure you want to delete this room?")) {
        const buildingId = <?= json_encode($buildingId) ?>;
        window.location.href = `view_rooms.php?buildingid=${buildingId}&delete=${roomId}`;
    }
}
</script>


