<?php
include "db_connect.php";
$id = $_GET['id'];

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $desc = $_POST['buildingdesc'];
    $order = $_POST['orderby'];
    $isactive = isset($_POST['isactive']) ? 1 : 0;

    $update = "UPDATE building SET buildingdesc=?, orderby=?, isactive=? WHERE buildingid=?";
    $stmt = $conn->prepare($update);
    $stmt->bind_param("siii", $desc, $order, $isactive, $id);

    if ($stmt->execute()) {
        header("Location: ../frontend/admin_home.php");
        exit;
    } else {
        echo "Update error: " . $stmt->error;
    }
} else {
    $sql = "SELECT * FROM building WHERE buildingid=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_assoc();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Building</title>
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

    <!-- Main Content -->
    <div class="action-box">
        <div class="tabs">
            <ol>
                <li class="active"><span class="text">Edit Building</span></li>
            </ol>
        </div>

        <div class="content">
            <div class="tab_wrap">
                <!-- Edit Building Form -->
                <form method="POST" class="room-form">
                    <div class="form-group">
                        <label for="buildingdesc">Building Name:</label>
                        <input type="text" id="buildingdesc" name="buildingdesc" value="<?= htmlspecialchars($result['buildingdesc']) ?>" required>
                    </div>

                    <div class="form-group">
                        <label for="orderby">Order By:</label>
                        <input type="number" id="orderby" name="orderby" value="<?= htmlspecialchars($result['orderby']) ?>" required>
                    </div>

                    <div class="form-group">
                        <label for="isactive">Active:</label>
                        <input type="checkbox" id="isactive" name="isactive" <?= $result['isactive'] ? 'checked' : '' ?>>
                    </div>
                    <div class="form-group">
                        <button type="submit">Save Changes</button>
                        <!--a href="manage_buildings.php" class="button-link">Cancel</a>
                    </div> -->
                </form>
            </div>
        </div>
    </div>
</body>
</html>
