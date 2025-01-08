<?php
include('config/db.php');

// Query to fetch unread notifications count
$query = "SELECT COUNT(*) AS unread_count FROM `notifications` WHERE `is_read` = 0";
$result = $conn->query($query);

// Fetch the unread count and return as JSON
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode(['unread_count' => $row['unread_count']]);
} else {
    echo json_encode(['unread_count' => 0]);
}

$conn->close();
?>
