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

// Get building name
$buildingNameQuery = $conn->prepare("SELECT buildingdesc FROM building WHERE buildingid = ?");
$buildingNameQuery->bind_param("i", $buildingId);
$buildingNameQuery->execute();
$buildingNameResult = $buildingNameQuery->get_result();
$buildingName = $buildingNameResult->fetch_assoc()['buildingdesc'] ?? "Unknown";
$buildingNameQuery->close();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Rooms</title>
    <link rel="stylesheet" href="../../assets/css/style.css" />
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="#" />
</head>

<body class="admin">
    <!-- Sidebar -->
    <ul class="sidebar">
        <img src="../../assets/images/cameron.png" class="logo">
        <div>
            <li><a href="../frontend/admin_home.php">Admin Home</a></li>
        </div>
    </ul>

    <!-- Content Container -->
    <div class="action-box">
        <div class="tabs">
            <ol>
                <li class="active">
                    <span class="text">Manage Rooms for <?= htmlspecialchars($buildingName) ?></span>
                </li>
            </ol>
        </div>

        <div class="content">
            <div class="tab_wrap">
                <!-- Add Room Form -->
                <form method="post" class="room-form">
                    <div class="form-group">
                        <label for="roomdesc">Room Name:</label>
                        <input type="text" id="roomdesc" name="roomdesc" required>
                    </div>

                    <div class="form-group">
                        <label for="isactive">Active:</label>
                        <input type="checkbox" id="isactive" name="isactive" checked>
                    </div>

                    <div class="form-group">
                        <button type="submit">Add Room</button>
                    </div>
                </form>


                <!-- Rooms Table -->
                <div class="table-container">
                    <table border="1" class="styled-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Room</th>
                                <th>Active</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $query = $conn->prepare("SELECT roomid, roomdesc, isactive FROM room WHERE buildingid = ?");
                            $query->bind_param("i", $buildingId);
                            $query->execute();
                            $result = $query->get_result();

                            while ($row = $result->fetch_assoc()):
                                $activeText = $row['isactive'] ? 'Yes' : 'No';
                            ?>
                                <tr>
                                    <td><?= $row['roomid'] ?></td>
                                    <td><?= htmlspecialchars($row['roomdesc']) ?></td>
                                    <td><?= $activeText ?></td>
                                    <td>
                                        <button onclick="editRoom(<?= $row['roomid'] ?>)">Edit</button>
                                        <button onclick="deleteRoom(<?= $row['roomid'] ?>)">Delete</button>
                                    </td>
                                </tr>
                            <?php endwhile;
                            $query->close();
                            $conn->close();
                            ?>
                        </tbody>
                    </table>
                </div>
                <br>
                <a href="../frontend/admin_home.php">Go back</a>
            </div>
        </div>
    </div>

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
</body>
</html>
