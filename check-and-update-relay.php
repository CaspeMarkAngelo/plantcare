<?php
include('config/db.php');

// Fetch schedules that are due for execution
$query = "SELECT s.id, s.device_id, s.execution_count, s.interval_ms, s.next_execution, d.relay_state 
          FROM schedules s 
          JOIN device_config d ON s.device_id = d.id 
          WHERE s.next_execution <= NOW() AND s.execution_count > 0";

$result = $conn->query($query);

$response = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $device_id = $row['device_id'];
        $schedule_id = $row['id'];
        $new_execution_count = $row['execution_count'] - 1;
        $next_execution_time = date('Y-m-d H:i:s', strtotime($row['next_execution']) + $row['interval_ms'] / 1000);

        // Update the relay state and schedule details
        $updateRelayState = "UPDATE device_config SET relay_state = 'RELAY_ON' WHERE id = $device_id";
        $updateSchedule = "UPDATE schedules 
                           SET execution_count = $new_execution_count, 
                               next_execution = '$next_execution_time' 
                           WHERE id = $schedule_id";

        if ($conn->query($updateRelayState) && $conn->query($updateSchedule)) {
            $response[] = "Relay state updated for Device ID $device_id, Schedule ID $schedule_id.";
        } else {
            $response[] = "Failed to update relay state or schedule for Device ID $device_id.";
        }
    }
    
} else {
    $response[] = "No schedules are due for execution.";
}

echo json_encode($response);
?>
