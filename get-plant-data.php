<?php
include('config/db.php');

// Get plant ID from the request
if (isset($_GET['plant_id'])) {
    $plant_id = intval($_GET['plant_id']);
    
    // Query to fetch plant data
    $query = "SELECT schedule_type, interval_ms, execution_count, soil_moisture 
              FROM plants WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $plant_id);
    $stmt->execute();
    $stmt->bind_result($schedule_type, $interval_ms, $execution_count, $soil_moisture);
    
    // Fetch the result and return as JSON
    if ($stmt->fetch()) {
        echo json_encode([
            'schedule_type' => $schedule_type,
            'interval_ms' => $interval_ms,
            'execution_count' => $execution_count,
            'soil_moisture' => $soil_moisture
        ]);
    } else {
        echo json_encode(['error' => 'Plant not found']);
    }

    $stmt->close();
} else {
    echo json_encode(['error' => 'No plant ID provided']);
}
?>
