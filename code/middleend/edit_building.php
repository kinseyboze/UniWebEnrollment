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
    } else {
        echo "Update error: " . $stmt->error;
    }
} else {
    $sql = "SELECT * FROM building WHERE buildingid=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result()->fetch_assoc();
    ?>

    <form method="POST">
        <input type="text" name="buildingdesc" value="<?= $result['buildingdesc'] ?>" required>
        <input type="number" name="orderby" value="<?= $result['orderby'] ?>" required>
        <label>
            Active:
            <input type="checkbox" name="isactive" value="1" <?= $result['isactive'] ? 'checked' : '' ?>>
        </label>
        <button type="submit">Save</button>
    </form>

    <?php
}
?>
