<?php
include('config/db.php');

// Set timezone and fetch current date and time
date_default_timezone_set('Asia/Manila'); // Adjust as needed
$currentDateTime = new DateTime();
$currentDate = $currentDateTime->format('Y-m-d');
$currentTime = $currentDateTime->format('H:i:s');

error_log("Debug: Current Date = $currentDate, Current Time = $currentTime");

$scheduleUpdated = false;

// Prepare query to fetch schedules
$query = "SELECT wt.id, wt.device_id, dc.device_name 
          FROM watering_time AS wt
          JOIN device_config AS dc ON wt.device_id = dc.id
          WHERE wt.schedule_date = ? AND wt.schedule_time = ? AND wt.level != 'done'";
$stmt = $conn->prepare($query);

if (!$stmt) {
    error_log("Failed to prepare query: " . $conn->error);
    exit;
}

$stmt->bind_param("ss", $currentDate, $currentTime);

if ($stmt->execute()) {
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        error_log("Schedules found: " . $result->num_rows);

        while ($row = $result->fetch_assoc()) {
            error_log("Schedule ID: {$row['id']}, Device ID: {$row['device_id']}, Device Name: {$row['device_name']}");

            // Update device_config relay state
            $updateDeviceQuery = "UPDATE device_config SET relay_state = 'RELAY_ON' WHERE id = ?";
            $updateDeviceStmt = $conn->prepare($updateDeviceQuery);
            if ($updateDeviceStmt) {
                $updateDeviceStmt->bind_param("i", $row['device_id']);
                $updateDeviceStmt->execute();
            }

            // Insert notification for the schedule being reached
            $insertNotificationQuery = "INSERT INTO notifications (device_id, message, created_at, device_name, is_read) 
                                        VALUES (?, ?, NOW(), ?, 'unread')";
            $insertNotificationStmt = $conn->prepare($insertNotificationQuery);
            if ($insertNotificationStmt) {
                $notificationMessage = "Schedule reached for device {$row['device_name']}. Relay has been turned ON.";
                $insertNotificationStmt->bind_param("iss", $row['device_id'], $notificationMessage, $row['device_name']);
                $insertNotificationStmt->execute();
            }

            // Update schedule level
            $updateScheduleQuery = "UPDATE watering_time SET level = 'done' WHERE id = ?";
            $updateScheduleStmt = $conn->prepare($updateScheduleQuery);
            if ($updateScheduleStmt) {
                $updateScheduleStmt->bind_param("i", $row['id']);
                $updateScheduleStmt->execute();
            }

            $scheduleUpdated = true;
        }
    } else {
        error_log("No schedules found for the current date and time.");
    }
} else {
    error_log("Query execution failed: " . $stmt->error);
}

$stmt->close();
$conn->close();

$response = [
    "success" => $scheduleUpdated,
    "message" => $scheduleUpdated ? "Schedules updated successfully." : "No schedules to update.",
];
header('Content-Type: application/json');
echo json_encode($response);
?>
