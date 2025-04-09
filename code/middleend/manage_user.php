<?php
include "db_connect.php";

$role = isset($_GET['role']) ? $_GET['role'] : 'chair';   // student page is default 

// Define queries for each role
$roleQueries = [
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

$sql = $roleQueries[$role];
$result = $conn->query($sql);

echo "<h2>Manage " . ucfirst($role) . "s</h2>";
echo "<table border='1'><tr><th>ID</th><th>Name</th><th>Email</th><th>Actions</th></tr>";
while ($row = $result->fetch_assoc()) {
    echo "<tr>
            <td>{$row['id']}</td>
            <td>{$row['firstname']} {$row['lastname']}</td>
            <td>{$row['email']}</td>
            <td>
                <a href='edit_user.php?id={$row['id']}&role={$role}'>Edit</a> |
                <a href='delete_user.php?id={$row['id']}&role={$role}' onclick='return confirm(\"Are you sure?\")'>Delete</a>
            </td>
          </tr>";
}
echo "</table>";
?>

<a href="add_user.php?role=<?= $role ?>">Add New <?= ucfirst($role) ?></a>