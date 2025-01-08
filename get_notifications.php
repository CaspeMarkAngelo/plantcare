<?php
// get_notifications.php
header('Content-Type: application/json');

// Database connection
include('config/db.php');

// Check connection
if ($conn->connect_error) {
    die(json_encode(['error' => 'Connection failed: ' . $conn->connect_error]));
}

// Fetch notifications
$query = "SELECT `message`, `device_name` FROM `notifications` ORDER BY `id` DESC";
$result = $conn->query($query);

$notifications = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $notifications[] = $row;
    }
}

// Close connection
$conn->close();

// Return notifications as JSON
echo json_encode(['notifications' => $notifications]);
?>
