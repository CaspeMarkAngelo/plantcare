<?php
date_default_timezone_set('Asia/Manila');
$servername = "localhost";
$username = "root";
$password = "";
$database = "plantcare";

$conn = new mysqli($servername, $username, $password, $database);
$conn->query("SET time_zone = '+08:00';");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle heartbeat signal
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['device_name'])) {
    $deviceName = $_POST['device_name'];
    $currentTime = date("Y-m-d H:i:s");

    // Update or insert the device's heartbeat
    $query = "INSERT INTO devices (device_name, last_checkin, status) 
              VALUES (?, ?, 'Connected') 
              ON DUPLICATE KEY UPDATE 
                  last_checkin = ?, 
                  status = 'Connected'";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("sss", $deviceName, $currentTime, $currentTime);
    $stmt->execute();
    $stmt->close();
    exit("Device heartbeat updated.");
}

// Fetch connected devices
$threshold = 10; // Time threshold in seconds
$query = "SELECT device_name, MAX(last_checkin) AS last_checkin, status, 
TIMESTAMPDIFF(SECOND, MAX(last_checkin), NOW()) AS seconds_since_last FROM devices 
GROUP BY device_name ORDER BY last_checkin DESC ";
$result = $conn->query($query);

$devices = [];
if ($result) {
    while ($row = $result->fetch_assoc()) {
        if ($row['seconds_since_last'] <= $threshold) {
            $row['status'] = 'Connected';
        } else {
            $row['status'] = 'Disconnected';
        }
        $devices[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($devices);
?>
