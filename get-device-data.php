<?php
// Database connection
include('config/db.php');

if (isset($_GET['device_name'])) {
    $device_name = $_GET['device_name'];

    // Query to get the latest sensor data for the given device_name
    $query = "SELECT `id`, `temperature`, `humidity`, `soil_moisture`, `pir_state`, `timestamp`, `device_name`
              FROM `sensordata`
              WHERE `device_name` = ?
              ORDER BY `timestamp` DESC
              LIMIT 1";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $device_name);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && $result->num_rows > 0) {
        $data = $result->fetch_assoc();
        echo json_encode(['status' => 'success', 'data' => $data]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'No sensor data found for this device.']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Device name is required.']);
}
?>
