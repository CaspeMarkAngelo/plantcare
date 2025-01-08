<?php
include('config/db.php'); // Database connection

// Check if the necessary data is passed
if (isset($_POST['device_id']) && isset($_POST['message'])) {
    $device_id = $_POST['device_id'];
    $message = $_POST['message'];

    // Fetch device name from the database based on device_id
    $query_device_name = "SELECT device_name FROM device_config WHERE id = ?";
    if ($stmt = $conn->prepare($query_device_name)) {
        $stmt->bind_param("i", $device_id);
        $stmt->execute();
        $stmt->bind_result($device_name);
        $stmt->fetch();
        $stmt->close();
        
        // Check if the device name was found
        if ($device_name) {
            // Insert notification into the database with device_name
            $query_insert = "INSERT INTO notifications (device_id, device_name, message) VALUES (?, ?, ?)";
            if ($stmt = $conn->prepare($query_insert)) {
                $stmt->bind_param("iss", $device_id, $device_name, $message);
                if ($stmt->execute()) {
                    echo 'Notification added successfully.';
                } else {
                    echo 'Error inserting notification.';
                }
                $stmt->close();
            } else {
                echo 'Error preparing insert query.';
            }
        } else {
            echo 'Device not found.';
        }
    } else {
        echo 'Error preparing query to fetch device name.';
    }
} else {
    echo 'Invalid request.';
}

$conn->close();
?>
