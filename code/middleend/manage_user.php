<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

$role = strtolower(trim($_GET['role'] ?? 'student'));


$context = $_GET['context'] ?? 'limited'; // default is limited

// Define queries for each role
$roleQueries = [
    'all' => "SELECT id, firstname, lastname, email, facultyrole AS role FROM faculty
    UNION SELECT studentid AS id, firstname, lastname, email, 'Student' AS role FROM student",


    'student' => "SELECT studentid AS id, firstname, lastname, email FROM student",
    

    'faculty' => "SELECT id, firstname, lastname, email, facultyrole AS role FROM faculty",

    // Advisors: Pull from faculty table where facultyrole for'Advisor' is
    'advisor' => "SELECT id, firstname, lastname, email, 'Advisor' AS role FROM faculty WHERE facultyrole = 'Advisor'",

    // Chairs: Pull from faculty table where facultyrole for 'Chair' is
    'chair' => "SELECT id, firstname, lastname, email, 'Chair' AS role FROM faculty WHERE facultyrole = 'Chair'",

    // Admin: is pulled from the faculty table where facultyrole for 'admin' is
    'admin'   => "SELECT id, firstname, lastname, email, 'Admin' AS role FROM faculty WHERE facultyrole = 'Admin'",
];


if (!isset($roleQueries[$role])) {
    die("Invalid role.");
}

if (!isset($roleQueries[$role])) {
    echo "<p style='color:red;'>DEBUG: Invalid role = '$role'</p>";


    exit();
}


$sql = $roleQueries[$role];
$result = $conn->query($sql);

echo "<h2>Manage " . ucfirst($role) . "s</h2>";
echo "<table border='1'><tr><th>ID</th><th>Name</th><th>Email</th><th>Actions</th></tr>";
while ($row = $result->fetch_assoc()) {
    $actions = "";

    if ($context === 'full') {
        $actions .= "<a href='../middleend/edit_user.php?id={$row['id']}&role={$role}'>Edit</a> | ";
        $actions .= "<a href='../middleend/delete_user.php?id={$row['id']}&role={$role}' onclick='return confirm(\"Are you sure?\")'>Delete</a>";
    } elseif ($context === 'edit') {
        $actions .= "<a href='../middleend/edit_user.php?id={$row['id']}&role={$role}'>Edit</a>";
    } elseif ($context === 'delete') {
        $actions .= "<a href='../middleend/delete_user.php?id={$row['id']}&role={$role}' onclick='return confirm(\"Are you sure?\")'>Delete</a>";
    } else {
        $actions = "—";
    }

    echo "<tr>
            <td>{$row['id']}</td>
            <td>{$row['firstname']} {$row['lastname']}</td>
            <td>{$row['email']}</td>
            <td>$actions</td>
          </tr>";
}

echo "</table>";
?>

<a href="../middleend/add_user.php">Add New User</a>