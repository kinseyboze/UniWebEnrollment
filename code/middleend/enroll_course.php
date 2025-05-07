<?php
session_start();
include "db_connect.php";

if (!isset($_SESSION['userid'])) {
    echo "You must be logged in.";
    exit;
}

$student_id = $_SESSION['roleid'];
$toAdd      = $_POST['add_courses'] ?? [];

if (empty($toAdd) || !is_array($toAdd)) {
    echo "No courses selected.";
    echo '<br><a href="../frontend/student_home.php"><button>Back to Courses</button></a>';
    exit;
}

$conn->query("SET FOREIGN_KEY_CHECKS = 0");

$added    = [];
$already  = [];
$notfound = [];
$failed   = [];

$checkStmt   = $conn->prepare("SELECT 1 FROM enrollment WHERE studentid = ? AND courseid = ?");
$getFacStmt  = $conn->prepare("SELECT facultyid FROM course WHERE courseid = ?");
$insertStmt  = $conn->prepare("
    INSERT INTO enrollment (enrollmentid, facultyid, studentid, courseid)
    VALUES (?, ?, ?, ?)
");
$getNameStmt = $conn->prepare("SELECT coursedesc FROM course WHERE courseid = ?");

foreach ($toAdd as $rawId) {
    $course_id = intval($rawId);
    $enroll_id = $student_id * 10 + $course_id;

    $getNameStmt->bind_param("i", $course_id);
    $getNameStmt->execute();
    $nres = $getNameStmt->get_result();
    $name = $nres->num_rows
        ? $nres->fetch_assoc()['coursedesc']
        : "Course #{$course_id}";

    // already enrolled?
    $checkStmt->bind_param("ii", $student_id, $course_id);
    $checkStmt->execute();
    if ($checkStmt->get_result()->num_rows) {
        $already[] = $name;
        continue;
    }

    // get faculty
    $getFacStmt->bind_param("i", $course_id);
    $getFacStmt->execute();
    $fres = $getFacStmt->get_result();
    if ($frow = $fres->fetch_assoc()) {
        $faculty_id = $frow['facultyid'];
    } else {
        $notfound[] = $name;
        continue;
    }

    $insertStmt->bind_param("iiii", $enroll_id, $faculty_id, $student_id, $course_id);
    if ($insertStmt->execute()) {
        $added[] = $name;
    } else {
        $failed[] = $name;
    }
}

$conn->query("SET FOREIGN_KEY_CHECKS = 1");

// cleanup
$checkStmt->close();
$getFacStmt->close();
$insertStmt->close();
$getNameStmt->close();
$conn->close();

// summary
echo "<h2>Enrollment Results</h2>";
if ($added)    echo "<p>Added: "    . implode(", ", $added)    . ".</p>";
if ($already)  echo "<p>Already: "  . implode(", ", $already)  . ".</p>";
if ($notfound) echo "<p>Not found: " . implode(", ", $notfound) . ".</p>";
if ($failed)   echo "<p>Failed: "   . implode(", ", $failed)   . ".</p>";

echo '<br><a href="../frontend/student_home.php"><button>Back to Courses</button></a>';
?>
