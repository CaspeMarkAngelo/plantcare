<?php 
header('Content-Type: application/json'); // Return JSON response
include('config/db.php');

$response = [];

// Validate input
if (empty($_POST['start_date'])) {
    $response['error'] = "Start date is required.";
    echo json_encode($response);
    exit;
}

if (empty($_POST['device_id'])) {
    $response['error'] = "Device selection is required.";
    echo json_encode($response);
    exit;
}

$start_date = $_POST['start_date'];
$device_id = $_POST['device_id'];
$current_time = new DateTime(); // Current time
$input_time = new DateTime($start_date); // User input

// Validate date
if ($input_time <= $current_time) {
    $response['error'] = "The start date must be greater than the current date and time.";
    echo json_encode($response);
    exit;
}

// Clear previous schedule for the selected device
$deleteQuery = $conn->prepare('DELETE FROM watering_time WHERE device_id = ?');
$deleteQuery->bind_param('i', $device_id);
$deleteQuery->execute();
$deleteQuery->close();

// Insert new schedule
$query = $conn->prepare("INSERT INTO watering_time (device_id, start_date) VALUES (?, ?)");
$query->bind_param('is', $device_id, $start_date);

if ($query->execute()) {
    // Insert notification about the new schedule
    $message = "Watering schedule set for device $device_id at $start_date";
    
    $notificationQuery = $conn->prepare("INSERT INTO notifications (device_id, message) VALUES (?, ?)");
    $notificationQuery->bind_param('is', $device_id, $message);
    $notificationQuery->execute();
    $notificationQuery->close();

    $response['success'] = "Start date saved successfully and notification inserted!";
} else {
    $response['error'] = "Error saving start date: " . $conn->error;
}

$query->close();
$conn->close();
echo json_encode($response);
exit;
