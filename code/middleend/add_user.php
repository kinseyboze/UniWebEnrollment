<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

// get options for dropdown boxes
$majors = $conn->query("SELECT majordesc FROM major");
$buildings = $conn->query("SELECT buildingdesc FROM building");
$rooms = $conn->query("SELECT roomdesc FROM room");


// form submission to database
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $role = $_POST['role'];
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $email = ""; // placeholder until ID is known

    //$email = $_POST['email'];
    $raw_password = bin2hex(random_bytes(4)); // 8-digit password
    $roleid = null;

    if ($role === 'student') {
        $classification = $_POST['classification'];
        $degree = $_POST['degree'];
        $major = $_POST['major'];
        $minor = $_POST['minor'];
    
        // Placeholder email to satisfy NOT NULL constraint
        $temp_email = "temp@university.edu";
    
        // Insert student with temporary email
        $stmt = $conn->prepare("INSERT INTO student (firstname, lastname, email, classification, degree, major, minor) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssss", $firstname, $lastname, $temp_email, $classification, $degree, $major, $minor);
    
        if ($stmt->execute()) {
            $roleid = $stmt->insert_id;
    
            // generate email with initials roleid
            $email = strtolower(substr($firstname, 0, 1) . substr($lastname, 0, 1) . $roleid . "@university.edu");
    
            // update student records with new password
            $update = $conn->prepare("UPDATE student SET email = ? WHERE studentid = ?");
            $update->bind_param("si", $email, $roleid);
            $update->execute();
            $update->close();
        } else {
            echo "Student insert error: " . $stmt->error;
        }
        $stmt->close();
    } else {
        $facultyrole = ($role === 'advisor' || $role === 'chair' || $role === 'admin') ? ucfirst($role) : 'Faculty';
        $building = $_POST['building'];
        $room = $_POST['room'];
        $office = $building . ' ' . $room;
        $phonenumber = $_POST['phonenumber'];

        $email = strtolower(substr($firstname, 0, 1) . $lastname . "@university.edu");
    
        $tempEmail = 'temp@email.com';
        $stmt = $conn->prepare("INSERT INTO faculty (firstname, lastname, email, office, phonenumber, facultyrole) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssss", $firstname, $lastname, $tempEmail, $office, $phonenumber, $facultyrole);
    
        if ($stmt->execute()) {
            $roleid = $stmt->insert_id;
            $update = $conn->prepare("UPDATE faculty SET email = ? WHERE id = ?");
            $update->bind_param("si", $email, $roleid);
            $update->execute();
            $update->close();
        }
        $stmt->close();
    }

    // insert into login table & confirm user was added
    if ($roleid) {
        $stmt = $conn->prepare("INSERT INTO login (username, password, role, roleid, email, firstname, lastname) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssisss", $email, $raw_password, $role, $roleid, $email, $firstname, $lastname);

        if ($stmt->execute()) {
            echo "<p>$firstname $lastname was added successfully!</p>";
            echo "<p>$firstname's ID Number: <strong>$roleid</strong></p>";
            echo "<p>$firstname's Username: <strong>$email</strong></p>";
            echo "<p>$firstname's Password: <strong>$raw_password</strong></p>";
            echo "<a href='../frontend/admin_home.php#accounts'>Go Back</a>";
        } else {
            echo "Login insert error: " . $stmt->error;
        }
        $stmt->close();
    } else {
        echo "User insert failed.";
    }

    $conn->close();
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Add User</title>
    <link rel="stylesheet" href="../../assets/css/style.css" />
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="#" />
</head>

<body class="admin">

    <!-- sidebar -->
    <ul class="sidebar">
        <img src="../../assets/images/cameron.png" class="logo">
        <div>
        <li><a>Account Management</a></li>
        </div>  
    </ul>

    <!-- Content Container -->
    <div class="action-box">
        <div class="tabs"> 
            <ol>
                <li class="active">
                    <span class="text">New User Information</span>
                </li>
            </ol>
        </div>

        <div class="content">
            <div class="tab_wrap">
                <div><p>Use this form to add a new student, faculty, advisor, chair, or admin.</p></div>
                <div>
                    <form method="post">
                    
            <!-- role of new user -->
                        <p>Role:
                            <select name="role" id="role" onchange="toggleFields()" required>
                                <option value="">Select Role</option>
                                <option value="student">Student</option>
                                <option value="faculty">Faculty</option>
                                <option value="advisor">Advisor</option>
                                <option value="chair">Chair</option>
                                <option value="admin">Admin</option>
                            </select>
                        </p>

                        <!-- name -->
                        <p>First Name: <input type="text" name="firstname" required></p>
                        <p>Last Name: <input type="text" name="lastname" required></p>

            <!-- Student Fields -->
                        <div id="studentFields" style="display:none;">

                        <!-- classification -->
                        <div class="input-box">
                        <p>Classification:
                            <select name="classification" required>
                                <option value="">Select Classification</option>
                                <option value="Freshman">Freshman</option>
                                <option value="Sophomore">Sophomore</option>
                                <option value="Junior">Junior</option>
                                <option value="Senior">Senior</option>
                                <option value="Graduate">Graduate</option>
                            </select>
                        </p>
                        </div>

                        <!-- degree type -->
                        <div class="input-box">
                        <p>Degree:
                            <select name="degree" required>
                                <option value="">Select Degree Type</option>
                                <option value="Associate">Associate Degree</option>
                                <option value="Bachelor's">Bachelor's Degree</option>
                                <option value="Master's">Master's Degree</option>
                            </select>
                        </p>
                        </div>

                        <!-- major -->
                        <div class="input-box">
                        <p>Major:
                            <select name="major" required>
                                <option value="">Select Major</option>
                                <?php while ($row = $majors->fetch_assoc()): ?>
                                    <option value="<?= htmlspecialchars($row['majordesc']) ?>">
                                        <?= htmlspecialchars($row['majordesc']) ?>
                                    </option>
                                <?php endwhile; ?>
                            </select>
                        </p>
                        </div>

                        <!-- minor -->
                        <p>Minor: <input type="text" name="minor" placeholder="if applicable"></p>

                        </div>


            <!-- Faculty/Advisor/Chair/Admin Fields -->
                        <div id="facultyFields" style="display:none;">
            
                        <!-- office -->
                        <div class="input-box">
                        <p>Office:
                            <select name="building" required>
                                <option value="">Select Building</option>
                                <?php while ($b = $buildings->fetch_assoc()): ?>
                                    <option value="<?= htmlspecialchars($b['buildingdesc']) ?>">
                                        <?= htmlspecialchars($b['buildingdesc']) ?>
                                    </option>
                                <?php endwhile; ?>
                            </select>

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

                        <!-- office phone number -->
                        <p>Phone Number: <input type="text" name="phonenumber" required></p>
                        
                        </div>
                        
                        <button type="submit">Add User</button>


                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- JS toggle -->
    <script>
        function toggleFields() {
            const role = document.getElementById('role').value;
            document.getElementById('studentFields').style.display = role === 'student' ? 'block' : 'none';
            document.getElementById('facultyFields').style.display = role !== 'student' && role !== '' ? 'block' : 'none';
        }
    </script>
</body>
</html>