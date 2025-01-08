<?php
include('config/db.php'); // Include database connection

if (isset($_POST['device_id'])) {
    $device_id = $_POST['device_id'];

    // Prevent SQL injection
    $device_id = (int)$device_id;

    // Delete the device from the database
    $query = "DELETE FROM device_config WHERE id = $device_id";
    
    if ($conn->query($query) === TRUE) {
        echo "Device removed successfully.";
    } else {
        echo "Error: " . $conn->error;
    }
}
?>
