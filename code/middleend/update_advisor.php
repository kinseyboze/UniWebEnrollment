<?php
include "db_connect.php"; 

if (isset($_POST['student_id']) && isset($_POST['faculty_id'])) {
    $studentId = $_POST['student_id'];
    $facultyId = $_POST['faculty_id'];

    $advisor_id_sql = "SELECT advisorid FROM advisor WHERE studentid = ?";
    $advisor_stmt = $conn->prepare($advisor_id_sql);
    $advisor_stmt->bind_param("i", $studentId); 
    $advisor_stmt->execute();
    $advisor_id_result = $advisor_stmt->get_result();

    if ($advisor_id_result->num_rows > 0) {
        // Retrieve the advisorid if found
        $advisor_id = $advisor_id_result->fetch_assoc()['advisorid'];

        // SQL query to update the advisor for this student
        $update_sql = "UPDATE advisor SET advisorid = ?, facultyid = ? WHERE studentid = ?";
        $update_stmt = $conn->prepare($update_sql);
        $update_stmt->bind_param("iii", $advisor_id, $facultyId, $studentId);
        $update_stmt->execute();

        if ($update_stmt->affected_rows > 0) {
            echo "Advisor updated successfully!";
        } else {
            echo "No changes made to the advisor.";
        }
    } else {
        echo "No advisor found for this student.";
    }
} else {
    echo "Required data not provided.";
}
?>
