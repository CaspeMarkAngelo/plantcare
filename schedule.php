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
            <form id="scheduleForm">
                <fieldset>
                    <legend>Watering Schedule:</legend>
                    <div class="form-group">
                        <!-- Select Device -->
                        <div>
                            <label for="device_id">Select Device:</label>
                            <select id="device_id" name="device_id" required>
                                <option value="">Select a device</option>
                                <?php foreach ($devices as $device): ?>
                                    <option value="<?php echo $device['id']; ?>">
                                        <?php echo htmlspecialchars($device['device_name']); ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>

                        <!-- Day Checkboxes -->
                        <div>
                            <label>Select Days:</label><br>
                            <input type="checkbox" id="sunday" name="days[]" value="Sunday"> Sunday
                            <input type="checkbox" id="monday" name="days[]" value="Monday"> Monday
                            <input type="checkbox" id="tuesday" name="days[]" value="Tuesday"> Tuesday
                            <input type="checkbox" id="wednesday" name="days[]" value="Wednesday"> Wednesday
                            <input type="checkbox" id="thursday" name="days[]" value="Thursday"> Thursday
                            <input type="checkbox" id="friday" name="days[]" value="Friday"> Friday
                            <input type="checkbox" id="saturday" name="days[]" value="Saturday"> Saturday
                        </div>

                        <!-- Execution Count -->
                        <div>
                            <label for="execution_count">Execution Count:</label>
                            <input type="number" id="execution_count" name="execution_count" required min="1" />
                        </div>

                        <!-- Dynamic Time Inputs -->
                        <div id="timeInputs"></div>

                        <button type="submit">Submit</button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <script>
    $(document).ready(function () {
            // Dynamically generate time inputs based on execution count
            $('#execution_count').on('input', function () {
                let count = $(this).val();
                let timeInputs = $('#timeInputs');
                timeInputs.empty();

                for (let i = 0; i < count; i++) {
                    timeInputs.append(`
                        <div>
                            <label for="schedule_time_${i}">Set Time ${i + 1}:</label>
                            <input type="time" id="schedule_time_${i}" name="schedule_times[]" required />
                        </div>
                    `);
                }
            });

            // Handle form submission
            $('#scheduleForm').on('submit', function (event) {
                event.preventDefault();

                const deviceId = $('#device_id').val();
                const selectedDays = $('input[name="days[]"]:checked').map(function () {
                    return $(this).val();
                }).get();
                const executionCount = $('#execution_count').val();
                const scheduleTimes = $('input[name="schedule_times[]"]').map(function () {
                    return $(this).val();
                }).get();

                if (!deviceId || selectedDays.length === 0 || !executionCount || scheduleTimes.length === 0) {
                    alert("All fields are required.");
                    return;
                }

                $.ajax({
                    url: 'set-schedule.php',
                    type: 'POST',
                    data: {
                        device_id: deviceId,
                        days: selectedDays,
                        execution_count: executionCount,
                        schedule_times: scheduleTimes
                    },
                    dataType: 'json',
                    success: function (response) {
                        if (response.error) {
                            alert(response.error);
                        } else if (response.success) {
                            alert(response.success);
                            window.location.reload();
                        }
                    },
                    error: function () {
                        alert('An error occurred while processing your request.');
                    }
                });
            });
        });
    </script>
    <script>
// $(document).ready(function () {
//     // Dynamically generate time inputs based on execution count
//     $('#execution_count').on('input', function () {
//         let count = $(this).val();
//         let timeInputs = $('#timeInputs');
//         timeInputs.empty();

//         for (let i = 0; i < count; i++) {
//             timeInputs.append(`
//                 <div>
//                     <label for="schedule_time_${i}">Set Time ${i + 1}:</label>
//                     <input type="time" id="schedule_time_${i}" name="schedule_time[]" required />
//                 </div>
//             `);
//         }
//     });

//     // Handle form submission
//     $('#scheduleForm').on('submit', function (event) {
//         event.preventDefault();

//         const deviceId = $('#device_id').val();
//         const triggerDay = $('#trigger_day').val();  // Selected single day from dropdown
//         const additionalDays = $("input[name='additional_days[]']:checked").map(function() {
//             return $(this).val();
//         }).get();  // Selected days from checkboxes
//         const executionCount = $('#execution_count').val();
//         const scheduleTimes = $('input[name="schedule_time[]"]').map(function () {
//             return $(this).val();
//         }).get();

//         if (!deviceId || (!triggerDay && additionalDays.length === 0) || !executionCount || scheduleTimes.length === 0) {
//             alert("All fields are required.");
//             return;
//         }

//         $.ajax({
//             url: 'set-schedule.php',
//             type: 'POST',
//             data: {
//                 device_id: deviceId,
//                 trigger_day: triggerDay,  // The main selected day
//                 additional_days: additionalDays,  // Array of additional selected days
//                 execution_count: executionCount,
//                 schedule_times: scheduleTimes
//             },
//             dataType: 'json',
//             success: function (response) {
//                 if (response.error) {
//                     alert(response.error);
//                 } else if (response.success) {
//                     alert(response.success);
//                     window.location.reload();
//                 }
//             },
//             error: function () {
//                 alert('An error occurred while processing your request.');
//             }
//         });
//     });
// });

    //     $(document).ready(function () {
    //         $('#startDateForm').on('submit', function (event) {
    //             event.preventDefault();

    //             const deviceId = $('#device_id').val();
    //             const startDate = $('#start_date').val();
    //             const triggerDay = $('#trigger_day').val(); // Get selected day

    //             if (!deviceId) {
    //                 alert("Please select a device.");
    //                 return;
    //             }

    //             $.ajax({
    //                 url: 'set-schedule.php',
    //                 type: 'POST',
    //                 data: {
    //                     device_id: deviceId,
    //                     start_date: startDate,
    //                     trigger_day: triggerDay // Send selected day to the backend
    //                 },
    //                 dataType: 'json',
    //                 success: function (response) {
    //                     if (response.error) {
    //                         alert(response.error);
    //                     } else if (response.success) {
    //                         alert(response.success);
    //                         window.location.reload();
    //                     }
    //                 },
    //                 error: function () {
    //                     alert('An error occurred while processing your request.');
    //                 }
    //             });
    //         });
    //     });

        // $(document).ready(function () {
        //     $('#scheduleForm').on('submit', function (event) {
        //         event.preventDefault();

        //         const deviceId = $('#device_id').val();
        //         const triggerDay = $('#trigger_day').val();
        //         const scheduleTime = $('#schedule_time').val();

        //         if (!deviceId || !triggerDay || !scheduleTime) {
        //             alert("All fields are required.");
        //             return;
        //         }

        //         $.ajax({
        //             url: 'set-schedule.php',
        //             type: 'POST',
        //             data: {
        //                 device_id: deviceId,
        //                 trigger_day: triggerDay,
        //                 schedule_time: scheduleTime
        //             },
        //             dataType: 'json',
        //             success: function (response) {
        //                 if (response.error) {
        //                     alert(response.error);
        //                 } else if (response.success) {
        //                     alert(response.success);
        //                     window.location.reload();
        //                 }
        //             },
        //             error: function () {
        //                 alert('An error occurred while processing your request.');
        //             }
        //         });
        //     });
        // });
     </script>
</body>

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
            background:rgb(0, 77, 6);
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
