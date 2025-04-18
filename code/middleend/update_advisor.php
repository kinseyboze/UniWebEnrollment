<?php
// Make sure to include database connection
include 'db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get studentid and advisorid from the AJAX request
    $studentid = $_POST['studentid'];
    $advisorid = $_POST['advisorid'];

    // Validate inputs (optional, to prevent SQL injection)
    $studentid = intval($studentid);
    $advisorid = intval($advisorid);

    // SQL query to update the advisor in the advisor table
    $update_sql = "UPDATE advisor SET facultyid = ? WHERE studentid = ?";
    $stmt = $conn->prepare($update_sql);
    $stmt->bind_param("ii", $advisorid, $studentid);

    if ($stmt->execute()) {
        echo "Advisor updated successfully!";
    } else {
        echo "Error updating advisor: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
