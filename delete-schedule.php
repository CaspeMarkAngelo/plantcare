<?php
include('config/db.php');

// Get the current date and time
$current_time = new DateTime();

// Query to find any schedule that has passed
$query = $conn->prepare("SELECT * FROM watering_time WHERE start_date <= NOW()");
$query->execute();
$result = $query->get_result();

$response = [];

if ($result->num_rows > 0) {
    // Loop through the schedules and delete them
    while ($schedule = $result->fetch_assoc()) {
        // Delete schedule for the device that reached its start date
        $deleteQuery = $conn->prepare("DELETE FROM watering_time WHERE id = ?");
        $deleteQuery->bind_param('i', $schedule['id']);
        if ($deleteQuery->execute()) {
            $response[] = "Schedule for device " . $schedule['device_id'] . " has been deleted.";
        
        } else {
            $response[] = "Error deleting schedule for device " . $schedule['device_id'];
        }
    }
} else {

}

$query->close();
$conn->close();

echo json_encode($response);
exit;
