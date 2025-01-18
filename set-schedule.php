<?php
include('config/db.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $device_id = $_POST['device_id'];
    $days = $_POST['days']; // Array of selected days
    $execution_count = $_POST['execution_count'];
    $schedule_times = $_POST['schedule_times']; // Array of schedule times
    $status = $_POST['status']; // 'daily', 'weekly', or 'monthly'
    $start_date = $_POST['start_date']; // Start date
    $end_date = $_POST['end_date']; // End date

    if (!$device_id || empty($days) || !$execution_count || empty($schedule_times) || !$status || !$start_date || !$end_date) {
        echo json_encode(['error' => 'All fields are required.']);
        exit;
    }

    // Convert dates to DateTime objects
    $startDateObj = new DateTime($start_date);
    $endDateObj = new DateTime($end_date);

    if ($startDateObj > $endDateObj) {
        echo json_encode(['error' => 'End date must be later than or equal to the start date.']);
        exit;
    }

    // Map days to numeric representation (Sunday = 0, Monday = 1, etc.)
    $dayMap = [
        'Sunday' => 0,
        'Monday' => 1,
        'Tuesday' => 2,
        'Wednesday' => 3,
        'Thursday' => 4,
        'Friday' => 5,
        'Saturday' => 6
    ];

    // Loop through each day selected
    foreach ($days as $day) {
        $dayOfWeek = $dayMap[$day];
        $currentDate = clone $startDateObj;

        // Adjust to the first occurrence of the selected day
        $currentDayOfWeek = (int)$currentDate->format('w');

        // If the current day is earlier than or equal to the target day, move forward
        if ($currentDayOfWeek <= $dayOfWeek) {
            $currentDate->modify('+' . ($dayOfWeek - $currentDayOfWeek) . ' days');
        } else {
            // If the target day is earlier in the week, move to the next week's occurrence of the target day
            $currentDate->modify('+' . (7 - $currentDayOfWeek + $dayOfWeek) . ' days');
        }

        // Loop through the dates until the end date
        while ($currentDate <= $endDateObj) {
            $schedule_date = $currentDate->format('Y-m-d');

            // Ensure that the date matches the correct day of the week
            if ((int)$currentDate->format('w') !== $dayOfWeek) {
                $currentDate->modify('+1 day');
                continue; // Skip to the next day if it doesn't match
            }

            // Delete existing schedules that match the same day and time
            foreach ($schedule_times as $time) {
                $deleteSql = "DELETE FROM watering_time 
                              WHERE device_id = '$device_id' 
                              AND schedule_time = '$time' 
                              AND schedule_date = '$schedule_date' 
                              AND status = '$status'";
                if (!$conn->query($deleteSql)) {
                    echo json_encode(['error' => 'Failed to delete existing schedule: ' . $conn->error]);
                    exit;
                }
            }

            // Insert the new schedule for each selected time
            foreach ($schedule_times as $time) {
                $sql = "INSERT INTO watering_time (device_id, trigger_day, schedule_time, every, schedule_date, status, level) 
                        VALUES ('$device_id', '$day', '$time', '$execution_count', '$schedule_date', '$status','pending')";

                if (!$conn->query($sql)) {
                    echo json_encode(['error' => 'Failed to save schedule: ' . $conn->error]);
                    exit;
                }
            }

            // Adjust the current date based on the schedule frequency (daily, weekly, or monthly)
            switch ($status) {
                case 'daily':
                    $currentDate->modify('+1 day');
                    break;
                case 'weekly':
                    $currentDate->modify('+7 days');
                    break;
                case 'monthly':
                    $currentDate->modify('+1 month');
                    break;
                default:
                    echo json_encode(['error' => 'Invalid status.']);
                    exit;
            }
        }
    }

    echo json_encode(['success' => 'Schedule saved successfully.']);
    exit;
}
?>
