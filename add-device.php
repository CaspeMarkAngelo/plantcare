<?php
include('config/db.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_POST['device_name'])) {
    $deviceName = $conn->real_escape_string($_POST['device_name']);
    $queryAddDevice = "INSERT INTO device_config (device_name) VALUES ('$deviceName')";

    if ($conn->query($queryAddDevice) === TRUE) {
        echo json_encode(['success' => 'Device added successfully.']);
    } else {
        echo json_encode(['error' => 'Failed to add device.']);
    }
}
?>
