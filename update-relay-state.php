<?php
include 'config/db.php';

// Retrieve the data sent from the ESP8266
$deviceName = isset($_POST['device_name']) ? $_POST['device_name'] : null;
$relayState = isset($_POST['relay_state']) ? $_POST['relay_state'] : null;

if ($deviceName && $relayState) {
    // Update the relay state for the given device name
    $sql = "UPDATE device_config SET relay_state = ?, updated_at = NOW() WHERE device_name = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $relayState, $deviceName);
    
    if ($stmt->execute()) {
        echo "Relay state updated successfully.";
    } else {
        echo "Error updating relay state: " . $stmt->error;
    }
    $stmt->close();
} else {
    echo "Device name and relay state are required.";
}
?>
