<?php
include('db_connect.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $buildingdesc = $_POST['buildingdesc'];
    $roomcount = intval($_POST['roomcount']);
    $isactive = isset($_POST['isactive']) ? 1 : 0;

    // Insert building
    // Get the current max order value
    $orderResult = $conn->query("SELECT MAX(orderby) AS max_order FROM building");
    $orderRow = $orderResult->fetch_assoc();
    $nextOrder = $orderRow['max_order'] + 1;
    
    // Insert building with correct order
    $stmt = $conn->prepare("INSERT INTO building (buildingdesc, orderby, isactive) VALUES (?, ?, ?)");
    $stmt->bind_param("sii", $buildingdesc, $nextOrder, $isactive);


    if ($stmt->execute()) {
        $buildingid = $stmt->insert_id;

        // Insert specified number of rooms
        for ($i = 1; $i <= $roomcount; $i++) {
            $roomdesc = "Room $i";
            $order = $i;
            $room_active = 1;

            $room_stmt = $conn->prepare("INSERT INTO room (roomdesc, orderby, isactive, buildingid) VALUES (?, ?, ?, ?)");
            $room_stmt->bind_param("siii", $roomdesc, $order, $room_active, $buildingid);
            $room_stmt->execute();
        }

        echo "<script>alert('Building and rooms added successfully'); window.location.href = '../frontend/admin_home.php';</script>";
    } else {
        echo "<script>alert('Failed to add building.'); window.history.back();</script>";
    }

    $stmt->close();
    $conn->close();
}
?>

