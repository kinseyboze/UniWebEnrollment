<?php
// db_connect.php which will be included in every php 

// Database credentials
$servername = "localhost";
$username = "root";  // Default XAMPP username is 'root'
$password = "";      // Default XAMPP password is empty
$dbname = "uniwebenrollment_db"; // The name of the db

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
