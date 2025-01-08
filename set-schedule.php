<?php
include('config/db.php');

// Helper function to get the next upcoming date for a given weekday
function getNextWeekDate($day) {
    $daysOfWeek = [
        'Sunday' => 0,
        'Monday' => 1,
        'Tuesday' => 2,
        'Wednesday' => 3,
        'Thursday' => 4,
        'Friday' => 5,
        'Saturday' => 6,
    ];

    $today = new DateTime();
    $currentDay = $today->format('w'); // Numeric representation of the current day (0 for Sunday, 6 for Saturday)
    $targetDay = $daysOfWeek[$day];

    // Calculate the difference in days to the next occurrence of the target day
    $diff = $targetDay - $currentDay;
    if ($diff <= 0) {
        $diff += 7; // If the target day has passed, add 7 days to get next week's target day
    }

    // Calculate next week's date for the target day
    $today->modify("+$diff days");
    $nextWeekDate = $today->format('Y-m-d');

    return $nextWeekDate;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $device_id = $_POST['device_id'];
    $selected_days = $_POST['days'];  // Array of selected days
    $execution_count = $_POST['execution_count'];
    $schedule_times = $_POST['schedule_times']; // Array of times

    if (!$device_id || empty($selected_days) || !$execution_count || empty($schedule_times)) {
        echo json_encode(['error' => 'All fields are required.']);
        exit;
    }

    // Loop through all selected days and insert schedules
    foreach ($selected_days as $day) {
        $nextWeekDate = getNextWeekDate($day);

        // Insert schedule for each selected day and time
        foreach ($schedule_times as $time) {
            $query = "INSERT INTO watering_time (device_id, trigger_day, schedule_time, schedule_date)
                      VALUES (?, ?, ?, ?)";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("isss", $device_id, $day, $time, $nextWeekDate);
            if (!$stmt->execute()) {
                echo json_encode(['error' => 'Failed to add schedule for ' . $day]);
                exit;
            }
        }
    }

    // After adding, check if last schedule has passed and reinsert schedule for next week
    $lastScheduleQuery = "SELECT * FROM watering_time WHERE device_id = ? ORDER BY schedule_date DESC LIMIT 1";
    $stmt = $conn->prepare($lastScheduleQuery);
    $stmt->bind_param("i", $device_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $lastSchedule = $result->fetch_assoc();

    if ($lastSchedule) {
        $lastScheduleDate = new DateTime($lastSchedule['schedule_date']);
        $currentDate = new DateTime();

        // If the last schedule's date has passed, insert a new schedule for the next week
        if ($lastScheduleDate < $currentDate) {
            foreach ($selected_days as $day) {
                $nextWeekDate = getNextWeekDate($day); // Get the date for the next week

                // Insert new schedules for the next week
                foreach ($schedule_times as $time) {
                    $insertQuery = "INSERT INTO watering_time (device_id, trigger_day, schedule_time, schedule_date)
                                    VALUES (?, ?, ?, ?)";
                    $insertStmt = $conn->prepare($insertQuery);
                    $insertStmt->bind_param("isss", $device_id, $day, $time, $nextWeekDate);
                    $insertStmt->execute();
                }
            }
        }
    }

    echo json_encode(['success' => 'Schedules added successfully.']);
    $stmt->close();
    $conn->close();
}
?>
