<?php
date_default_timezone_set('Asia/Manila');
$servername = "localhost";
$username = "root";
$password = "";
$database = "plantcare";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch unique device names for filtering
$devicesQuery = "SELECT DISTINCT device_name FROM watering_logs";
$devicesResult = $conn->query($devicesQuery);

// Handle filtering
$filter = '';
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['device_name']) && !empty($_GET['device_name'])) {
    $filter = $_GET['device_name'];
    $query = "SELECT * FROM watering_logs WHERE device_name = ? ORDER BY timestamp DESC";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("s", $filter);
    $stmt->execute();
    $result = $stmt->get_result();
} else {
    // Default: Fetch all logs if no filter is applied
    $query = "SELECT * FROM watering_logs ORDER BY timestamp DESC";
    $result = $conn->query($query);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Watering Logs</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px 12px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <?php include('sidebar.php');?>
    <div class ="content">
    <h1>Watering Logs</h1>

<!-- Filtering Form -->
<form method="GET" action="">
    <label for="device_name">Filter by Device Name:</label>
    <select name="device_name" id="device_name">
        <option value="">-- All Devices --</option>
        <?php while ($device = $devicesResult->fetch_assoc()): ?>
            <option value="<?= htmlspecialchars($device['device_name']) ?>" 
                <?= $filter === $device['device_name'] ? 'selected' : '' ?>>
                <?= htmlspecialchars($device['device_name']) ?>
            </option>
        <?php endwhile; ?>
    </select>
    <button type="submit">Filter</button>
    <button type="button" onclick="window.location.href='?';">Clear Filter</button>
</form>

<table>
    <thead>
        <tr>
            <th>Device Name</th>
            <th>Timestamp</th>
            <th>Soil Moisture</th>
            <th>Relay State</th>
            <th>Remarks</th>
        </tr>
    </thead>
    <tbody>
        <?php if ($result && $result->num_rows > 0): ?>
            <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?= htmlspecialchars($row['device_name']) ?></td>
                    <td><?= htmlspecialchars($row['timestamp']) ?></td>
                    <td><?= htmlspecialchars($row['soil_moisture']) ?>%</td>
                    <td><?= htmlspecialchars($row['relay_state']) ?></td>
                    <td><?= htmlspecialchars($row['remarks']) ?></td>
                </tr>
            <?php endwhile; ?>
        <?php else: ?>
            <tr>
                <td colspan="5">No logs found for the selected filter.</td>
            </tr>
        <?php endif; ?>
    </tbody>
</table>
    </div>
</body>
</html>
<?php $conn->close(); ?>
