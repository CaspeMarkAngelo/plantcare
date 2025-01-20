<?php
include('config/db.php');
include('sidebar.php');

// Set the correct timezone
date_default_timezone_set('Asia/Manila');

// Check if plant_id is set and valid
$plant_id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$plant = null;

// Fetch plant details only if a valid ID is provided
if ($plant_id > 0) {
    $plantQuery = "SELECT * FROM plants WHERE id = ?";
    $plantStmt = $conn->prepare($plantQuery);
    $plantStmt->bind_param("i", $plant_id);
    $plantStmt->execute();
    $plant = $plantStmt->get_result()->fetch_assoc();
    $plantStmt->close();
}

// Fetch device configuration data
$deviceQuery = "SELECT id, device_name FROM device_config";
$deviceResult = $conn->query($deviceQuery);

// Handle form submission for updating device_id
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['device_id'])) {
    $device_id = (int)$_POST['device_id'];
    $updateQuery = "UPDATE plants SET device_id = ? WHERE id = ?";
    $stmt = $conn->prepare($updateQuery);
    $stmt->bind_param("ii", $device_id, $plant_id);
    if ($stmt->execute()) {
        echo "<script>alert('Device assigned successfully.');</script>";
        echo "<script>window.location.href = '?id=$plant_id';</script>";
        exit;
    } else {
        echo "<script>alert('Error updating device: " . $conn->error . "');</script>";
    }
    $stmt->close();
}
?>

<body>
<div class="content">
    <div class="schedule-form">
        <!-- Watering Schedule Form -->
        <form id="scheduleForm">
            <fieldset>
                <legend>Watering Schedule 
                    <?php echo $plant ? "for " . htmlspecialchars($plant['name']) : "(Manually Fill the Form)"; ?>:
                </legend>
                <div class="form-group">
                    <!-- Select Device -->
                    <div>
                    <label for="device_id">Select Device:</label>
        <select id="device_id" name="device_id" required>
            <option value="">-- Select a Device --</option>
            <?php
            if ($deviceResult && $deviceResult->num_rows > 0) {
                while ($device = $deviceResult->fetch_assoc()) {
                    $selected = ($plant && $plant['device'] == $device['id']) ? 'selected' : '';
                    echo "<option value='{$device['id']}' $selected>{$device['device_name']}</option>";
                }
            }
            ?>
        </select>
                    </div>

                    <!-- Schedule Type Dropdown -->
                    <div>
                        <label for="status">Schedule Type:</label>
                        <select name="status" id="status" required>
                            <option value="none" <?php echo ($plant && $plant['schedule_type'] == 'none') ? 'selected' : ''; ?>>None</option>
                            <option value="daily" <?php echo ($plant && $plant['schedule_type'] == 'daily') ? 'selected' : ''; ?>>Daily</option>
                            <option value="weekly" <?php echo ($plant && $plant['schedule_type'] == 'weekly') ? 'selected' : ''; ?>>Weekly</option>
                        </select>
                    </div>

                    <!-- Start and End Date -->
                    <div>
                        <label for="start_date">Start Date:</label>
                        <input 
                            type="date" 
                            id="start_date" 
                            name="start_date" 
                            value="<?php echo $default_start_date; ?>" 
                            required
                        >
                    </div>
                    <div>
                        <label for="end_date">End Date:</label>
                        <input 
                            type="date" 
                            id="end_date" 
                            name="end_date" 
                            value="<?php echo $default_end_date; ?>" 
                            required
                        >
                    </div>

                    <!-- Execution Count -->
                    <div>
                        <label for="execution_count">Execution Count:</label>
                        <input 
                            type="number" 
                            id="execution_count" 
                            name="execution_count" 
                            value="<?php echo $plant ? htmlspecialchars($plant['execution_count']) : $default_execution_count; ?>" 
                            required 
                            min="1" 
                        >
                    </div>

                    <!-- Day Checkboxes -->
                    <div>
                        <label>Every:</label><br>
                        <div style="display: flex; gap: 15px;">
                            <?php
                            $daysOfWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
                            $checkedDays = $plant ? explode(',', strtolower($plant['water_schedule'])) : [];
                            foreach ($daysOfWeek as $day) {
                                $isChecked = in_array(strtolower($day), $checkedDays) ? 'checked' : '';
                                echo '<span><input type="checkbox" name="days[]" value="' . $day . '" ' . $isChecked . '> ' . $day . '</span>';
                            }
                            ?>
                        </div>
                    </div>

                    <!-- Dynamic Time Inputs -->
                    <div id="timeInputs"></div>

                    <button type="submit">Submit</button>
                </div>
            </fieldset>
        </form>
    </div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  // Show or hide the days selection based on the schedule type
  document.getElementById('status').addEventListener('change', function() {
        var status = this.value;
        var daysSection = document.getElementById('days');
        if (status === 'weekly') {
            daysSection.style.display = 'block';
        } else {
            daysSection.style.display = 'none';
        }
    });




$(document).ready(function () {
    // Dynamically generate time inputs based on execution count
    const executionCountInput = $('#execution_count');
    const timeInputs = $('#timeInputs');

    // Initialize time inputs based on current execution count
    const initialCount = executionCountInput.val();
    generateTimeInputs(initialCount);

    // Generate time inputs dynamically based on execution count
    executionCountInput.on('input', function () {
        const count = $(this).val();
        generateTimeInputs(count);
    });

    function generateTimeInputs(count) {
        timeInputs.empty();

        // Ensure the execution count does not exceed 5
        if (count > 5) {
            executionCountInput.val(5); // Reset to 5 if user tries to input more than 5
            alert("The maximum allowed execution count is 5.");
            return;
        }

        // Display a warning if execution count is 4 or more
        if (count >= 4) {
            alert(`Warning: Your plants may be overwatered if you water it ${count} times.`);
        }

        // Generate the required time input fields
        for (let i = 0; i < count; i++) {
            timeInputs.append(`
                <div>
                    <label for="schedule_time_${i}">Set Time ${i + 1}:</label>
                    <input type="time" id="schedule_time_${i}" name="schedule_times[]" required />
                </div>
            `);
        }
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
    const status = $('#status').val();  // Capture selected status value
    const startDate = $('#start_date').val();  // Capture the selected start date
    const endDate = $('#end_date').val(); 
    // Validate the order of times
    for (let i = 0; i < scheduleTimes.length - 1; i++) {
        let currentTime = new Date('1970-01-01T' + scheduleTimes[i] + 'Z');
        let nextTime = new Date('1970-01-01T' + scheduleTimes[i + 1] + 'Z');
        
        // If the next time is earlier than the current time, show an error
        if (nextTime <= currentTime) {
            alert("Error: Execution time must be in chronological order.");
            return;
        }
    }

    // Handle form submission if times are valid
    if (!deviceId || selectedDays.length === 0 || !executionCount || scheduleTimes.length === 0 || !status || !startDate) {
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
            schedule_times: scheduleTimes,
            status: status,  // Send status to the server
            start_date: startDate,
            end_date: endDate // Send start_date to the server
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
            alert('Success.');
        }
    });
});

    // Auto-select all days when 'Daily' is selected
    $('#status').on('change', function () {
        if ($(this).val() === 'daily') {
            $('input[name="days[]"]').prop('checked', true); // Check all days
        } else if ($(this).val() === 'once') {
            $('input[name="days[]"]').prop('checked', false); // Uncheck all days
        } else {
            $('input[name="days[]"]').prop('checked', false); // Uncheck all days
        }
    });


 
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
    height: 100%;
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
            height: auto;
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
      
    }

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
</style>
