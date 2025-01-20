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
    ORDER BY wt.schedule_time DESC LIMIT 5"; // Modify as needed
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

// Fetch notifications and unread count
$notification_query = "SELECT 
    message,
    created_at,
    device_name,
    MAX(created_at) AS latest_created_at 
FROM 
    notifications 
WHERE 
    is_read = '0' 
GROUP BY 
    message 
ORDER BY 
    latest_created_at DESC;";
$notifications_result = $conn->query($notification_query);

$unread_count_query = "SELECT COUNT(*) AS unread_count FROM notifications WHERE is_read = 0";
$unread_count_result = $conn->query($unread_count_query);
$unread_count = $unread_count_result->fetch_assoc()['unread_count'];

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
    
     <!-- Notification Icon and Count -->
     <div id="notification-icon" style="position: relative; cursor: pointer;">
                <span class="icon">
                    <img src="assets/notification.png" alt="Notifications" width="50">
                </span>
                <span id="notification-count" style="position: absolute; top: -5px; right: -5px; background-color: red; color: white; border-radius: 50%; padding: 2px 6px; font-size: 12px; <?php echo ($unread_count > 0) ? 'display: block;' : 'display: none;'; ?>">
                    <?php echo $unread_count; ?>
                </span>
            </div>
        </div>
    </div>
        

     <!-- Modal for Notifications -->
     <div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="notificationModalLabel">Notifications</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="notifications-list">
                    <!-- Notifications will be populated here -->
                    <?php
                    if ($notifications_result->num_rows > 0) {
                        while ($row = $notifications_result->fetch_assoc()) {
                            echo '<p>' . $row['message'] . ' - ' . $row['device_name'] . ' (' . $row['created_at'] . ')</p>';
                        }
                    } else {
                        echo "No notifications available.";
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>

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
        <div class="device-card" style ="border: 1px solid black;  box-shadow: 0 4px 10px  #006A4E; font-size: medium; ">
 
        <h5 onclick="showSensorData('<?php echo htmlspecialchars($device['device_name']); ?>')" style="cursor: pointer;">
                <?php echo htmlspecialchars($device['device_name']); ?>
        </h5>

        <div id="device-status-<?php echo htmlspecialchars($device['device_name']); ?>" style="font-weight: bold; color: red;">
            Status: Disconnected
        </div>


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
                >%
            </p>
            <p>Relay State: <span><?php echo $device['relay_state']; ?></span></p>
            <br>
            <div class="control-buttons">
                <button style="background-color: #831005;" onclick="removeDevice(<?php echo $device['id']; ?>)">Remove Device</button>
                <button style="background-color: #006A4E;" onclick="controlDeviceRelay(<?php echo $device['id']; ?>, 'on')">Turn Relay ON</button>
                <button style="background-color:rgb(0, 108, 128);" onclick="controlDeviceRelay(<?php echo $device['id']; ?>, 'off')">Turn Relay OFF</button>
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
       



</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

<script src="js/trigger.js"></script>
<script>
async function fetchDeviceStatus() {
    try {
    const response = await fetch('fetch_device_status.php');
    const devices = await response.json();

    devices.forEach(device => {
        // Use the device name to target the correct status element
        const statusDiv = document.getElementById(`device-status-${device.device_name}`);
        const controlButtons = document.querySelectorAll(`#device-status-${device.device_name} ~ .control-buttons button`);

        if (statusDiv) {
            statusDiv.textContent = `Status: ${device.status}`;
            statusDiv.style.color = device.status === 'Connected' ? 'green' : 'red';

            // Disable buttons if device is disconnected
            if (device.status === 'Disconnected') {
                controlButtons.forEach(button => {
                    button.disabled = true;
                    button.style.color ='grey';
                });
                
                statusDiv.textContent = 'Status: Offline';
            } else {
                controlButtons.forEach(button => {
                    button.disabled = false;
                });
                
                statusDiv.textContent = 'Status: Online'
            }
            
        }
    });
} catch (error) {
    console.error('Error fetching device status:', error);
}
}

// Poll every 5 seconds
setInterval(fetchDeviceStatus, 5000);
document.addEventListener('DOMContentLoaded', fetchDeviceStatus);
</script>
<script>
    // Periodically check the schedules (every minute or as needed)
    function checkAndInsertSchedules() {
        $.ajax({
        url: 'check-schedule.php',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                console.log('Schedules checked and inserted successfully.');
                // Optionally, you can reload the page or update the display
                window.location.reload();
            } else if (response.error) {
                console.log('Error occurred: ' + response.error);
            } else {
                console.log('No new schedules to insert.');
            }
        },
        error: function() {
            console.log('Error occurred while checking schedules.');
        }
    });
}
    // Set the function to run every minute (60000 ms)
    setInterval(checkAndInsertSchedules, 60000); // Adjust the interval as needed
</script>
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
function removeSchedule(scheduleId) {
    if (confirm('Are you sure you want to delete this schedule?')) {
        $.ajax({
            url: 'remove-schedule.php', // The PHP file that will handle the deletion
            type: 'POST',
            data: {
                schedule_id: scheduleId
            },
            dataType: 'json',
            success: function(response) {
                if (response.success) {
                    alert('Schedule deleted successfully.');
                    window.location.reload(); // Reload the page to reflect the deletion
                } else {
                    alert('Failed to delete the schedule.');
                }
            },
            error: function() {
                alert('An error occurred while trying to delete the schedule.');
            }
        });
    }
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
    fetch(`http://localhost/plantcare/control-relay.php`, {
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
setInterval(checkScheduledDevice, 100); 

// function checkAndDeleteSchedules() {
//     fetch('delete-schedule.php')
//         .then(response => response.json())
//         .then(data => {
//             if (data.length > 0) {
//                 data.forEach(message => {
//                     console.log(message);
//                     alert(message); 
//                     window.location.reload();  
//                 });
//             } else {
//                 console.log("No schedules to delete.");
//             }
//         })
//         .catch(error => console.error('Error:', error));
// }

// setInterval(checkAndDeleteSchedules, 1500);

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

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Open the modal when the notification icon is clicked
        document.getElementById("notification-icon").addEventListener("click", function () {
            var myModal = new bootstrap.Modal(document.getElementById('notificationModal'));
            myModal.show();
            
            // Mark notifications as read
            markNotificationsRead();
        });

        // Close the modal when the close button is clicked
        document.querySelector('.btn-close').addEventListener('click', function () {
            var myModal = new bootstrap.Modal(document.getElementById('notificationModal'));
            myModal.hide();
        });
    });

    function fetchUnreadCount() {
        fetch("fetch-unread-count.php")
            .then(response => response.json())
            .then(data => {
                const countSpan = document.getElementById("notification-count");
                if (data.unread_count > 0) {
                    countSpan.textContent = data.unread_count;
                    countSpan.style.display = "block";  // Make the count visible
                } else {
                    countSpan.style.display = "none";  // Hide the count if no unread notifications
                }
            })
            .catch(err => console.error(err));
    }

    function markNotificationsRead() {
        fetch("mark-notifications-read.php", { method: "POST" })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    document.getElementById("notification-count").style.display = "none"; // Hide the indicator
                }
            })
            .catch(err => console.error(err));
    }
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
        .device-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3 columns */
    gap: 20px; /* Space between the cards */
    margin-top: 20px; /* Optional: Space above the grid */
}

.device-card {
    border: 1px solid #ccc;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    box-sizing: border-box; /* Ensures padding does not affect size */
}

.device-card h5 {
    margin: 0 0 10px;
    color: #333;
    cursor: pointer;
}

.device-card p {
    margin: 5px 0;
}

.device-card .control-buttons {
    display: flex;
    gap: 10px;
    margin-top: 10px;
}

.device-card button {
    background-color: #006A4E;
    color: white;
    border: none;
    padding: 8px 15px;
    border-radius: 5px;
    cursor: pointer;
}

.device-card button:hover {
    background-color: #004D33;
}

.device-card .connected {
    color: green;
}

.device-card .disconnected {
    color: red;
}

/* Responsive Design: Stack cards in 2 per row on medium screens */
@media (max-width: 768px) {
    .device-grid {
        grid-template-columns: repeat(2, 1fr); /* 2 columns */
    }
}

/* Responsive Design: Stack cards in 1 per row on small screens */
@media (max-width: 480px) {
    .device-grid {
        grid-template-columns: 1fr; /* 1 column */
    }
}

    </style>