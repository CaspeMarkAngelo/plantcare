<?php
// Database configuration
$host = "localhost";
$dbname = "plantcare";
$username = "root";
$password = "";

try {
    // Connect to the database
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get device name from query parameter
    if (isset($_GET['device_name'])) {
        $device_name = $_GET['device_name'];

        // Fetch the device control data from the database
        $stmt = $pdo->prepare("SELECT * FROM device_config WHERE device_name = :device_name");
        $stmt->execute(['device_name' => $device_name]);
        $device = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($device) {
            // Return device control data as JSON
            echo json_encode([
                "device_name" => $device['device_name'],
                "moisture_level" => $device['moisture_level'],
                "relay_state" => $device['relay_state']
            ]);
        } else {
            echo json_encode(["error" => "Device not found"]);
        }
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>
