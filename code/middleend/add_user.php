<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
include "db_connect.php";

// form submission to database
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $role = $_POST['role'];
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $email = $_POST['email'];
    $raw_password = bin2hex(random_bytes(4)); // creates 8-digit password - no hashing
    $roleid = null;

    if ($role === 'student') {
        $classification = $_POST['classification'];
        $degree = $_POST['degree'];
        $major = $_POST['major'];
        $minor = $_POST['minor'];

        $stmt = $conn->prepare("INSERT INTO student (firstname, lastname, email, classification, degree, major, minor) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssss", $firstname, $lastname, $email, $classification, $degree, $major, $minor);
        if ($stmt->execute()) {
            $roleid = $stmt->insert_id;
        }
        $stmt->close();
    } 
    else {
        $facultyrole = ($role === 'advisor' || $role === 'chair' || $role === 'admin') ? ucfirst($role) : 'Faculty';
        $office = $_POST['office'];
        $phonenumber = $_POST['phonenumber'];

        $stmt = $conn->prepare("INSERT INTO faculty (firstname, lastname, email, office, phonenumber, facultyrole) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssss", $firstname, $lastname, $email, $office, $phonenumber, $facultyrole);
        if ($stmt->execute()) {
            $roleid = $stmt->insert_id;
        }
        $stmt->close();
    }

    // login table insertion
    if ($roleid) {
        $stmt = $conn->prepare("INSERT INTO login (username, password, role, roleid) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("sssi", $email, $raw_password, $role, $roleid);
        if ($stmt->execute()) {
            //echo "<div class='login-box'>";
            echo "<p>User added successfully!</p>";
            echo "<p>Username: <strong>$email</strong></p>";
            echo "<p>Password: <strong>$raw_password</strong></p>";
            echo "<a href='manage_user.php?role=$role'>Go Back</a>";
            //echo "</div>";
        } else {
            echo "Login insert error: " . $stmt->error;
        }
        $stmt->close();
    } 
    else {
        echo "User insert failed.";
    }
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

    <!-- Sidebar -->
    <ul class="sidebar">
        <img src="../../assets/images/cameron.png" class="logo">
        <li><a>Adding New User</a></li>
    </ul>

    <!-- Content Container (needs styling) -->
    <div class="action-box">
        <div class="tabs"> 
            <ol>
                <li class="active">
                    <span class="icon"><i class='bx bxs-user'></i></span>
                    <span class="text">New User Information</span>
                </li>
            </ol>
        </div>

        <div class="content">
            <div class="tab_wrap">
                <div class="title">Students & Faculty</div>
                <div class="tab-content">
                    <form method="post">
                        <div class="input-box">
                            <select name="role" id="role" onchange="toggleFields()" required>
                                <option value="">Select Role:</option>
                                <option value="student">Student</option>
                                <option value="faculty">Faculty</option>
                                <option value="advisor">Advisor</option>
                                <option value="chair">Chair</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>

                        <label>First Name: <input type="text" name="firstname" required></label><br>
                        <label>Last Name: <input type="text" name="lastname" required></label><br>
                        <label>Email: <input type="email" name="email" required></label><br>

                        <div id="studentFields" style="display:none;">
                        <label>Classification: <input type="text" name="classification"></label><br>
                        <label>Degree: <input type="text" name="degree"></label><br>
                        <label>Major: <input type="text" name="major"></label><br>
                        <label>Minor: <input type="text" name="minor"></label><br>
                        </div>

                        <div id="facultyFields" style="display:none;">
                        <label>Office: <input type="text" name="office"></label><br>
                        <label>Phone Number: <input type="text" name="phonenumber"></label><br>
                        </div>

                        <button type="submit">Add User</button>
                    </form>
                </div>
                </div>
            </div>
        </div>

    <!-- JS to toggle fields -->
    <script>
        function toggleFields() {
            const role = document.getElementById('role').value;
            document.getElementById('studentFields').style.display = role === 'student' ? 'block' : 'none';
            document.getElementById('facultyFields').style.display = role !== 'student' && role !== '' ? 'block' : 'none';
        }
    </script>

</body>
</html>