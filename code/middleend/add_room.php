<?php
include "db_connect.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $roomdesc = $_POST['roomdesc'];
    $orderby = $_POST['orderby'];
    $isactive = isset($_POST['isactive']) ? 1 : 0;
    $buildingid = intval($_POST['buildingid']);

    $sql = "INSERT INTO room (roomdesc, orderby, isactive, buildingid)
            VALUES (?, ?, ?, ?)";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("siii", $roomdesc, $orderby, $isactive, $buildingid);

    if ($stmt->execute()) {
        header("Location: view_rooms.php?buildingid=$buildingid");
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }
}
?>

<form method="POST" action="">
    <input type="hidden" name="buildingid" value="<?php echo $_GET['buildingid']; ?>">
    <input type="text" name="roomdesc" placeholder="Room Description" required>
    <input type="number" name="orderby" placeholder="Order" required>
    <label>
        Active:
        <input type="checkbox" name="isactive" value="1" checked>
    </label>
    <button type="submit">Add Room</button>
</form>
