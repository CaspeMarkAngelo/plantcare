<?php
include 'config/db.php';

// Get the device ID and relay state from the request
$deviceId = isset($_POST['device_id']) ? (int) $_POST['device_id'] : null;
$relayState = isset($_POST['relayState']) ? $_POST['relayState'] : null;

if ($deviceId === null || $relayState === null) {
    echo json_encode(['error' => 'Device ID and relay state are required.']);
    exit;
}

// Get the current relay state for the specified device
$sql = "SELECT relay_state FROM device_config WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $deviceId);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();
$stmt->close();

if ($row) {
    // Update the relay state only if it has changed
    if ($row['relay_state'] != $relayState) {
        $stmt = $conn->prepare("UPDATE device_config SET relay_state = ?, updated_at = NOW() WHERE id = ?");
        $stmt->bind_param("si", $relayState, $deviceId);
        $stmt->execute();
        $stmt->close();
        echo json_encode(['success' => "Relay state for device ID $deviceId updated to: $relayState"]);
    } else {
        echo json_encode(['message' => "No change in relay state for device ID $deviceId."]);
    }
} else {
    // If there's no existing record for this device, return an error message
    echo json_encode(['error' => "Device with ID $deviceId not found."]);
}
?>
