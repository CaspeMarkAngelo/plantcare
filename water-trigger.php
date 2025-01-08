<?php
include('config/db.php');
include('sensors.php');
include('sidebar.php');

$queryDevices = "SELECT * FROM device_config";
$devicesResult = $conn->query($queryDevices);
$start = null;
$devices = [];
if ($devicesResult && $devicesResult->num_rows > 0) {
    while ($device = $devicesResult->fetch_assoc()) {
        $devices[] = $device;
    }
}

$querySchedules = "SELECT wt.*, dc.device_name 
    FROM watering_time AS wt
    JOIN device_config AS dc ON wt.device_id = dc.id
    ORDER BY wt.start_date DESC LIMIT 5"; // Modify as needed
$conWateringTime = $conn->query($querySchedules);
$schedules = [];
if ($conWateringTime && $conWateringTime->num_rows > 0) {
    while ($schedule = $conWateringTime->fetch_assoc()) {
        $schedules[] = $schedule;
    }
}

$query = "SELECT s.id, s.device_id, s.schedule_type, s.execution_count, s.interval_ms, s.next_execution, d.device_name 
          FROM schedules s
          JOIN device_config d ON s.device_id = d.id";

$result = $conn->query($query);

$scheduledDevices = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $scheduledDevices[] = $row;
    }
} else {
    $scheduledDevices = [];
}
$query = "SELECT 
             dc.id AS device_id, 
             dc.device_name, 
             dc.moisture_level, 
             dc.relay_state, 
             dc.updated_at, 
             p.id AS plant_id, 
             p.name AS plant_name 
          FROM device_config dc 
          JOIN plants p ON dc.plantId = p.id";

$result = $conn->query($query);
while ($row = $result->fetch_assoc()) {
    $plantName = $row['plant_name']; // Use this variable for the plant name
}

?>
<head>
    <title>water trigger</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<div class="content">
    <div class="container" id="controlDataContainer">
    <div style = "
            display: flex;
            align-items: center;  /* Vertically center the items */
            justify-content: space-between;  /* Optional: spaces out the elements */
        ">
    <h2 class>Control Device</h2>
    <div>
    <?php include('notifications.php')?>
    </div>
    </div>
        <span id="notification-badge" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="display: none;">
            0
        </span>
    </button></h4>
        

    <!-- Modal -->
    <div class="modal fade" id="notificationsModal" tabindex="-1" aria-labelledby="notificationsModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="notificationsModalLabel">Notifications</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="notification-list">
                    <p>Loading notifications...</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

        <br>
        <form id="addDeviceForm">
            <fieldset >
                <legend>Add New Device:</legend>
                <input type="text" id="device_name" name="device_name" placeholder="Device Name" required>
                <button style="background-color: #006A4E;" type="submit">Add Device</button>
                <button style="background-color: #006A4E;">  <a href="schedule.php" style="color: white; text-decoration: none;">set schedule</a></button>   
            </fieldset>
        </form>
        
        <br>

        <div class="device-grid">
    <?php foreach ($devices as $device): ?>
        <div class="device-card">
        <h5 onclick="showSensorData('<?php echo htmlspecialchars($device['device_name']); ?>')" style="cursor: pointer;">
                <?php echo htmlspecialchars($device['device_name']); ?>
        </h5>

            <label for="plant-select-<?php echo $device['id']; ?>">Select Plant: <?php echo $plantName; ?></label>
<select id="plant-select-<?php echo $device['id']; ?>" onchange="selectPlant(<?php echo $device['id']; ?>, this.value)">
    <option value="">-- Select Plant --</option>
    <?php
    $plantsQuery = "SELECT id, name FROM plants";
    $plantsResult = $conn->query($plantsQuery);
    if ($plantsResult && $plantsResult->num_rows > 0):
        while ($plant = $plantsResult->fetch_assoc()): ?>
            <option value="<?php echo $plant['id']; ?>">
                <?php echo htmlspecialchars($plant['name']); ?>
            </option>
        <?php endwhile;
    endif;
    ?>
</select>

            <!-- Soil Moisture Input -->
            <p>Soil Moisture Level: 
                <input 
                    type="number" 
                    id="soil-moisture-input-<?php echo $device['id']; ?>" 
                    min="1" 
                    max="100" 
                    onchange="updateMoistureLevel(<?php echo $device['id']; ?>, this.value)" 
                    value="<?php echo htmlspecialchars($device['moisture_level']); ?>" 
                    style="width: 80px;" 
                    placeholder="Enter soil moisture"
                    onclick="updateMoistureLevel(<?php echo $device['id']; ?>, this.value)"
                >%
            </p>
            <p>Relay State: <span><?php echo $device['relay_state']; ?></span></p>
            <br>
            <div class="control-buttons">
                <button style="background-color: #006A4E;" onclick="removeDevice(<?php echo $device['id']; ?>)">Remove Device</button>
                <button style="background-color: #006A4E;" onclick="controlDeviceRelay(<?php echo $device['id']; ?>, 'on')">Turn Relay ON</button>
                <button style="background-color: #006A4E;" onclick="controlDeviceRelay(<?php echo $device['id']; ?>, 'off')">Turn Relay OFF</button>
            </div>
        </div>
    <?php endforeach; ?>
</div>
<div id="sensorModal" style="display: none; position: fixed; top: 20%; left: 30%; padding: 20px; background: white; border: 1px solid #ccc; box-shadow: 0 0 10px rgba(0,0,0,0.5);">
    <div id="modalContent"></div>
    <button onclick="closeModal()">Close</button>
    <button id="viewAllButton" style="margin-top: 10px;">View All Data</button>
</div>
              <br>
                                <br>
        <!-- Display Scheduled Devices and Their Schedules -->
        <div class="schedules-container">
            <div class="schedule-list">
                <h5>Scheduled Devices</h5>
                <div class="scheduled-devices">
                    <?php foreach ($schedules as $schedule): ?>
                        <div class="scheduled-device-card">
                            <h4>Device: <?php echo htmlspecialchars($schedule['device_name']); ?></h4>
                            <p>Schedule Start: <?php
                                $startDateTime = new DateTime($schedule['start_date']);
                                echo $startDateTime->format('F j, Y - g:i a');
                            ?></p>
                         <span style="color: red;" class="clear-schedule" onclick="clearSchedule(<?php echo $device['id']; ?>)">&#10006;</span>
                        </div>
                    <?php endforeach; ?>
                </div>
                <div class="scheduled-devices-container">

                <div class="device-cards-container">
    <?php foreach ($scheduledDevices as $device): ?>
        <div class="device-card" id="device-card-<?php echo $device['id']; ?>">
           
            <p class="next-schedule">Next Schedule: 
                <?php 
                    $nextExecution = new DateTime($device['next_execution']);
                    echo $nextExecution->format('F j, Y - g:i a');
                ?>
            </p>
        </div>
    <?php endforeach; ?>
</div>
<div class="clear-scheduler-container">
    <h5>Clear Scheduler</h5>
    <form id="clear-scheduler-form">
        <label for="device-select">Select Device:</label>
        <select id="device-select" name="device_id">
            <option value="">-- Select a Device --</option>
            <?php
            // Fetch devices with schedules from the database
            $devicesQuery = "SELECT id, device_name FROM device_config"; // Replace `devices` with your device table name
            $devicesResult = $conn->query($devicesQuery);
            if ($devicesResult && $devicesResult->num_rows > 0):
                while ($device = $devicesResult->fetch_assoc()): ?>
                    <option value="<?php echo htmlspecialchars($device['id']); ?>">
                        <?php echo htmlspecialchars($device['device_name']); ?>
                    </option>
                <?php endwhile;
            endif;
            ?>
        </select>
        <button type="button" id="clear-schedule-btn" onclick="clearScheduler()" style="background-color: #ff4d4d; color: white; padding: 10px 20px; border: none; cursor: pointer;">
            Clear Schedule
        </button>
    </form>
</div>


</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<script src="js/trigger.js"></script>
<script>

function clearScheduler() {
    const deviceId = document.getElementById('device-select').value;

    if (!deviceId) {
        alert('Please select a device to clear its schedule.');
        return;
    }

    if (confirm('Are you sure you want to clear the schedule for this device?')) {
        // AJAX request to clear the schedule
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'clear_scheduler.php', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                const response = xhr.responseText;

                if (response === 'success') {
                    alert('Schedule cleared successfully!');
                    window.location.reload();
                } else {
                    alert('Failed to clear the schedule.');
                }
            }
        };
        xhr.send('device_id=' + deviceId); // Send the device ID to the server
    }
}


function clearSchedule(deviceId) {
    if (confirm('Are you sure you want to clear the schedule for this device?')) {
        // AJAX request to clear the schedule
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'clear_schedule.php', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var response = xhr.responseText;
                if (response == 'success') {
                    // Remove the device card from the page
                    document.getElementById('device-card-' + deviceId).remove();
                } else {
                    window.location.reload();
                }
            }
        };
        xhr.send('device_id=' + deviceId); // Send the device ID to the server
    }
}

// Function to handle plant selection
function selectPlant(deviceId, plantId) {
    if (!plantId) {
        alert("Please select a valid plant.");
        return;
    }

    // Update the plantId in the database
    fetch('update-device-plant.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ deviceId, plantId }),
    })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert("Plant successfully updated for the device.");

                // Ask user if they want a default schedule
                const useDefaultSchedule = confirm("Do you want to use the default schedule for this plant?");
                if (useDefaultSchedule) {
                    // Fetch plant data and insert default schedule
                    fetch(`get-plant-data.php?plant_id=${plantId}`)
                        .then(response => response.json())
                        .then(data => {
                            if (data.error) {
                                alert(data.error);
                            } else {
                                // Insert schedule data into the 'schedules' table
                                insertSchedule(deviceId, plantId, data);

                                // Optionally, update soil moisture or other fields
                                const inputField = document.getElementById(`soil-moisture-input-${deviceId}`);
                                if (inputField) {
                                    inputField.value = data.soil_moisture;
                                }
                            }
                        })
                        .catch(error => console.error('Error fetching plant data:', error));
                } else {
                    alert("No schedule was applied.");
                }

                // Optionally reload or update the UI
       
            } else {
                alert(data.error || "Failed to update the plant.");
            }
        })
        .catch(error => console.error('Error updating plant:', error));
}


// Function to insert the schedule into the 'schedules' table
function insertSchedule(deviceId, plantId, plantData) {
    // Extract the schedule data from plantData

    const scheduleData = {
        device_id: deviceId,
        schedule_type: plantData.schedule_type, // E.g., 'daily', 'weekly'
        execution_count: plantData.execution_count, // Number of executions
        interval_ms: plantData.interval_ms * 60 * 60 * 1000// Interval in milliseconds
    };

    // Save schedule in the database using jQuery AJAX
    $.ajax({
        url: 'insert-schedule.php',
        type: 'POST',
        data: scheduleData,
        success: function (response) {
            const parsedResponse = JSON.parse(response);
            if (parsedResponse.success) {
                alert('Schedule inserted successfully!');

                // Trigger execution based on schedule
          
                let executionDone = 0; // Counter for completed executions
                const scheduler = setInterval(() => {
                    if (executionDone >= scheduleData.execution_count) {
                        clearInterval(scheduler);
                        alert(`Schedule for device ${deviceId} completed.`);
                        return;
                    }

                    // Call relay control for the device
                    controlDeviceRelay(deviceId, 'on');

                    executionDone++;
                }, scheduleData.interval_ms);
            } else {
                alert('Failed to insert schedule: ' + parsedResponse.error);
            }
        },
        error: function () {
            alert('Error occurred while inserting the schedule.');
        }
    });
    
}



//     function selectPlant(deviceId, plantId) {
//     if (!plantId) {
//         alert("Please select a valid plant.");
//         return;
//     }

//     // Fetch default soil moisture for the selected plant
//     fetch(`get-plant-data.php?plant_id=${plantId}`)
//         .then(response => response.json())
//         .then(data => {
//             if (data.error) {
//                 alert(data.error);
//             } else {
//                 // Update the soil moisture level display
//                 document.getElementById(`soil-moisture-${deviceId}`).innerText = data.soil_moisture;

//                 // Automatically set the schedule with the current date and time
//                 const currentDate = new Date().toISOString().slice(0, 19).replace("T", " ");
//                 fetch('set-schedule.php', {
//                     method: 'POST',
//                     headers: {
//                         'Content-Type': 'application/x-www-form-urlencoded'
//                     },
//                     body: `device_id=${deviceId}&plant_id=${plantId}&start_date=${currentDate}&soil_moisture=${data.soil_moisture}`
//                 })
//                 .then(response => response.json())
//                 .then(result => {
//                     if (result.success) {
//                         alert(result.success);
//                     } else {
//                         alert(result.error);
//                     }
//                 })
//                 .catch(error => console.error('Error:', error));
//             }
//         })
//         .catch(error => console.error('Error fetching plant data:', error));
// }
function showSensorData(deviceName) {
    fetch(`get-device-data.php?device_name=${encodeURIComponent(deviceName)}`)
    .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                const sensorData = data.data;
                const content = `
                    <h6><strong>Device:</strong> ${sensorData.device_name}</h6>
                    <p><strong>Temperature:</strong> ${sensorData.temperature} °C</p>
                    <p><strong>Humidity:</strong> ${sensorData.humidity}%</p>
                    <p><strong>Soil Moisture:</strong> ${sensorData.soil_moisture}%</p>
                    <p><strong>PIR State:</strong> ${sensorData.pir_state}</p>
                    <p><strong>Timestamp:</strong> ${sensorData.timestamp}</p>
                `;
                document.getElementById('modalContent').innerHTML = content;

                // Update the "View All Data" button
                const viewAllButton = document.getElementById('viewAllButton');
                viewAllButton.onclick = function () {
                    window.location.href = `viewAllSensorData.php?device_name=${encodeURIComponent(deviceName)}`;
                };

                document.getElementById('sensorModal').style.display = 'block';
            } else {
                alert(data.message || 'Unable to fetch sensor data.');
            }
        })
        .catch(error => console.error('Error fetching sensor data:', error));
}

function closeModal() {
    document.getElementById('sensorModal').style.display = 'none';
}




    function controlDeviceRelay(deviceId, action) {
    const relayState = action === 'on' ? 'RELAY_ON' : 'RELAY_OFF';
    const message = action === 'on' ? 'Relay has been turned ON' : 'Relay has been turned OFF';

    // Insert notification message into the database
    fetch('insert-notification.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `device_id=${deviceId}&message=${message}`
    })
    .then(response => response.text())
    .then(data => {
        console.log(`Notification inserted: ${data}`);
    })
    .catch(error => console.error('Error:', error));

    // Fetch control-relay.php with updated relay state
    fetch(`http://localhost/capstone(test)/control-relay.php`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `device_id=${deviceId}&relayState=${relayState}`
    })
    .then(response => response.json())
    .then(data => {
        console.log(`Relay state updated for device ${deviceId}:`, data);
        if (data.success) {
            alert(data.success);  
            window.location.reload(); 
        } else if (data.error) {
            alert(data.error);  
        } else if (data.message) {
            alert(data.message);  
        }
        
    })
    .catch(error => console.error('Error:', error));
}
    //new code
    function checkScheduledDevice() {
    fetch('get-device-id.php')
        .then(response => response.json())
        .then(data => {
            if (data.device_id) {
                controlDeviceRelay(data.device_id, 'on'); 
                window.location.reload(); 
            } else if (data.error) {
                console.log(data.error); 
            }
        })
        .catch(error => console.error('Error:', error));
}
setInterval(checkScheduledDevice, 1000); 

function checkAndDeleteSchedules() {
    fetch('delete-schedule.php')
        .then(response => response.json())
        .then(data => {
            if (data.length > 0) {
                data.forEach(message => {
                    console.log(message);
                    alert(message); 
                    window.location.reload();  
                });
            } else {
                console.log("No schedules to delete.");
            }
        })
        .catch(error => console.error('Error:', error));
}

setInterval(checkAndDeleteSchedules, 1500);

function updateMoistureLevel(deviceId, moistureLevel) {
    if (moistureLevel < 1 || moistureLevel > 100) {
        alert("Please enter a percentage between 1 and 100.");
        return;
    }

    fetch('update-moisture-level.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `device_id=${deviceId}&moisture_level=${moistureLevel}`
    })
    .then(response => response.text())
    .then(data => {
        alert(`Moisture level updated to ${moistureLevel}%: ${data}`);
        window.location.reload();
    })
    .catch(error => console.error('Error:', error));
}
$(document).ready(function () {
    $('#scheduleTypeForm').on('submit', function (event) {
        event.preventDefault();

        const deviceId = $('#device_id').val();
        const scheduleType = $('#schedule_type').val();
        const executionCount = $('#execution_count').val();
        const executionInterval = $('#execution_interval').val();

        if (!deviceId || !scheduleType || !executionCount || !executionInterval) {
            alert("All fields are required.");
            return;
        }

        // Convert interval to milliseconds
        const intervalMs = executionInterval * 60 * 60 * 1000;

        // Save schedule in the database
        $.ajax({
            url: 'set-schedule-type.php',
            type: 'POST',
            data: {
                device_id: deviceId,
                schedule_type: scheduleType,
                execution_count: executionCount,
                interval_ms: intervalMs
            },
            success: function (response) {
                alert(response);
            },
            error: function () {
                alert('Error occurred while setting the schedule.');
            }
        });

        // Trigger execution based on schedule
        let executionDone = 0;
        const scheduler = setInterval(() => {
            if (executionDone >= executionCount) {
                clearInterval(scheduler);
                alert(`Schedule for device ${deviceId} completed.`);
                return;
            }

            // Call relay control
            controlDeviceRelay(deviceId, 'on');

            executionDone++;
        }, intervalMs);
    });
});



    $(document).ready(function() {
        $('#addDeviceForm').on('submit', function(event) {
            event.preventDefault();
            const deviceName = $('#device_name').val();

            $.ajax({
                url: 'add-device.php',
                type: 'POST',
                data: { device_name: deviceName },
                success: function(response) {
                    alert(response);
                    location.reload();
                },
                error: function() {
                    alert('An error occurred while adding the device.');
                }
            });
        });

        $('#startDateForm').on('submit', function(event) {
            event.preventDefault();

            const deviceId = $('#device_id').val();
            const startDate = $('#start_date').val();

            if (!deviceId) {
                alert("Please select a device.");
                return;
            }

            $.ajax({
                url: 'set-schedule.php',
                type: 'POST',
                data: {
                    device_id: deviceId,
                    start_date: startDate
                },
                dataType: 'json',
                success: function(response) {
                    if (response.error) {
                        alert(response.error);
                    } else if (response.success) {
                        alert(response.success);
                        window.location.reload();
                    }
                },
                error: function() {
                    alert('An error occurred while processing your request.');
                }
            });
        });

        $('#clearScheduleButton').on('click', function(event) {
            event.preventDefault();

            const deviceId = $('#clear_device_id').val();
            if (!deviceId) {
                alert("Please select a device to clear the schedule.");
                return;
            }

            $.ajax({
                url: 'clear-schedule.php',
                type: 'POST',
                data: { device_id: deviceId },
                dataType: 'json',
                success: function(response) {
                    if (response.error) {
                        alert(response.error);
                    } else if (response.success) {
                        alert(response.success);
                        location.reload();
                    }
                },
                error: function(err) {
                    alert('An error occurred while processing your request.' + err);
                }
            });
        });
    });

    function removeDevice(deviceId) {
    if (confirm("Are you sure you want to remove this device?")) {
        $.ajax({
            url: 'remove-device.php',
            type: 'POST',
            data: { device_id: deviceId },
            success: function(response) {
                alert(response);
                location.reload();  // Reload the page to reflect the changes
            },
            error: function() {
                alert('An error occurred while removing the device.');
            }
        });
    }
}

setInterval(() => {
    fetch('fetch-active-schedules.php')
        .then(response => response.json())
        .then(schedules => {
            schedules.forEach(schedule => {
                const now = new Date().getTime();
                const nextExecution = schedule.last_execution_time
                    ? new Date(schedule.last_execution_time).getTime() + parseInt(schedule.interval_ms)
                    : now;

                if (now >= nextExecution) {
                    controlDeviceRelay(schedule.device_id, 'on');

                    // Update last execution time
                    $.ajax({
                        url: 'update-schedule-execution.php',
                        type: 'POST',
                        data: { schedule_id: schedule.id },
                        success: function (response) {
                            console.log(`Execution updated for schedule ${schedule.id}: ${response}`);
                        },
                        error: function () {
                            console.error('Error updating schedule execution.');
                        }
                    });
                }
            });
        })
        .catch(error => console.error('Error fetching schedules:', error));
}, 30000);
 // Check e
 function checkAndUpdateRelay() {
    fetch('check-and-update-relay.php')
        .then(response => response.json())
        .then(data => {
            data.forEach(message => console.log(message)); // Log response messages
        })
        .catch(error => console.error('Error:', error));
}

// Check every 10 seconds (adjust as needed)
setInterval(checkAndUpdateRelay, 10000);
function clearSelectedSchedule() {
    const deviceSelect = document.getElementById('device-select');
    const selectedDeviceId = deviceSelect.value;

    if (!selectedDeviceId) {
        alert('Please select a device.');
        return;
    }

    if (confirm('Are you sure you want to clear the schedule for this device?')) {
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'clear_schedule.php', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {
                alert(xhr.responseText);
                location.reload(); // Refresh the page to reflect changes
            } else {
                alert('Failed to clear schedule.');
            }
        };
        xhr.send('device_id=' + selectedDeviceId);
    }
}
function fetchNotifications() {
            fetch('get_notifications.php')
                .then(response => response.json())
                .then(data => {
                    const notificationList = document.getElementById('notification-list');
                    const notificationBadge = document.getElementById('notification-badge');
                    const notifications = data.notifications;

                    if (notifications.length > 0) {
                        // Update the modal body with notifications
                        notificationList.innerHTML = notifications.map(notification => 
                            `<ul class="list-group">
                                <li class="list-group-item">
                                    <strong>Device:</strong> ${notification.device_name}<br>
                                    <strong>Message:</strong> ${notification.message}
                                </li>
                            </ul>`
                        ).join('');
                        
                        // Show the badge with notification count
                        notificationBadge.innerText = notifications.length;
                        notificationBadge.style.display = 'inline-block';
                    } else {
                        notificationList.innerHTML = '<p>No notifications available.</p>';
                        notificationBadge.style.display = 'none';
                    }
                })
                .catch(error => {
                    console.error('Error fetching notifications:', error);
                    document.getElementById('notification-list').innerHTML = '<p>Error loading notifications.</p>';
                });
        }

        // Fetch notifications when the modal is opened
        document.getElementById('notificationsModal').addEventListener('show.bs.modal', fetchNotifications);
    </script>
</script>

<style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: white;
            color: #333;
            font-size: 14px;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 10px  #006A4E;
            border: 1px solid  #006A4E;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* Form Styling */
        form {
            display: grid;
            gap: 15px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        select:focus {
            border-color: #fda085;
            box-shadow: 0 0 5px rgba(253, 160, 133, 0.5);
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        button {
            padding: 10px ;
            background:rgb(73, 241, 87);
            border: none;
            border-radius: 6px;
            color: #fff;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background:rgb(47, 241, 112);
            transform: scale(1.05);
        }

        button:disabled {
            background: #ccc;
            cursor: not-allowed;
        }

        /* Card Styling */
        .card {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }

        .card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .card img {
            width: 100%;
            border-radius: 8px;
        }

        .card-content {
            margin-top: 15px;
        }

        .card-content h3 {
            margin: 0;
            color:rgb(51, 248, 94);
        }

        .card-content p {
            margin: 5px 0;
            font-size: 14px;
            color: #666;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .button-group {
                flex-direction: column;
            }

            .container {
                margin: 10px;
                padding: 15px;
            }
        }
        legend{
            font-size: 18px;
        }
    </style>