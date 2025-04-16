<?php
include "db_connect.php";

$role = isset($_GET['role']) ? $_GET['role'] : 'student';
$id   = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($id <= 0) {
    die("Invalid ID.");
}

// 1. Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $firstname = $_POST['firstname'];
    $lastname  = $_POST['lastname'];
    $email     = $_POST['email'];

    if ($role == 'student') {
        $sql = "UPDATE student SET firstname = ?, lastname = ?, email = ? WHERE studentid = ?";
    } else {
        $sql = "UPDATE faculty SET firstname = ?, lastname = ?, email = ? WHERE id = ?";
    }

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssi", $firstname, $lastname, $email, $id);

    if ($stmt->execute()) {
        echo "User updated successfully. <a href='manage_user.php?role=$role'>Back</a>";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
    exit;
}

// 2. Load user info for form
if ($role == 'student') {
    $sql = "SELECT firstname, lastname, email FROM student WHERE studentid = ?";
} else {
    $sql = "SELECT firstname, lastname, email FROM faculty WHERE id = ?";
}

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

if (!$user) {
    die("User not found.");
}
?>

<h2>Edit <?= ucfirst($role) ?></h2>
<form method="POST">
    First Name: <input type="text" name="firstname" value="<?= $user['firstname'] ?>" required><br>
    Last Name: <input type="text" name="lastname" value="<?= $user['lastname'] ?>" required><br>
    Email: <input type="email" name="email" value="<?= $user['email'] ?>" required><br>
    <button type="submit">Save Changes</button>
</form>