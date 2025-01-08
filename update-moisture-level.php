<?php
include('config/db.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $deviceId = $_POST['device_id'];
    $moistureLevel = $_POST['moisture_level'];

    $query = "UPDATE device_config SET moisture_level = ? WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param('si', $moistureLevel, $deviceId);

    if ($stmt->execute()) {
        echo "Moisture level updated successfully.";
    } else {
        echo "Error updating moisture level.";
    }

    $stmt->close();
}
$conn->close();
?>
