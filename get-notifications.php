<?php
include('config/db.php');

// Fetch notifications from the database
$query = "SELECT id, device_id, message, created_at, device_name FROM notifications  GROUP BY message ORDER BY created_at DESC LIMIT 5"; // Adjust the LIMIT as needed
$result = $conn->query($query);

$notifications = [];
if ($result && $result->num_rows > 0) {
    while ($notification = $result->fetch_assoc()) {
        $notifications[] = $notification;
    }
}

echo json_encode($notifications);
?>
