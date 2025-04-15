<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

$role = isset($_GET['role']) ? $_GET['role'] : 'student';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $email = $_POST['email'];

    if ($role === 'student') {
        $classification = $_POST['classification'];
        $degree = $_POST['degree'];
        $major = $_POST['major'];
        $minor = $_POST['minor'];

        $stmt = $conn->prepare("INSERT INTO student (firstname, lastname, email, classification, degree, major, minor) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssss", $firstname, $lastname, $email, $classification, $degree, $major, $minor);
    } else {
        $facultyrole = $role === 'advisor' || $role === 'chair' || $role === 'admin' ? ucfirst($role) : 'Faculty';
        
        $stmt = $conn->prepare("INSERT INTO faculty (firstname, lastname, email, facultyrole) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $firstname, $lastname, $email, $facultyrole);
    }

    if ($stmt->execute()) {
        echo "User added successfully! <a href='manage_user.php?role=$role'>Go Back</a>";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
    exit;
}
?>

<h2>Add <?= ucfirst($role) ?></h2>
<form method="post">
    <label>First Name: <input type="text" name="firstname" required></label><br>
    <label>Last Name: <input type="text" name="lastname" required></label><br>
    <label>Email: <input type="email" name="email" required></label><br>

    <?php if ($role === 'student'): ?>
        <label>Classification: <input type="text" name="classification" required></label><br>
        <label>Degree: <input type="text" name="degree" required></label><br>
        <label>Major: <input type="text" name="major" required></label><br>
        <label>Minor: <input type="text" name="minor"></label><br>
    <?php endif; ?>

    <button type="submit">Add <?= ucfirst($role) ?></button>
</form>