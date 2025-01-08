<?php
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require 'config/db.php'; // Adjust this to your actual database connection file

    // Get the input data
    $input = json_decode(file_get_contents('php://input'), true);
    $deviceId = $input['deviceId'] ?? null;
    $plantId = $input['plantId'] ?? null;

    if (!$deviceId || !$plantId) {
        echo json_encode(['error' => 'Invalid device or plant ID.']);
        exit;
    }

    // Update the plantId in the device_config table
    $stmt = $conn->prepare("UPDATE device_config SET plantId = ? WHERE id = ?");
    $stmt->bind_param('ii', $plantId, $deviceId);

    if ($stmt->execute()) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['error' => 'Database update failed.']);
    }

    $stmt->close();
    $conn->close();
} else {
    echo json_encode(['error' => 'Invalid request method.']);
}
?>
