<?php 
include('config/db.php');
include('sensors.php');
include('sidebar.php');

// Fetching schedule data
$query = "SELECT wt.id, wt.device_id, wt.schedule_date, wt.schedule_time, wt.trigger_day, wt.status, dc.device_name 
    FROM watering_time AS wt
    JOIN device_config AS dc ON wt.device_id = dc.id
    ORDER BY wt.schedule_date";

$result = $conn->query($query);

$scheduledDevices = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $scheduledDevices[] = $row;
    }
} 
?>

<!-- Display Scheduled Devices and Their Schedules -->
<div class="schedules-container">
    <div class="schedule-list">
        <h2>Scheduled Devices</h2><br>
        <div class="scheduled-devices">
            <?php
            // Group schedules by device name
            $groupedSchedules = [];
            foreach ($scheduledDevices as $schedule) {
                $groupedSchedules[$schedule['device_name']][] = $schedule;
            }

            // Iterate over grouped schedules
            foreach ($groupedSchedules as $deviceName => $deviceSchedules): ?>
                <div class="scheduled-device-card">
                    <h3 class="device-title"><?php echo htmlspecialchars($deviceName); ?></h3>
                    <div class="schedule-details">
                        <?php foreach ($deviceSchedules as $schedule): ?>
                            <div class="schedule-item">
                                <p><strong>Schedule Start:</strong> 
                                    <span style="color: white;" class="remove-schedule" onclick="removeSchedule(<?php echo $schedule['id']; ?>)">&#10006;</span>
                                </p>
                                <p>
                                    <?php
                                    $startDateTime = isset($schedule['schedule_date']) && isset($schedule['schedule_time']) 
                                        ? new DateTime($schedule['schedule_date'] . ' ' . $schedule['schedule_time']) 
                                        : null;
                                    echo $startDateTime 
                                        ? $startDateTime->format('F j, Y - g:i a') 
                                        : "N/A";
                                    ?>
                                </p>
                                <p><strong>Frequency:</strong> <?php echo htmlspecialchars($schedule['trigger_day'] ?? "N/A"); ?></p>
                                <p><strong>Status:</strong> <?php echo htmlspecialchars($schedule['status'] ?? "N/A"); ?></p>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>

<style>
.schedules-container {
    margin-left: 400px;
    padding: 20px;
    font-family: Arial, sans-serif;
    max-width: 600px;
}

.schedule-list {
    background: #f9f9f9;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.scheduled-devices {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
}

.scheduled-device-card {
    flex: 1 1 calc(33% - 20px);
    background: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 15px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.device-title {
    font-size: 18px;
    margin-bottom: 10px;
    color: #333;
}

.schedule-details {
    margin-top: 10px;
}

.schedule-item {
    border-top: 1px solid #eee;
    padding: 10px 0;
    font-size: 14px;
}

.schedule-item:first-child {
    border-top: none;
}

.remove-schedule {
    cursor: pointer;
    font-weight: bold;
}

.remove-schedule:hover {
    color: darkred;
}
</style>
