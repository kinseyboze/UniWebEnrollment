<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

// get options for dropdown boxes
$buildings = $conn->query("SELECT buildingdesc FROM building");
$rooms = $conn->query("SELECT roomdesc FROM room");
$times = $conn->query("SELECT timedesc FROM time");
$teachers = $conn->query("SELECT id, firstname, lastname FROM faculty");

// form submission to database
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $coursedesc = $_POST['coursedesc'];
    $building = $_POST['building'];
    $room = $_POST['room'];
    $time = $_POST['time'];
    $days = $_POST['days'];
    $facultyid = $_POST['facultyid'];

    $stmt = $conn->prepare("INSERT INTO course (coursedesc, building, room, time, days, facultyid) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sssssi", $coursedesc, $building, $room, $time, $days, $facultyid);

    if ($stmt->execute()) {
        echo "<p>Course added successfully!</p>";
        echo "<a href='../frontend/admin_home.php#courses'>Go Back</a>";
    } else {
        echo "Insert error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add Course</title>
    <link rel="stylesheet" href="../../assets/css/style.css" />
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="#" />
</head>

<body class="admin">

    <!-- sidebar -->
    <ul class="sidebar">
        <img src="../../assets/images/cameron.png" class="logo">
        <div>
        <li><a>Course Management</a></li>
        </div>  
    </ul>

    <!-- Content Container -->
    <div class="action-box">
        <div class="tabs"> 
            <ol>
                <li class="active">
                    <span class="text">New Course Information</span>
                </li>
            </ol>           
        </div>

        <div class="content">
            <div class="tab_wrap">
                <div><p>This is where you can add new course offered at the University<p></div>
                <div>
                    <form method="post">

                        <!-- class name -->
                        <p>Course Name: <input type="text" name="coursedesc" required></p>

                        <!-- building location -->
                        <div class="input-box">
                        <p>Building:
                            <select name="building" required>
                                <option value="">Select Building</option>
                                <?php while ($b = $buildings->fetch_assoc()): ?>
                                    <option value="<?= htmlspecialchars($b['buildingdesc']) ?>">
                                        <?= htmlspecialchars($b['buildingdesc']) ?>
                                    </option>
                                <?php endwhile; ?>
                            </select>
                        </p>
                        </div>

                       <!-- room within building -->
                        <div class="input-box">
                        <p>Room:
                            <select name="room" required>
                                <option value="">Select Room</option>
                                <?php while ($r = $rooms->fetch_assoc()): ?>
                                    <option value="<?= htmlspecialchars($r['roomdesc']) ?>">
                                        <?= htmlspecialchars($r['roomdesc']) ?>
                                    </option>
                                <?php endwhile; ?>
                            </select>
                                </p>
                        </div>

                        <!-- days offered -->
                        <div class="input-box">
                        <p>Days:
                            <select name="days" required>
                                <option value="">Select Days</option>
                                <option value="MWF">MWF</option>
                                <option value="TR">Tues/Thurs</option>
                                <option value="Online">Online</option>
                            </select>
                                </p>
                        </div>

                        <!-- time offered -->
                        <div class="input-box">
                        <p>Time:
                            <select name="time" required>
                                <option value="">Select Time</option>
                                <?php while ($t = $times->fetch_assoc()): ?>
                                    <option value="<?= htmlspecialchars($t['timedesc']) ?>">
                                        <?= htmlspecialchars($t['timedesc']) ?>
                                    </option>
                                <?php endwhile; ?>
                            </select>
                                </p>
                        </div>

                        <!-- teacher -->
                        <div class="input-box">
                        <p>Teacher:
                            <select name="facultyid" required>
                                <option value="">Select Professor</option>
                                <?php while ($t = $teachers->fetch_assoc()): ?>
                                    <option value="<?= $t['id'] ?>">
                                        <?= htmlspecialchars($t['firstname'] . ' ' . $t['lastname']) ?>
                                    </option>
                                <?php endwhile; ?>
                            </select>
                        </p>
                        </div>

                        <button type="submit">Add Course</button>
                    </form>
                </div>
                </div>
            </div>
        </div>

</body>
</html>