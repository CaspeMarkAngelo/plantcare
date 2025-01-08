<?php
header('Content-Type: application/json');
include('config/db.php');

$response = [];

// Retrieve the most recent device with a scheduled start date
$query = "SELECT device_id FROM watering_time WHERE start_date <= NOW() ORDER BY start_date ASC LIMIT 1";
$result = $conn->query($query);

if ($result && $result->num_rows > 0) {
    $data = $result->fetch_assoc();
    $response['device_id'] = $data['device_id'];
} 

$conn->close();
echo json_encode($response);
exit;
