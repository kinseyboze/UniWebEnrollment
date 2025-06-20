<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include "db_connect.php";

// get user with id 
$roleid = isset($_GET['id']) ? intval($_GET['id']) : 0;

// if the user is not an admin then...
if ($roleid <= 0) {
    die("Invalid request: Undefined User <a href='../frontend/admin_home.php#accounts'>Back</a>");
}

// find user on login table & get role
$get_role_sql = "SELECT role FROM login WHERE roleid = ?";
$get_role_stmt = $conn->prepare($get_role_sql);
$get_role_stmt->bind_param("i", $roleid);
$get_role_stmt->execute();
$get_role_result = $get_role_stmt->get_result();

// if the user is not on the login table...
if ($get_role_result->num_rows === 0) {
    die("Error: User not found in login table. <a href='../frontend/admin_home.php#accounts'>Back</a>");
}

// fetch role for data
$row = $get_role_result->fetch_assoc();
$role = $row['role'];
$get_role_stmt->close();

// switch case for directory of tables to check data
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
        $role_table = 'faculty';
        $column = 'id'; 
        break;
    case 'admin':
        $role_table = 'faculty'; 
        $column = 'id';
        break;
    case 'chair':
        $role_table = 'faculty'; 
        $column = 'id';
        break;
    default:
        die("Error: Unknown role.");
}

// logic - check for any relationships before deletion
$check_sqls = [];

if ($role === 'faculty' || $role === 'advisor' || $role === 'admin') {
    // faculty/advisor/admin all use the same table
    $check_sqls[] = ["SELECT COUNT(*) AS total FROM course WHERE facultyid = ?", "teaching a course"];
    $check_sqls[] = ["SELECT COUNT(*) AS total FROM advisor WHERE facultyid = ?", "advising a student"];
} elseif ($role === 'student') {
    $check_sqls[] = ["SELECT COUNT(*) AS total FROM enrollment WHERE studentid = ?", "enrolled in a course"];
}

// action - loop through each of the checks listed ^^
foreach ($check_sqls as [$sql, $context]) {
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $roleid);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = $result->fetch_assoc();
    $stmt->close();
    
    // if any of those checks adds to the tally
    if ($data['total'] > 0) {
        die("Cannot delete: This $role is still $context. <a href='../frontend/admin_home.php#accounts'>Back</a>");
    }
}



// delete user on respective table
$delete_role_sql = "DELETE FROM $role_table WHERE $column = ?";
$delete_role_stmt = $conn->prepare($delete_role_sql);
$delete_role_stmt->bind_param("i", $roleid);
$role_deleted = $delete_role_stmt->execute();
$delete_role_stmt->close();

// delete user on login table
$delete_login_sql = "DELETE FROM login WHERE roleid = ?";
$delete_login_stmt = $conn->prepare($delete_login_sql);
$delete_login_stmt->bind_param("i", $roleid);
$login_deleted = $delete_login_stmt->execute();
$delete_login_stmt->close();

// confirm success
if ($role_deleted && $login_deleted) {
    echo "User deleted successfully. <a href='../frontend/admin_home.php#accounts'>Back</a>";
} else {
    echo "User deletion failed or was incomplete. <a href='../frontend/admin_home.php#accounts'>Back</a>";
}

$conn->close();
?>