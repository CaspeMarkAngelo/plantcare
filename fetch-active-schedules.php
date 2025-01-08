<?php
include('config/db.php');

$query = "SELECT * FROM schedules WHERE active = 1";
$result = $conn->query($query);

$schedules = [];
if ($result && $result->num_rows > 0) {
    while ($schedule = $result->fetch_assoc()) {
        $schedules[] = $schedule;
    }
}

echo json_encode($schedules);
?>
