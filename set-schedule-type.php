<?php
include('config/db.php');

$deviceid = $_POST['deviceid'];
$schedule_type = $_POST['schedule_type'];
$execution_count = $_POST['execution_count'];
$interval_ms = $_POST['interval_ms'];

if (empty($deviceid) || empty($schedule_type) || empty($execution_count) || empty($interval_ms)) {
    echo json_encode(['error' => 'All fields are required.']);
    exit;
}

$query = "INSERT INTO schedules (device_id, schedule_type, execution_count, interval_ms) 
          VALUES ('$deviceid', '$schedule_type', '$execution_count', '$interval_ms')";

if ($conn->query($query)) {
    echo json_encode(['success' => 'Schedule set successfully!']);
} else {
    echo json_encode(['error' => 'Failed to set the schedule.']);
}
?>
