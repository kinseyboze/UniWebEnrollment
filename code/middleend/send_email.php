<?php
include "db_connect.php";

// Make sure POST data is set
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $recipient = $_POST['recipient'];
    $subject = $_POST['subject'];
    $message = $_POST['message'];

    // Email headers
    $headers = "From: admin@yourdomain.com\r\n";
    $headers .= "Reply-To: admin@yourdomain.com\r\n";
    $headers .= "Content-Type: text/plain; charset=UTF-8\r\n";

    // If "all" is selected, fetch all contact emails
    if ($recipient === "all") {
        $sql = "SELECT email FROM faculty";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $to = $row['email'];
                mail($to, $subject, $message, $headers);
            }
            echo "Emails sent to all contacts.";
        } else {
            echo "No contacts found to send emails.";
        }
    } else {
        // Send to a single specific email
        if (filter_var($recipient, FILTER_VALIDATE_EMAIL)) {
            if (mail($recipient, $subject, $message, $headers)) {
                echo "Email successfully sent to $recipient.";
            } else {
                echo "Failed to send email to $recipient.";
            }
        } else {
            echo "Invalid email address.";
        }
    }

    $conn->close();
} else {
    echo "Invalid request.";
}
?>
