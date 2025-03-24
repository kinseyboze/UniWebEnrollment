<?php
session_start();


include('../middleend/db_connect.php');

$roleid = $_SESSION['roleid'];
$username = $_SESSION['username'];

$sql = "SELECT * FROM student WHERE studentid = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $roleid);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $student = $result->fetch_assoc();
    $student_name = $student['firstname'] . " " . $student['lastname'];
} else {
    $student_name = "Student";
}

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Home - UniEnroll</title>
    <link rel="stylesheet" href="../../assets/css/home.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

    <div class="leftcol">
        <img src="../../assets/images/Cameron.png" alt="Student Picture">
        <h2>STUDENT INFORMATION</h2>
        <p><?php echo $student_name; ?></p>
    </div>

    <div class="tabs-container">
        <div class="tabs">
            <div class="tab" onclick="showContent('Class and Schedule')">Class and Schedule</div>
            <div class="tab" onclick="showContent('Class Enrollment')">Class Enrollment</div>
            <div class="tab" onclick="showContent('Organizations')">Organizations</div>
            <div class="tab" onclick="showContent('Internship')">Internship</div>
            <div class="tab" onclick="showContent('Contact')">Contact</div>
        </div>

    <div class="sign-out">
        <form action="../middleend/process_logout.php" method="post">
            <button type="submit" name="logout" style="background: none; border: none; color: inherit; text-decoration: none;">Sign Out</button>
        </form>
    </div>

    </div>

    <div id="Class and Schedule" class="content active">
        <h2>Class and Schedule</h2>
        <p>Here you can see the classes you are currently enrolled in and their date/time.</p>
    </div>

    <div id="Class Enrollment" class="content">
        <h2>Class Enrollment</h2>
        <p>In this tab you will be able to enroll into other classes as long as you have been given your access pin by your advisor.</p>
    </div>

    <div id="Organizations" class="content">
        <h2>Organizations</h2>
        <p>Here are a list of the organizations that you are a part of, as well as potential organizations you could join.</p>
    </div>

    <div id="Internship" class="content">
        <h2>Internship</h2>
        <p>This tab is for any Internships you are a part of or if you wish to apply for an internship.</p>
    </div>

    <div id="Contact" class="content">
        <h2>Contact</h2>
        <p>Email access...</p>
    </div>

    <script>
        function showContent(theme) {
            const contents = document.querySelectorAll('.content');
            contents.forEach(content => {
                content.classList.remove('active');
            });
            document.getElementById(theme).classList.add('active');
        }
    </script>

</body>
</html>
