<?php
include('config/db.php');

// Fetch all schedules, regardless of any status (since status is not used anymore)
$querySchedules = "SELECT * FROM watering_time"; 
$result = $conn->query($querySchedules);

if ($result && $result->num_rows > 0) {
    while ($schedule = $result->fetch_assoc()) {
        // Get schedule details
        $device_id = $schedule['device_id'];
        $trigger_day = $schedule['trigger_day'];
        $schedule_time = $schedule['schedule_time'];
        $schedule_date = $schedule['schedule_date'];

        // Calculate the next schedule date for the same weekday next week
        $next_schedule_date = new DateTime("next $trigger_day"); // Get next week's same day
        $next_schedule_date = $next_schedule_date->format('Y-m-d');

        // Check if a schedule for the next week already exists for the same device and time
        $checkQuery = "SELECT * FROM watering_time WHERE device_id = '$device_id' AND schedule_date = '$next_schedule_date' AND schedule_time = '$schedule_time'";
        $checkResult = $conn->query($checkQuery);

        if ($checkResult->num_rows == 0) {
            // Insert the new schedule for next week
            $insertQuery = "INSERT INTO watering_time (device_id, trigger_day, schedule_time, schedule_date)
                            VALUES ('$device_id', '$trigger_day', '$schedule_time', '$next_schedule_date')";
            if ($conn->query($insertQuery)) {
                echo "New schedule inserted for next week.<br>";
            } else {
                echo "Failed to insert new schedule for next week.<br>";
            }
        } else {
            echo "Schedule already exists for next week.<br>";
        }
    }
} else {
    echo "No schedules found to check or all schedules are already handled.<br>";
}

$conn->close();
?>
