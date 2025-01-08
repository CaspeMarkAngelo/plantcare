<?php
include 'config/db.php';

$temperature = isset($_POST['temperature']) ? $_POST['temperature'] : null;
$humidity = isset($_POST['humidity']) ? $_POST['humidity'] : null;
$soilMoisture = isset($_POST['soilMoisture']) ? $_POST['soilMoisture'] : null;
$pirState = isset($_POST['pirState']) ? $_POST['pirState'] : null;
$deviceName = isset($_POST['device_name']) ? $_POST['device_name'] : null;

if (!$deviceName) {
    echo "Device name is required.";
    exit;
}

$sql = "SELECT * FROM sensordata WHERE device_name = ? ORDER BY id DESC LIMIT 1";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $deviceName);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();
$stmt->close();

$shouldUpdate = false;
$soilMoistureChanged = false;

if ($row) {
    if ($row['temperature'] != $temperature || 
        $row['humidity'] != $humidity || 
        $row['soil_moisture'] != $soilMoisture || 
        $row['pir_state'] != $pirState) {
        $shouldUpdate = true;
    }

    // Check if soil moisture has increased and is greater than 20
    if ($row['soil_moisture'] < $soilMoisture && $soilMoisture > 20) {
        $soilMoistureChanged = true;
    }
} else {
    $shouldUpdate = true;
}

if ($soilMoistureChanged) {
    // Insert a record into the water_history table if soil moisture > 20
    $wateringMessage = "The plant has been watered for device $deviceName.";
    $stmt = $conn->prepare("INSERT INTO water_history (device_name, message) VALUES (?, ?)");
    $stmt->bind_param("ss", $deviceName, $wateringMessage);
    $stmt->execute();
    $stmt->close();
}

if ($shouldUpdate) {
    $stmt = $conn->prepare("INSERT INTO sensordata (temperature, humidity, soil_moisture, pir_state, device_name) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("dddss", $temperature, $humidity, $soilMoisture, $pirState, $deviceName);
    $stmt->execute();
    $stmt->close();

    echo "Data updated successfully.";
} else {
    echo "No changes detected. Data not updated.";
}
?>
