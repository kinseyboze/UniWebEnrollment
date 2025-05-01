<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

$role = isset($_GET['role']) ? $_GET['role'] : 'student';
$id   = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($id <= 0) {
    die("Invalid ID.<a href='../frontend/admin_home.php#accounts'>Back</a>");
}

// get options for dropdown boxes
$majors = $conn->query("SELECT majordesc FROM major");
$buildings = $conn->query("SELECT buildingdesc FROM building");
$rooms = $conn->query("SELECT roomdesc FROM room");
$teachers = $conn->query("SELECT id, firstname, lastname FROM faculty WHERE facultyrole = 'Advisor'");

// Fetch user data
if ($role == 'student') {
    $stmt = $conn->prepare("SELECT * FROM student WHERE studentid = ?");
} else {
    $stmt = $conn->prepare("SELECT * FROM faculty WHERE id = ?");
}
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();
$stmt->close();

if (!$user) {
    die("User not found or invalid ID.<a href='../frontend/admin_home.php#accounts'>Back</a>");
}

// Get advisor if student
$advisor_id = null;
if ($role == 'student') {
    $advisor_stmt = $conn->prepare("SELECT facultyid FROM advisor WHERE studentid = ?");
    $advisor_stmt->bind_param("i", $id);
    $advisor_stmt->execute();
    $advisor_result = $advisor_stmt->get_result();
    $advisor_row = $advisor_result->fetch_assoc();
    if ($advisor_row) {
        $advisor_id = $advisor_row['facultyid'];
    }
    $advisor_stmt->close();
}

// form submission to database
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $firstname = $_POST['firstname'];
    $lastname  = $_POST['lastname'];
    $email     = $_POST['email'];

    if ($role == 'student') {
        $classification = $_POST['classification'];
        $degree = $_POST['degree'];
        $major = $_POST['major'];
        $minor = $_POST['minor'];
        $new_advisor = $_POST['facultyid'];

        $stmt = $conn->prepare("UPDATE student SET firstname = ?, lastname = ?, email = ?, classification = ?, degree = ?, major = ?, minor = ? WHERE studentid = ?");
        $stmt->bind_param("sssssssi", $firstname, $lastname, $email, $classification, $degree, $major, $minor, $id);
        $stmt->execute();
        $stmt->close();

        $advisor_stmt = $conn->prepare("UPDATE advisor SET facultyid = ? WHERE studentid = ?");
        $advisor_stmt->bind_param("ii", $new_advisor, $id);
        $advisor_stmt->execute();
        $advisor_stmt->close();

    } else {
        $building = $_POST['building'];
        $room = $_POST['room'];
        $phonenumber = $_POST['phonenumber'];
        $office = $building . ' ' . $room;

        $stmt = $conn->prepare("UPDATE faculty SET firstname = ?, lastname = ?, email = ?, office = ?, phonenumber = ? WHERE id = ?");
        $stmt->bind_param("sssssi", $firstname, $lastname, $email, $office, $phonenumber, $id);
        $stmt->execute();
        $stmt->close();
    }

    echo "User updated successfully. <a href='../frontend/admin_home.php#accounts'>Back</a>";
    $conn->close();
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="../../assets/css/style.css" />
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="#" />
</head>
<body class="admin" onload="toggleFields()">
    <ul class="sidebar">
        <img src="../../assets/images/cameron.png" class="logo">
        <li><a href='../frontend/admin_home.php#accounts'>Back</a></li>
    </ul>

    <div class="action-box">
        <div class="tabs"> 
            <ol><li class="active"><span class="text">Edit User Information</span></li></ol>
        </div>

        <div class="content">
            <div class="tab_wrap">
                <div><p>This is where you can edit user information</p></div>
                <form method="post">

                    <p>First Name: <input type="text" name="firstname" value="<?= htmlspecialchars($user['firstname']) ?>" required></p>
                    <p>Last Name: <input type="text" name="lastname" value="<?= htmlspecialchars($user['lastname']) ?>" required></p>
                    <p>Email: <input type="text" name="email" value="<?= htmlspecialchars($user['email']) ?>" required></p>

                    <?php if ($role == 'student'): ?>

                        <div id="studentFields">
                            <p>Classification:
                                <select name="classification" required>
                                    <?php foreach (["Freshman", "Sophomore", "Junior", "Senior", "Graduate"] as $class): ?>
                                        <option value="<?= $class ?>" <?= $user['classification'] == $class ? 'selected' : '' ?>><?= $class ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </p>
                            <p>Degree:
                                <select name="degree" required>
                                    <?php foreach (["Associate", "Bachelor's", "Master's"] as $deg): ?>
                                        <option value="<?= $deg ?>" <?= $user['degree'] == $deg ? 'selected' : '' ?>><?= $deg ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </p>
                            <p>Major:
                                <select name="major" required>
                                    <?php while ($m = $majors->fetch_assoc()): ?>
                                        <option value="<?= $m['majordesc'] ?>" <?= $user['major'] == $m['majordesc'] ? 'selected' : '' ?>><?= $m['majordesc'] ?></option>
                                    <?php endwhile; ?>
                                </select>
                            </p>
                            <p>Minor: <input type="text" name="minor" value="<?= htmlspecialchars($user['minor'] ?? '') ?>"></p>
                            <p>Advisor:
                                <select name="facultyid" required>
                                    <option value="">Select Advisor</option>
                                    <?php while ($t = $teachers->fetch_assoc()): ?>
                                        <option value="<?= $t['id'] ?>" <?= ($advisor_id == $t['id']) ? 'selected' : '' ?>>
                                            <?= htmlspecialchars($t['firstname'] . ' ' . $t['lastname']) ?>
                                        </option>
                                    <?php endwhile; ?>
                                </select>
                            </p>
                        </div>
                    <?php else: ?>
                        <div id="facultyFields">
                            <p>Building:
                                <select name="building" required>
                                    <?php while ($b = $buildings->fetch_assoc()): ?>
                                        <option value="<?= $b['buildingdesc'] ?>" <?= (strpos($user['office'], $b['buildingdesc']) !== false) ? 'selected' : '' ?>><?= $b['buildingdesc'] ?></option>
                                    <?php endwhile; ?>
                                </select>
                                <select name="room" required>
                                    <?php while ($r = $rooms->fetch_assoc()): ?>
                                        <option value="<?= $r['roomdesc'] ?>" <?= (strpos($user['office'], $r['roomdesc']) !== false) ? 'selected' : '' ?>><?= $r['roomdesc'] ?></option>
                                    <?php endwhile; ?>
                                </select>
                            </p>
                            <p>Phone Number: <input type="text" name="phonenumber" value="<?= htmlspecialchars($user['phonenumber']) ?>" required></p>
                        </div>
                    <?php endif; ?>

                    <button type="submit">Save Changes</button>
                </form>
            </div>
        </div>
    </div>

    <script>
    function toggleFields() {
        const role = "<?= $role ?>";
        document.getElementById("studentFields").style.display = role === 'student' ? 'block' : 'none';
        document.getElementById("facultyFields").style.display = role !== 'student' ? 'block' : 'none';
    }
    </script>
</body>
</html>