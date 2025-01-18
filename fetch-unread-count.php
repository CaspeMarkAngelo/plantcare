<?php
include('config/db.php');

// Query to fetch unread notifications count
$query = "SELECT 
    message, 
    COUNT(*) AS unread_count, 
    MAX(created_at) AS latest_created_at 
FROM 
    notifications 
WHERE 
    is_read = 'unread' 
GROUP BY 
    message 
ORDER BY 
    latest_created_at DESC;";
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
