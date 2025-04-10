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
    $classification = $student['classification'];
    $major = $student['major'];
    $minor = $student['minor'];
} else {
    $student_name = "Student";
}

$stmt->close();
$conn->close();
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Home - UniEnroll</title>
        <link rel="stylesheet" href="../../assets/css/home.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <body class="admin">
        <ul>
            <img src="../../assets/css/cameron.png" alt="Student Picture">
            <h2>STUDENT INFORMATION</h2>
            <p><?php echo $student_name; ?></p>
            <p>Class</p>
            <p><?php echo $classification; ?></p>
            <p>Major</p>
            <p><?php echo $major; ?></p>
            <p>Minor</p>
            <p><?php echo $minor; ?></p></ul>

            <form action="../middleend/process_logout.php" method="post">
                <button type="submit" name="logout" style="background: none; border: none; color: inherit; text-decoration: none;">Sign Out</button>
            </form>
        
        <div class="action-box">
            <div class="tabs"> 
                <ol>
                    <li class="active">
                        <span class="icon"><i class='bx bxs-user'></i></span>
                        <span class="text">Current Schedule</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-cog'></i></span>
                        <span class="text">Available Courses</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-buildings'></i></span>
                        <span class="text">Organizations</span>
                    </li>
                    <li>
                        <span class="icon"><i class='bx bxs-buildings'></i></span>
                        <span class="text">Internships</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-door-open'></i></span>
                        <span class="text">Contact</span>
                    </li>
                </ol>
            </div>

            <div class="content">
                <div class="tab_wrap" style="display: block;">
                    <div class="title">Your Current Schedule</div>
                    <div class="tab-content">
                        <table>
                            <tr>
                                <th>Course ID</th>
                                <th>Course Name</th>
                                <th>Professor</th>
                                <th>Building</th>
                                <th>Room</th>
                                <th>Time</th>
                                <th>Days</th>
                            </tr>
                            <tr>
                                <td>4050</td>
                                <td>Capstone</td>
                                <td>Johnny Appleseed</td>
                                <td>Howell Hall</td>
                                <td>203</td>
                                <td>2 pm</td>
                                <td>M W</td>
                            </tr>
                            <tr>
                                <td>More</td>
                                <td>Test</td>
                                <td>Data</td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Potential courses</div>
                    <div class="tab-content">
                        <p>In this tab you will be able to add and delete classes as long as you have a pin from your advisor.</p>
                        <table>
                            <tr>
                                <th>Course ID</th>
                                <th>Course Name</th>
                                <th>Professor</th>
                                <th>Building</th>
                                <th>Room</th>
                                <th>Time</th>
                                <th>Days</th>
                            </tr>
                            <tr>
                                <td>4050</td>
                                <td>Capstone</td>
                                <td>Johnny Appleseed</td>
                                <td>Howell Hall</td>
                                <td>203</td>
                                <td>2 pm</td>
                                <td>M W</td>
                            </tr>
                            <tr>
                                <td>More</td>
                                <td>Test</td>
                                <td>Data</td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Manage Buildings</div>
                    <div class="tab-content">
                        <p>In this tab you will be able to add and delete school buildings in the course descriptions.</p>
                    </div>
                </div>

                <div class="tab_wrap" style="display: none;">
                    <div class="title">Manage Rooms</div>
                    <div class="tab-content">
                        <p>In this tab you will be able to add and delete classrooms in the course descriptions.</p>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="scripts.js"></script>
    </body>
</html>