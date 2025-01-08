<?php
include('config/db.php');

// Query to mark notifications as read
$query = "UPDATE `notifications` SET `is_read` = 1 WHERE `is_read` = 0";
$conn->query($query);

// Return success response
echo json_encode(['success' => true]);

$conn->close();
?>
