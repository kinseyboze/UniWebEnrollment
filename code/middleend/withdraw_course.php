<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

if (!isset($_SESSION['userid']) || !isset($_SESSION['role'])) {
    echo "You must be logged in.";
    exit;
}

$student_id = $_SESSION['roleid'];
$toDrop     = $_POST['drop_courses'] ?? [];

if (empty($toDrop) || !is_array($toDrop)) {
    echo "No courses selected for withdrawal.";
    echo '<br><a href="../frontend/student_home.php"><button>Back to Courses</button></a>';
    exit;
}

$deleted     = [];
$notEnrolled = [];
$failed      = [];

// Prepare statements
$getNameStmt = $conn->prepare("SELECT coursedesc FROM course WHERE courseid = ?");
$delStmt     = $conn->prepare("DELETE FROM enrollment WHERE studentid = ? AND courseid = ?");

foreach ($toDrop as $cid) {
    $course_id = intval($cid);

    // fetch name
    $getNameStmt->bind_param("i", $course_id);
    $getNameStmt->execute();
    $nres = $getNameStmt->get_result();
    $name = $nres->num_rows 
        ? $nres->fetch_assoc()['coursedesc'] 
        : "Course #{$course_id}";

    // attempt delete
    $delStmt->bind_param("ii", $student_id, $course_id);
    if ($delStmt->execute()) {
        if ($delStmt->affected_rows > 0) {
            $deleted[] = $name;
        } else {
            $notEnrolled[] = $name;
        }
    } else {
        $failed[] = $name;
    }
}

$getNameStmt->close();
$delStmt->close();
$conn->close();

// summary
echo "<h2>Withdrawal Results</h2>";
if ($deleted)     echo "<p>Withdrawn: "          . implode(", ", $deleted)     . ".</p>";
if ($notEnrolled) echo "<p>Not enrolled in: "    . implode(", ", $notEnrolled) . ".</p>";
if ($failed)      echo "<p>Failed (DB error): "  . implode(", ", $failed)      . ".</p>";

echo '<br><a href="../frontend/student_home.php"><button>Back to Courses</button></a>';
?>
