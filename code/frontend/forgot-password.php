<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cameron University</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Main stylesheet -->
    <link rel="stylesheet" href="../../assets/css/style.css">
    <!-- Icon font -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        /* Flex centering for content only */
        .center-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            flex-direction: column;
        }
        .contact-info {
            margin: 10px 0;
        }
        .back-link {
            margin-top: 20px;
            font-size: 14px;
        }
        .back-link a {
            text-decoration: none;
            color:rgb(0, 0, 0);
        }
        .back-link a:hover {
            text-decoration: underline;
        }
        /* Logo positioning */
        .logo {
            position: absolute;
            top: 30px;
            left: 30px;
        }
    </style>
</head>

<body class="login">
    <header>
        <div class="background">
            <!-- Logo in upper-left corner -->
            <img src="../../assets/images/cameron.png" width="100" height="100" class="logo">

            <div class="center-wrapper">
                <div class="text">
                    <h2>Forgot Your Password?</h2>
                    <p>If you've forgotten your password, please contact your system administrator for assistance.</p>
                    <p class="contact-info"><strong>Email:</strong> admin@example.com</p>
                    <p class="contact-info"><strong>Phone:</strong> (123) 456-7890</p>

                    <!-- Small "Back to Login" link -->
                    <div class="back-link">
                        <a href="login.html">← Back to Login</a>
                    </div>
                </div>
            </div>
        </div>
    </header>
</body>
</html>