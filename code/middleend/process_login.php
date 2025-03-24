<?php
include('db_connect.php');
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);
    
    $sql = "SELECT * FROM login WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        if ($password == $row['password']) { 
            $_SESSION['roleid'] = $row['roleid']; 
            $_SESSION['username'] = $row['username']; 

            if ($row['role'] == 'faculty') {
                header("location: ../frontend/faculty_home.html"); 
            } else if ($row['role'] == 'student') {
                header("location: ../frontend/student_home.php"); 
            }
            exit();
        } else {
            echo "Invalid credentials.";
        }
    } else {
        echo "No account found with this username.";
    }

    $stmt->close();
}

$conn->close();
?>
