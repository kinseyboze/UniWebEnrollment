<?php
include "db_connect.php";

if (!isset($_GET['roomid'])) {
    echo "Room ID not provided.";
    exit;
}

$roomid = $_GET['roomid'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $roomdesc = $_POST['roomdesc'];
    $isactive = isset($_POST['isactive']) ? 1 : 0;
    $buildingid = $_POST['buildingid'];

    $updateSql = "UPDATE room SET roomdesc = ?, isactive = ? WHERE roomid = ?";
    $stmt = $conn->prepare($updateSql);
    $stmt->bind_param("sii", $roomdesc, $isactive, $roomid);
    $stmt->execute();
    $stmt->close();

    header("Location: view_rooms.php?buildingid=$buildingid");
    exit;
}

$sql = "SELECT * FROM room WHERE roomid = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $roomid);
$stmt->execute();
$result = $stmt->get_result();
$room = $result->fetch_assoc();
$stmt->close();
?>

<h2>Edit Room</h2>
<form method="POST">
    <input type="hidden" name="buildingid" value="<?= $room['buildingid'] ?>">
    <label>
        Room Description:
        <input type="text" name="roomdesc" value="<?= htmlspecialchars($room['roomdesc']) ?>" required>
    </label><br>
    <label>
        Active:
        <input type="checkbox" name="isactive" <?= $room['isactive'] ? 'checked' : '' ?>>
    </label><br><br>
    <button type="submit">Save Changes</button>
    <button type="button" onclick="history.back()">Cancel</button>
</form>
