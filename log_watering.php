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

// Insert watering log
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['device_name']) && isset($_POST['soil_moisture']) && isset($_POST['relay_state'])) {
    $deviceName = $_POST['device_name'];
    $soilMoisture = $_POST['soil_moisture'];
    $relayState = $_POST['relay_state'];
    $remarks = isset($_POST['remarks']) ? $_POST['remarks'] : "No remarks";

    $query = "INSERT INTO watering_logs (device_name, timestamp, soil_moisture, relay_state, remarks) 
              VALUES (?, NOW(), ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("siss", $deviceName, $soilMoisture, $relayState, $remarks);
    
    if ($stmt->execute()) {
        echo "Watering log added successfully.";
    } else {
        echo "Error: " . $conn->error;
    }

    $stmt->close();
}
$conn->close();
?>
