<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

$course = null;
$courseid = $_GET['courseid'] ?? null;

if (!$courseid) {
    die("No course selected to edit.");
}

// Load dropdown options
$buildings = $conn->query("SELECT buildingdesc FROM building");
$rooms = $conn->query("SELECT roomdesc FROM room");
$times = $conn->query("SELECT timedesc FROM time");
$teachers = $conn->query("SELECT id, firstname, lastname FROM faculty");

// Load course info
$stmt = $conn->prepare("SELECT * FROM course WHERE courseid = ?");
$stmt->bind_param("i", $courseid);
$stmt->execute();
$result = $stmt->get_result();
$course = $result->fetch_assoc();
$stmt->close();

if (!$course) {
    die("Course not found.");
}

// Handle update submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $coursedesc = $_POST['coursedesc'];
    $building = $_POST['building'];
    $room = $_POST['room'];
    $time = $_POST['time'];
    $days = $_POST['days'];
    $facultyid = $_POST['facultyid'];

    $stmt = $conn->prepare("UPDATE course SET coursedesc = ?, building = ?, room = ?, time = ?, days = ?, facultyid = ? WHERE courseid = ?");
    $stmt->bind_param("ssssssi", $coursedesc, $building, $room, $time, $days, $facultyid, $courseid);

    if ($stmt->execute()) {
        echo "<p>Course updated successfully!</p>";
        echo "<a href='../frontend/admin_home.php#courses'>Go Back</a>";
    } else {
        echo "Update error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Course</title>
    <link rel="stylesheet" href="../../assets/css/style.css" />
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="#" />
</head>

<body class="admin">

    <!-- Sidebar -->
    <ul class="sidebar">
        <img src="../../assets/images/cameron.png" class="logo">
        <div><li><a href='../frontend/admin_home.php#accounts'>Back</a></li></div>  
    </ul>

    <!-- Content Container -->
    <div class="action-box">
        <div class="tabs"> 
            <ol>
                <li class="active">
                    <span class="text">Edit Course</span>
                </li>
            </ol>           
        </div>

        <div class="content">
            <div class="tab_wrap">
                <div><p>Edit the information for this course below:</p></div>
                <div>
                    <form method="post">

                        <!-- Course Name -->
                        <p>Course Name: <input type="text" name="coursedesc" value="<?= htmlspecialchars($course['coursedesc']) ?>" required></p>

                        <!-- Building -->
                        <div class="input-box">
                        <p>Building:
                            <select name="building" required>
                                <option value="">Select Building</option>
                                <?php while ($b = $buildings->fetch_assoc()): ?>
                                    <option value="<?= htmlspecialchars($b['buildingdesc']) ?>" <?= $b['buildingdesc'] === $course['building'] ? 'selected' : '' ?>>
                                        <?= htmlspecialchars($b['buildingdesc']) ?>
                                    </option>
                                <?php endwhile; ?>
                            </select>
                        </p>
                        </div>

                        <!-- Room -->
                        <div class="input-box">
                        <p>Room:
                            <select name="room" required>
                                <option value="">Select Room</option>
                                <?php while ($r = $rooms->fetch_assoc()): ?>
                                    <option value="<?= htmlspecialchars($r['roomdesc']) ?>" <?= $r['roomdesc'] === $course['room'] ? 'selected' : '' ?>>
                                        <?= htmlspecialchars($r['roomdesc']) ?>
                                    </option>
                                <?php endwhile; ?>
                            </select>
                        </p>
                        </div>

                        <!-- Days -->
                        <div class="input-box">
                        <p>Days:
                            <select name="days" required>
                                <option value="">Select Days</option>  
                                <option value="M" <?= $course['days'] === 'M' ? 'selected' : '' ?>>Monday</option>
                                <option value="T" <?= $course['days'] === 'T' ? 'selected' : '' ?>>Tuesday</option>
                                <option value="W" <?= $course['days'] === 'W' ? 'selected' : '' ?>>Wednesday</option>
                                <option value="R" <?= $course['days'] === 'R' ? 'selected' : '' ?>>Thursday</option>
                                <option value="F" <?= $course['days'] === 'F' ? 'selected' : '' ?>>Friday</option>
                                <option value="MTWR" <?= $course['days'] === 'MTWR' ? 'selected' : '' ?>>MTWR</option>
                                <option value="MW" <?= $course['days'] === 'MW' ? 'selected' : '' ?>>Monday/Wednesday</option>
                                <option value="MWF" <?= $course['days'] === 'MWF' ? 'selected' : '' ?>>Mon/Wed/Fri</option>
                                <option value="TR" <?= $course['days'] === 'TR' ? 'selected' : '' ?>>Tuesday/Thursday</option>
                                <option value="Online" <?= $course['days'] === 'Online' ? 'selected' : '' ?>>Online</option>
                            </select>
                        </p>
                        </div>

                        <!-- Time -->
                        <div class="input-box">
                        <p>Time:
                            <select name="time" required>
                                <option value="">Select Time</option>
                                <?php while ($t = $times->fetch_assoc()): ?>
                                    <option value="<?= htmlspecialchars($t['timedesc']) ?>" <?= $t['timedesc'] === $course['time'] ? 'selected' : '' ?>>
                                        <?= htmlspecialchars($t['timedesc']) ?>
                                    </option>
                                <?php endwhile; ?>
                            </select>
                        </p>
                        </div>

                        <!-- Teacher -->
                        <div class="input-box">
                        <p>Teacher:
                            <select name="facultyid" required>
                                <option value="">Select Professor</option>
                                <?php while ($t = $teachers->fetch_assoc()): ?>
                                    <option value="<?= $t['id'] ?>" <?= $t['id'] == $course['facultyid'] ? 'selected' : '' ?>>
                                        <?= htmlspecialchars($t['firstname'] . ' ' . $t['lastname']) ?>
                                    </option>
                                <?php endwhile; ?>
                            </select>
                        </p>
                        </div>

                        <button type="submit">Update Course</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>