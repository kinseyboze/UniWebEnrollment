<?php
include "db_connect.php";

$role = isset($_GET['role']) ? $_GET['role'] : 'student';
$id   = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($id <= 0) {
    die("Invalid ID.");
}

// 1. Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $firstname = $_POST['firstname'];
    $lastname  = $_POST['lastname'];
    $email     = $_POST['email'];

    if ($role == 'student') {
        $sql = "UPDATE student SET firstname = ?, lastname = ?, email = ? WHERE studentid = ?";
    } else {
        $sql = "UPDATE faculty SET firstname = ?, lastname = ?, email = ? WHERE id = ?";
    }

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssi", $firstname, $lastname, $email, $id);

    if ($stmt->execute()) {
        echo "User updated successfully. <a href='manage_user.php?role=$role'>Back</a>";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
    exit;
}

// 2. Load user info for form
if ($role == 'student') {
    $sql = "SELECT firstname, lastname, email FROM student WHERE studentid = ?";
} else {
    $sql = "SELECT firstname, lastname, email FROM faculty WHERE id = ?";
}

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

if (!$user) {
    die("User not found.");
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

<body class="admin">

    <!-- Sidebar -->
    <ul class="sidebar">
        <img src="../../assets/images/cameron.png" class="logo">
        <li><a>Edit Current User</a></li>
    </ul>

    <!-- Content Container (needs styling) -->
    <div class="action-box">
        <div class="tabs"> 
            <ol>
                <li class="active">
                    <span class="icon"><i class='bx bxs-user'></i></span>
                    <span class="text">Edit User Information</span>
                </li>
            </ol>
        </div>

        <div class="content">
            <div class="tab_wrap">
                <div><p>This is where you can edit user information<p></div>
                <div>
                    <form method="post">

                        <!-- give switch cases to know what table to pull from -->
                        <!-- make sure it prefills with exsisting information -->

                        <!-- first name -->
                        <p>First Name: <input type="text" name="firstname" required></p>

                        <!-- last name -->
                        <p>Last Name: <input type="text" name="lastname" required></p>

                        <!-- email -->
                       <p>Email: <input type="text" name="email" required></p>





                        <!--  
                        <p>: <input type="text" name="" required></p>
                        -->

                        <!--  -->


                        <!-- advisor -->
                        <div class="input-box">
                        <p>Advisor:
                            <select name="facultyid" required>
                                <option value="">Select Advisor</option>
                                <?php while ($t = $teachers->fetch_assoc()): ?>
                                    <option value="<?= $t['id'] ?>">
                                        <?= htmlspecialchars($t['firstname'] . ' ' . $t['lastname']) ?>
                                    </option>
                                <?php endwhile; ?>
                            </select>
                        </p>
                        </div>

                        <button type="submit">Save Changes</button>
                    </form>
                </div>
                </div>
            </div>
        </div>

</body>
</html>