<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

$context = $_GET['context'] ?? 'full'; // 'full', 'edit', 'delete', or 'limited'

// Join with faculty to show who teaches the course
$sql = "SELECT 
            course.courseid,
            course.coursedesc,
            course.building,
            course.room,
            course.time,
            course.days,
            CONCAT(faculty.firstname, ' ', faculty.lastname) AS instructor
        FROM course
        LEFT JOIN faculty ON course.facultyid = faculty.id";

$result = $conn->query($sql);

echo "<h2>Manage Courses</h2>";

echo "<table border='1'>
        <tr>
            <th>ID</th>
            <th>Course Name</th>
            <th>Building</th>
            <th>Room</th>
            <th>Time</th>
            <th>Days</th>
            <th>Instructor</th>
            <th>Actions</th>
        </tr>";

while ($row = $result->fetch_assoc()) {
    $actions = "";

    if ($context === 'full') {
        $actions .= "<a href='../middleend/edit_course.php?courseid={$row['courseid']}'>Edit</a> | ";
        $actions .= "<a href='../middleend/delete_course.php?courseid={$row['courseid']}' onclick='return confirm(\"Are you sure you want to delete this course?\")'>Delete</a>";
    } elseif ($context === 'edit') {
        $actions .= "<a href='../middleend/edit_course.php?courseid={$row['courseid']}'>Edit</a>";
    } elseif ($context === 'delete') {
        $actions .= "<a href='../middleend/delete_course.php?courseid={$row['courseid']}' onclick='return confirm(\"Are you sure?\")'>Delete</a>";
    } else {
        $actions = "—";
    }

    echo "<tr>
            <td>{$row['courseid']}</td>
            <td>{$row['coursedesc']}</td>
            <td>{$row['building']}</td>
            <td>{$row['room']}</td>
            <td>{$row['time']}</td>
            <td>{$row['days']}</td>
            <td>{$row['instructor']}</td>
            <td>$actions</td>
          </tr>";
}

echo "</table>";
?>

<br>
<a href="../middleend/add_course.php">Add New Course</a>