<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sensor Data</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <?php
    // Database connection
    include 'config/db.php';

    if (isset($_GET['device_name'])) {
        $device_name = $_GET['device_name'];

        // Query to get all sensor data for the given device_name
        $query = "SELECT `id`, `temperature`, `humidity`, `soil_moisture`, `pir_state`, `timestamp`, `device_name`
                  FROM `sensordata`
                  WHERE `device_name` = ?
                  ORDER BY `timestamp` DESC";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("s", $device_name);
        $stmt->execute();
        $result = $stmt->get_result();

        echo "<h1 class='mb-4'>All Sensor Data for Device: <span class='text-primary'>" . htmlspecialchars($device_name) . "</span></h1>";

        if ($result && $result->num_rows > 0) {
            echo "<table class='table table-striped table-bordered'>
                    <thead class='table-dark'>
                        <tr>
                            <th>ID</th>
                            <th>Temperature (°C)</th>
                            <th>Humidity (%)</th>
                            <th>Soil Moisture (%)</th>
                            <th>PIR State</th>
                            <th>Timestamp</th>
                        </tr>
                    </thead>
                    <tbody>";
            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                        <td>" . htmlspecialchars($row['id']) . "</td>
                        <td>" . htmlspecialchars($row['temperature']) . "</td>
                        <td>" . htmlspecialchars($row['humidity']) . "</td>
                        <td>" . htmlspecialchars($row['soil_moisture']) . "</td>
                        <td>" . htmlspecialchars($row['pir_state']) . "</td>
                        <td>" . htmlspecialchars($row['timestamp']) . "</td>
                    </tr>";
            }
            echo "</tbody>
                </table>";
        } else {
            echo "<div class='alert alert-warning'>No sensor data found for this device.</div>";
        }
    } else {
        echo "<div class='alert alert-danger'>Device name is required.</div>";
    }
    ?>
    <div class="mt-4">
        <a href="javascript:history.back()" class="btn btn-secondary">Back</a>
    </div>
</div>

<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
