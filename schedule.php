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
?>
<body>
    <div class="content">
        <div class="form-selector">
            <button type="button" id="showWateringSchedule">Watering Schedule</button>
            <button type="button" id="showAdvancedScheduling">Advanced Scheduling</button>
        </div>

        <div class="schedule-form">
            <!-- Watering Schedule Form -->
            <form id="startDateForm" style="display: none;">
                <fieldset>
                    <legend>Watering Schedule:</legend>
                    <div class="form-group">
                        <div class="device-select-container">
                            <p>Select Device:</p>
                            <select id="device_id" name="device_id" required>
                                <option value="">Select a device</option>
                                <?php foreach ($devices as $device): ?>
                                    <option value="<?php echo $device['id']; ?>"><?php echo htmlspecialchars($device['device_name']); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="date-time-container">
                            <p>Set start date and time:</p>
                            <input type="datetime-local" required id="start_date" name="start_date">
                        </div>
                        <button type="submit">Submit</button>
                    </div>
                </fieldset>
            </form>
            
            <!-- Advanced Scheduling Form -->
            <form id="scheduleTypeForm" style="display: none;">
                <fieldset>
                    <legend>Advanced Scheduling:</legend>
                    <div class="form-group">
                        <div class="device-select-container">
                            <p>Select Device:</p>
                            <select id="deviceid" name="deviceid" required>
                                <option value="">Select a device</option>
                                <?php foreach ($devices as $device): ?>
                                    <option value="<?php echo $device['id']; ?>"><?php echo htmlspecialchars($device['device_name']); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="schedule-type-container">
                            <p>Select Schedule Type:</p>
                            <select id="schedule_type" name="schedule_type" required>
                                <option value="daily">Daily</option>
                                <option value="weekly">Weekly</option>
                                <option value="monthly">Monthly</option>
                            </select>
                        </div>
                        <div class="execution-container">
                            <p>Number of Executions:</p>
                            <input type="number" id="execution_count" name="execution_count" min="1" required>
                        </div>
                        <div class="interval-container">
                            <p>Execution Interval (in hours):</p>
                            <input type="number" id="execution_interval" name="execution_interval" min="1" required>
                        </div>
                        <button type="submit">Set Schedule</button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>

    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const showWateringSchedule = document.getElementById('showWateringSchedule');
        const showAdvancedScheduling = document.getElementById('showAdvancedScheduling');
        const startDateForm = document.getElementById('startDateForm');
        const scheduleTypeForm = document.getElementById('scheduleTypeForm');

        showWateringSchedule.addEventListener('click', function () {
            startDateForm.style.display = 'block';
            scheduleTypeForm.style.display = 'none';
        });

        showAdvancedScheduling.addEventListener('click', function () {
            scheduleTypeForm.style.display = 'block';
            startDateForm.style.display = 'none';
        });
    });
    </script>
</body>
</div>
<script>
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
    fetch(`http://localhost/capstone-redef/control-relay.php`, {
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

setInterval(checkAndDeleteSchedules, 6000);

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
    })
    .catch(error => console.error('Error:', error));
}
$(document).ready(function () {
    $('#scheduleTypeForm').on('submit', function (event) {
        event.preventDefault();

        const deviceId = $('#deviceid').val();
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
                deviceid: deviceId,
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
}, 60000);
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
</script>
<style>
    .device-grid {
    display: flex;
    flex-direction: row; 
    gap: 20px; 
    margin: 20px 0;
}

.device-card {
    border: 1px solid #ccc; 
    border-radius: 8px;
    padding: 16px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    background: #fff;
    width: 100%; 
    box-sizing: border-box;
}
/* Layout for the schedules container */
.schedules-container {
    display: flex;
    justify-content: space-between;
    gap: 30px;
    margin-top: 30px;
}

/* Left section for the scheduled devices */
.schedule-list {
    flex: 1;
    padding: 10px;
    background-color: #f9f9f9;
    border-radius: 8px;
}

/* Right section for the form */
.schedule-form {
    flex: 1;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
}

/* Styling for schedule device cards */
.scheduled-devices {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.scheduled-device-card {
    background-color: #ffffff;
    border: 1px solid #ddd;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
}

/* Form styling */
form fieldset {
    border: none;
    padding: 20px;
}

form legend {
    font-size: 1.2em;
    font-weight: bold;
    margin-bottom: 15px;
}

.form-group {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.device-select-container, .date-time-container {
    display: flex;
    flex-direction: column;
}

button {
    background-color: #006A4E;
    color: white;
    padding: 10px;
    border: none;
    cursor: pointer;
    font-size: 1rem;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #004f3e;
}

/* Styling for the device cards */
.device-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    margin: 20px 0;
}

.device-card {
    flex: 1 1 30%;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 16px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    background: #fff;
    box-sizing: border-box;
}

/* Responsive design for smaller screens */
@media (max-width: 768px) {
    .schedules-container {
        flex-direction: column;
    }

    .device-card {
        flex: 1 1 45%;
    }
}
        .form-selector {
            margin-bottom: 20px;
        }
        .schedule-form form {
            margin-bottom: 20px;
        }
        .device-select-container, .date-time-container, .schedule-type-container, .execution-container, .interval-container {
            margin-bottom: 15px;
        }
        button {
            margin-top: 10px;
        }
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: white;
            color: #333;
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
            padding: 10px 20px;
            background:rgb(73, 241, 87);
            border: none;
            border-radius: 6px;
            color: #fff;
            font-weight: bold;
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
    form{
        max-width: 1000px;
            padding: 20px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 10px  #006A4E;
            border: 1px solid  #006A4E;
        height: 520px;
    }
</style>
