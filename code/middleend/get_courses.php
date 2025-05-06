<?php

include('db_connect.php');

// Check if user is an admin
$isAdmin = (isset($_SESSION['role']) && $_SESSION['role'] === 'admin');


$query = "SELECT 
            course.courseid,
            course.coursedesc,
            course.building,
            course.room,
            course.time,
            course.days,
            CONCAT(faculty.firstname, ' ', faculty.lastname) AS instructor
          FROM course
          LEFT JOIN faculty ON course.facultyid = faculty.id";

$result = $conn->query($query);

// Start the table // added id = coursesTable to fix search bar
echo "<table id='coursesTable' border='1'>  
        <tr>
            <th>Course ID</th>
            <th>Course Name</th>
            <th>Building</th>
            <th>Room</th>
            <th>Time</th>
            <th>Days</th>
            <th>Instructor</th>";

if ($isAdmin) {
    echo "<th>Actions</th>";
}

echo "</tr>";

// Table rows
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . htmlspecialchars($row['courseid']) . "</td>
                <td>" . htmlspecialchars($row['coursedesc']) . "</td>
                <td>" . htmlspecialchars($row['building']) . "</td>
                <td>" . htmlspecialchars($row['room']) . "</td>
                <td>" . htmlspecialchars($row['time']) . "</td>
                <td>" . htmlspecialchars($row['days']) . "</td>
                <td>" . htmlspecialchars($row['instructor']) . "</td>";

        if ($isAdmin) {
            echo "<td>
                    <a href='../middleend/edit_course.php?courseid={$row['courseid']}'>Edit</a> |
                    <a href='../middleend/delete_course.php?courseid={$row['courseid']}' onclick='return confirm(\"Are you sure?\")'>Delete</a>
                  </td>";
        }

        echo "</tr>";
    }
} else {
    echo "<tr><td colspan='" . ($isAdmin ? "8" : "7") . "'>No courses found</td></tr>";
}

echo "</table>";
?>