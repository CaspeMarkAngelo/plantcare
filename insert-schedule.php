<?php
include('config/db.php'); // Include your DB connection

// Check if POST data is available
if (isset($_POST['device_id'], $_POST['schedule_type'], $_POST['execution_count'], $_POST['interval_ms'])) {
    // Get the data from POST request
    $device_id = intval($_POST['device_id']);
    $schedule_type = $_POST['schedule_type'];
    $execution_count = intval($_POST['execution_count']);
    $interval_ms = intval($_POST['interval_ms']);
    
    // Insert schedule into the schedules table
    $query = "INSERT INTO schedules (device_id, schedule_type, execution_count, interval_ms) 
              VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("isii", $device_id, $schedule_type, $execution_count, $interval_ms);
    
    if ($stmt->execute()) {
        // Return success response
        echo json_encode(['success' => true]);
    } else {
        // Return failure response
        echo json_encode(['success' => false, 'error' => 'Failed to insert schedule']);
    }

    $stmt->close();
} else {
    echo json_encode(['success' => false, 'error' => 'Missing data']);
}
?>
