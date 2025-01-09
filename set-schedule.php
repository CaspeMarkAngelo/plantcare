<?php
// Include necessary files
include('config/db.php');
include('sensors.php');
include('sidebar.php');

// Check if form data has been sent via POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get data from the form
    $device_id = $_POST['device_id'];
    $days = $_POST['days']; // Array of selected days (e.g., Monday, Tuesday, etc.)
    $execution_count = $_POST['execution_count'];
    $schedule_times = $_POST['schedule_times']; // Array of times (e.g., 08:00, 12:00)
    $status = $_POST['status']; // Schedule type (daily, weekly, etc.)

    // Check if all required fields are provided
    if (empty($device_id) || empty($days) || empty($execution_count) || empty($schedule_times) || empty($status)) {
        echo json_encode(['error' => 'All fields are required.']);
        exit;
    }

    // If "Weekly" is selected, insert schedule for 4 weeks
    if ($status === 'weekly') {
        $currentDate = date('Y-m-d'); // Start from today (or use the first day of the month if needed)

        // Loop through each selected day (e.g., Sunday, Monday)
        foreach ($days as $day) {
            for ($i = 0; $i < 4; $i++) { // 4 weeks of schedules
                // Calculate the date for the specific day of the week in the next 4 weeks
                $nextExecutionDate = date('Y-m-d', strtotime("next $day +$i week"));

                // Loop through each scheduled time
                foreach ($schedule_times as $time) {
                    // Prepare the schedule insertion query
                    $query = "INSERT INTO watering_time (device_id, trigger_day, schedule_time, schedule_date, status)
                              VALUES (?, ?, ?, ?, ?)";
                    $stmt = $conn->prepare($query);
                    $stmt->bind_param("issss", $device_id, $day, $time, $nextExecutionDate, $status);

                    // Execute the query
                    if (!$stmt->execute()) {
                        echo json_encode(['error' => 'Failed to add schedule for ' . $nextExecutionDate]);
                        exit;
                    }
                }
            }
        }

        echo json_encode(['success' => 'Weekly schedule successfully added.']);
        exit;
    }

    // If "Daily" is selected, insert daily schedule
    if ($status === 'daily') {
        foreach ($days as $day) {
            foreach ($schedule_times as $time) {
                $query = "INSERT INTO watering_time (device_id, trigger_day, schedule_time, schedule_date, status)
                          VALUES (?, ?, ?, ?, ?)";
                $stmt = $conn->prepare($query);
                $stmt->bind_param("issss", $device_id, $day, $time, date('Y-m-d'), $status); // Daily schedule (today's date)

                // Execute the query
                if (!$stmt->execute()) {
                    echo json_encode(['error' => 'Failed to add daily schedule for ' . date('Y-m-d')]);
                    exit;
                }
            }
        }

        echo json_encode(['success' => 'Daily schedule successfully added.']);
        exit;
    }

    // Handle "Once" status
    if ($status === 'once') {
        $currentDate = date('Y-m-d'); // Today's date for "Once"
        foreach ($schedule_times as $time) {
            $query = "INSERT INTO watering_time (device_id, trigger_day, schedule_time, schedule_date, status)
                      VALUES (?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($query);
            $stmt->bind_param("issss", $device_id, $currentDate, $time, $currentDate, $status);

            if (!$stmt->execute()) {
                echo json_encode(['error' => 'Failed to add schedule for ' . $currentDate]);
                exit;
            }
        }

        echo json_encode(['success' => 'One-time schedule successfully added.']);
        exit;
    }

    echo json_encode(['error' => 'Invalid schedule status.']);
    exit;
}
?>

