<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include "db_connect.php";

// get user with id 
$roleid = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($roleid <= 0) {
    die("Invalid request: Undefined User");
}

// find the login table and then find the role
$get_role_sql = "SELECT role FROM login WHERE roleid = ?";
$get_role_stmt = $conn->prepare($get_role_sql);
$get_role_stmt->bind_param("i", $roleid);
$get_role_stmt->execute();
$get_role_result = $get_role_stmt->get_result();

if ($get_role_result->num_rows === 0) {
    die("Error: User not found.");
}

$row = $get_role_result->fetch_assoc();
$role = $row['role'];
$get_role_stmt->close();

// which table to delete from
switch ($role) {
    case 'student':
        $role_table = 'student';
        $column = 'studentid';
        break;
    case 'faculty':
        $role_table = 'faculty';
        $column = 'id'; 
        break;
    case 'advisor':
        $role_table = 'advisor';
        $column = 'id'; 
        // need to add a check in here to make sure that if they have any students to reassign them
        break;
    case 'admin':
        $role_table = 'faculty'; 
        $column = 'id';
        break;
    default:
        die("Error: Unknown role.");
}
// need to have different stipulations for each role and what to check for
// delete from the respective table
$delete_role_sql = "DELETE FROM $role_table WHERE $column = ?";
$delete_role_stmt = $conn->prepare($delete_role_sql);
$delete_role_stmt->bind_param("i", $roleid);

if (!$delete_role_stmt->execute()) {
    die("Error deleting from $role_table: " . $delete_role_stmt->error);
}
$delete_role_stmt->close();

// delete from the login table
$delete_login_sql = "DELETE FROM login WHERE roleid = ?";
$delete_login_stmt = $conn->prepare($delete_login_sql);
$delete_login_stmt->bind_param("i", $roleid);

if ($delete_login_stmt->execute()) {
    echo "User deleted successfully. <a href='../frontend/admin_home.php#accounts'>Back</a>";
} else {
    echo "Error deleting from login: " . $delete_login_stmt->error;
}
$delete_login_stmt->close();
$conn->close();
?>