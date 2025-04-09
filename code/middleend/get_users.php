<?php
// Include the database connection
include "db_connect.php";

// Fetch students with 'Student' role
$sqlStudents = "SELECT studentid AS id, firstname, lastname, 'Student' AS role FROM student";
$students = $conn->query($sqlStudents);

// Fetch faculty with their actual roles (faculty, advisor, chair, admin)
$sqlFaculty = "SELECT id, firstname, lastname, facultyrole role FROM faculty";
$faculty = $conn->query($sqlFaculty);

// Display table headers
echo "<table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Role</th>
            <th>Actions</th> 
        </tr>";

// Function to fetch and display data
function displayData($result) {
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>".$row['id']."</td>
                <td>".$row['firstname']." ".$row['lastname']."</td>
                <td>".$row['role']."</td>
                <td> 
                    <a href='edit_user.php?id={$row['id']}&role={$row['role']}'>Edit</a> | 
                    <a href='delete_user.php?id={$row['id']}&role={$row['role']}' onclick='return confirm(\"Are you sure?\")'>Delete</a>
                </td>
              </tr>";
    }
}

// Display data for students and faculty
displayData($students);
displayData($faculty);

echo "</table>";

// Close the connection
$conn->close();
?>


 