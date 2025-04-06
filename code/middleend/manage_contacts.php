<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../../assets/css/style.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="shortcut icon" href="#" />
        <title>Contacts</title>
    </head>

    <body class="chair">
        <ul class="sidebar">
            <img src="../../assets/images/cameron.png" class="logo">
            <li><a>Department Chair</a></li>
            <li><a>CS Department</a></li>
            <li><a href="manage_contacts.php">Contact</a></li>
            <li><a href="#"><i class="bx bx-log-out"></i>Logout</a></li>
        </ul>

        <div class="action-box">
            <div class="tabs"> 
                <ol>
                    <li>
                        <span class="icon"><i class='bx bxs-book'></i></span>
                        <span class="text">Student</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-briefcase'></i></span>
                        <span class="text">Advisor</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-chalkboard'></i></span>
                        <span class="text">Courses</span>
                    </li>

                    <li>
                        <span class="icon"><i class='bx bxs-user-pin'></i></span>
                        <span class="text">Manage</span>
                    </li>
                </ol>
            </div>

            <div class="content">
                <div class="tab_wrap" style="display: block;">
                    <div class="title">Contacts</div>
                    <div class="tab-content">
                        <?php
                            $conn = new mysqli("localhost", "username", "password", "your_database");
                            if ($conn->connect_error) {
                                die("Connection failed: " . $conn->connect_error);
                            }

                            $result = $conn->query("SELECT name, email, phone FROM contacts");
                            if ($result->num_rows > 0) {
                                echo "<ul class='sidebar'>";
                                while($row = $result->fetch_assoc()) {
                                    echo "<li><strong>" . htmlspecialchars($row['name']) . "</strong> - " . 
                                         htmlspecialchars($row['email']) . " - " . 
                                         htmlspecialchars($row['phone']) . "</li>";
                                }
                                echo "</ul>";
                            } else {
                                echo "<p>No contacts found.</p>";
                            }

                            $conn->close();
                        ?>
                    </div>
                </div>
            </div>
        </div>

        <script src="scripts.js"></script>
    </body>
</html>
