<?php
include('config/db.php');
$plant_id = $_GET['id'];

// Query to get plant details
$sql = "SELECT * FROM plants WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $plant_id);
$stmt->execute();
$result = $stmt->get_result();

// Check if plant exists
if ($result->num_rows > 0) {
    $plant = $result->fetch_assoc();
} else {
    echo "Plant not found.";
    exit;
}

// Query to get device details
$deviceQuery = "SELECT id, device_name FROM device_config";
$deviceResult = $conn->query($deviceQuery);

// Handle the form submission to update the device_id and moisture level
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['device_id'])) {
    $device_id = (int) $_POST['device_id'];

    // Get the soil moisture value from the plant
    $soil_moisture = $plant['soil_moisture'];

    // Update device moisture level in the device_config table
    $updateDeviceQuery = "UPDATE device_config SET moisture_level = ? WHERE id = ?";
    $updateStmt = $conn->prepare($updateDeviceQuery);
    $updateStmt->bind_param("ii", $soil_moisture, $device_id);
    
    if ($updateStmt->execute()) {
        // Update the plant to link with the selected device
        $updatePlantQuery = "UPDATE plants SET device = ? WHERE id = ?";
        $plantStmt = $conn->prepare($updatePlantQuery);
        $plantStmt->bind_param('ii', $device_id, $plant_id);

        if ($plantStmt->execute()) {
            echo "<script>alert('Device assigned and moisture level updated successfully.');</script>";
            // Refresh the page to reflect the updated device selection
            echo "<script>window.location.href = '?id=$plant_id';</script>";
            exit;
        } else {
            echo "<script>alert('Error updating plant device: " . $conn->error . "');</script>";
        }
    } else {
        echo "<script>alert('Error updating device moisture level: " . $conn->error . "');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $plant['name']; ?> Details</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .plant-details-container {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            margin-top: 20px;
        }
        .plant-details-left {
            display: flex;
            flex-direction: column;
        }
        .plant-details-img {
            width: 250px;
            height: 520px;
            object-fit: cover;
            border-radius: 10px;
            margin-top: -20px;
        }
        .plant-info h2 {
            color: #006A4E;
        }
        .plant-stats {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }
        .stat-box {
            background: linear-gradient(to bottom right, #00CC33, #1B8A6B);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            color: white;
            flex: 1;
        }
    </style>
</head>
<body>
<?php include('sidebar.php'); ?>
    <div class="content">
        <h1 style="color: black;">Plant Details</h1>
        <div class="plant-details-container">
            <div class="plant-details-left">
                <img src="<?php echo $plant['image_url']; ?>" alt="<?php echo $plant['name']; ?>" class="plant-details-img">
            </div>
            <div class="plant-info">
                <h2><?php echo $plant['name']; ?></h2>
                <p><strong>Details:</strong> <?php echo $plant['details']; ?></p>
                <div class="plant-stats">
                    <div class="stat-box">
                        <h3>Water Schedule</h3>
                        <p><?php echo $plant['water_schedule']; ?></p>
                    </div>
                    <div class="stat-box">
                        <h3>Fertilizer</h3>
                        <p><?php echo $plant['fertilizer']; ?></p>
                    </div>
                    <div class="stat-box">
                        <h3>Humidity</h3>
                        <p><?php echo $plant['humidity']; ?></p>
                    </div>
                    <div class="stat-box">
                        <h3>Soil Moisture</h3>
                        <p><?php echo $plant['soil_moisture']; ?></p>
                    </div>
                </div>
                <br>
                <form method="POST">
                    <label for="deviceSelect">Assign Device:</label>
                    <select id="deviceSelect" name="device_id" onchange="this.form.submit()">
                        <option value="">-- Select Device --</option>
                        <?php
                        if ($deviceResult->num_rows > 0):
                            while ($device = $deviceResult->fetch_assoc()): ?>
                                <option value="<?php echo $device['id']; ?>" 
                                    <?php echo $plant['device']  == $device['id'] ? 'selected' : ''; ?>>
                                    <?php echo htmlspecialchars($device['device_name']); ?>
                                </option>
                            <?php endwhile;
                        endif;
                        ?>
                    </select>
                </form>
                <button 
                    class="set-schedule-btn" 
                    onclick="window.location.href='schedule.php?id=<?php echo $plant_id; ?>'">
                    Set Schedule
                </button>
            </div>
        </div>
    </div>
</body>
</html>
