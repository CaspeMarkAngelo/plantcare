<?php
// Set the timezone to Asia/Manila
date_default_timezone_set('Asia/Manila');

// Database connection details
$host = 'localhost';
$dbname = 'plantcare';
$username = 'root'; // Replace with your DB username
$password = ''; // Replace with your DB password

// Create a new PDO connection to MySQL database
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    exit;
}

// Function to update relay state and reschedule the task
function updateRelayStateAndReschedule($deviceId, $nextRun, $period, $repeats) {
    global $pdo;
    $currentTime = time();

    // Check if the task's next run time has passed
    if (strtotime($nextRun) <= $currentTime) {
        // Task is past the next run time, update relay state to 'RELAY_ON' for the specific device
        $stmt = $pdo->prepare("UPDATE device_config SET relay_state = 'RELAY_ON' WHERE id = :deviceId");
        $stmt->bindParam(':deviceId', $deviceId);
        $stmt->execute();

        // Calculate the new next_run time
        $newNextRun = calculateNextRunTime($period, $repeats);

        // Update the next_run time and reschedule the task in the tasks table
        $stmt = $pdo->prepare("UPDATE tasks SET next_run = :newNextRun WHERE device_id = :deviceId");
        $stmt->bindParam(':newNextRun', $newNextRun);
        $stmt->bindParam(':deviceId', $deviceId);
        $stmt->execute();
    } else {
        // If the task's next run time has not been reached, set the task status to inactive
        $stmt = $pdo->prepare("UPDATE tasks SET status = 'inactive' WHERE device_id = :deviceId");
        $stmt->bindParam(':deviceId', $deviceId);
        $stmt->execute();
    }
}

// Function to calculate the next run time based on period and repeats
function calculateNextRunTime($period, $repeats) {
    $currentTime = time(); // Get the current time in seconds

    if ($period == 'daily') {
        $interval = (24 / $repeats) * 60 * 60; // Daily task: divided by repeats
    } elseif ($period == 'weekly') {
        $interval = (7 / $repeats) * 24 * 60 * 60; // Weekly task: divided by repeats
    } elseif ($period == 'monthly') {
        $interval = (30 / $repeats) * 24 * 60 * 60; // Monthly task: divided by repeats
    } else {
        return null; // Invalid period
    }

    // Calculate the next run time
    return date('Y-m-d H:i:s', $currentTime + $interval);
}

// Fetch tasks from the database
$stmt = $pdo->query("SELECT * FROM tasks");
$tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Check if the task's next run time has passed and update status & reschedule
foreach ($tasks as $task) {
    updateRelayStateAndReschedule($task['device_id'], $task['next_run'], $task['period'], $task['repeats']);
}

// Generate the HTML for the task list
foreach ($tasks as $task) {
    echo "<tr>";
    echo "<td>" . htmlspecialchars($task['task_name']) . "</td>";
    echo "<td>" . htmlspecialchars($task['period']) . "</td>";
    echo "<td>" . htmlspecialchars($task['repeats']) . "</td>";
    echo "<td>" . htmlspecialchars($task['next_run']) . "</td>";
    echo "<td>" . htmlspecialchars($task['status']) . "</td>";
    echo "</tr>";
}
?>
