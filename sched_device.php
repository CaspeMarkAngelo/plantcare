<?php 
include('config/db.php');
include('sensors.php');
include('sidebar.php');

// Handle the "Clear All" request
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['clear_all'])) {
    $query = "DELETE FROM watering_time"; // Query to delete all records
    if ($conn->query($query)) {
        $response = "All schedules cleared successfully.";
    } else {
        $response = "Error clearing schedules: " . $conn->error;
    }
}

// Handle the "Delete Specific Schedule" request
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['schedule_id'])) {
    $scheduleId = $_POST['schedule_id'];
    $query = "DELETE FROM watering_time WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $scheduleId);
    if ($stmt->execute()) {
        echo "Schedule deleted successfully.";
    } else {
        echo "Error deleting schedule: " . $conn->error;
    }
}

// Fetching schedule data
$query = "SELECT wt.id, wt.device_id, wt.schedule_date, wt.schedule_time, wt.trigger_day, wt.status, dc.device_name , wt.level
    FROM watering_time AS wt
    JOIN device_config AS dc ON wt.device_id = dc.id
    ORDER BY wt.schedule_date";

$result = $conn->query($query);

$scheduledDevices = [];
if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $scheduledDevices[] = $row;
    }
}

// Group schedules by date
$groupedSchedules = [];
foreach ($scheduledDevices as $schedule) {
    $scheduleDate = new DateTime($schedule['schedule_date']);
    $scheduleDateFormatted = $scheduleDate->format('Y-m-d');
    $groupedSchedules[$scheduleDateFormatted][] = $schedule;
}

// Get current month and year (default to current month)
$selectedMonth = isset($_POST['month']) ? $_POST['month'] : date('m');
$selectedYear = date('Y');
?>

<div class="content">
    <!-- Display Calendar -->
    <div class="calendar-container">
        <h2>Schedules for <?php echo date('F Y', strtotime("$selectedYear-$selectedMonth-01")); ?></h2>
        
        <!-- Clear All Button -->
        <form method="POST">
            <button type="submit" name="clear_all" style="background-color: red; color: white; padding: 10px; border: none; cursor: pointer;">
                Clear All Schedules
            </button>
        </form>

        <!-- Month Selection Dropdown -->
        <form method="POST" style="margin-top: 20px;">
            <select name="month" onchange="this.form.submit()">
                <?php
                // Loop through all months and create options
                for ($month = 1; $month <= 12; $month++) {
                    $monthName = date('F', strtotime("2023-$month-01"));
                    $selected = $month == $selectedMonth ? 'selected' : '';
                    echo "<option value='$month' $selected>$monthName</option>";
                }
                ?>
            </select>
        </form>

        <?php
        // Loop through each day of the selected month
        $firstDayOfMonth = new DateTime("$selectedYear-$selectedMonth-01");
        $daysInMonth = (int) $firstDayOfMonth->format('t');
        $startDayOfWeek = (int) $firstDayOfMonth->format('w');

        echo "<div class='calendar-grid'>";

        // Display the days of the week header
        $daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
        foreach ($daysOfWeek as $day) {
            echo "<div class='calendar-day-header'>$day</div>";
        }

        // Display empty cells for days before the first day of the month
        for ($i = 0; $i < $startDayOfWeek; $i++) {
            echo "<div class='calendar-day'></div>";
        }

        // Display each day of the month
        for ($day = 1; $day <= $daysInMonth; $day++) {
            $date = "$selectedYear-" . str_pad($selectedMonth, 2, '0', STR_PAD_LEFT) . "-" . str_pad($day, 2, '0', STR_PAD_LEFT);
            echo "<div class='calendar-day'>";
            echo "<div class='calendar-day-number'>$day</div>";

            // Check if there are any schedules for this day
            if (isset($groupedSchedules[$date])) {
                foreach ($groupedSchedules[$date] as $schedule) {
                    $startDateTime = new DateTime($schedule['schedule_date'] . ' ' . $schedule['schedule_time']);
                    echo "<div class='schedule-item'>
                            <p><strong>{$schedule['device_name']}</strong></p>
                            <p>Time: {$startDateTime->format('g:i a')}</p>
                            <p>Status: {$schedule['level']}</p>
                            <p><span class='remove-schedule' onclick='removeSchedule({$schedule['id']})'>&#10006; Remove</span></p>
                          </div>";
                }
            }

            echo "</div>"; // Close calendar day
        }

        echo "</div>"; // Close calendar grid
        ?>
    </div>
</div>

<!-- Add Styles for the Calendar -->
<style>
.calendar-container {
    padding: 20px;
    font-family: Arial, sans-serif;
}

.calendar-grid {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 10px;
    margin-top: 20px;
}

.calendar-day-header {
    text-align: center;
    font-weight: bold;
    background-color: #f2f2f2;
    padding: 10px;
}

.calendar-day {
    padding: 10px;
    min-height: 100px;
    border: 1px solid black;
    border-radius: 5px;
    background-color: #fff;
}

.calendar-day-number {
    text-align: center;
    font-weight: bold;
    margin-bottom: 10px;
}

.schedule-item {
    background-color: #f1f1f1;
    padding: 5px;
    margin-bottom: 5px;
    border-radius: 5px;
}

.remove-schedule {
    cursor: pointer;
    color: red;
    font-weight: bold;
}

.remove-schedule:hover {
    text-decoration: underline;
}
</style>

<script>
function removeSchedule(scheduleId) {
    if (confirm("Are you sure you want to delete this schedule?")) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "", true); // Same page (empty URL)
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        // Send schedule ID to delete
        xhr.send("schedule_id=" + scheduleId);

        // Wait for the response from the server
        xhr.onload = function() {
            if (xhr.status === 200) {
                alert("Schedule deleted successfully.");
                location.reload();  // Reload the page to update the schedule list
            } else {
                alert("Error deleting schedule.");
            }
        };
    }
}

setInterval(function () {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "update_schedule.php", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onload = function () {
        if (xhr.status === 200) {
            console.log(xhr.responseText); // Debug server response
            try {
                var response = JSON.parse(xhr.responseText);
                if (response.success) {
                    alert(response.message); // Success message
                    location.reload(); // Reload page to update schedules
                } else {
                    console.log(response.message); // Log when no update occurs
                }
            } catch (e) {
                console.error("Invalid JSON response:", xhr.responseText);
            }
        } else {
            console.error("Failed to update schedules. Status:", xhr.status);
        }
    };

    xhr.onerror = function () {
        console.error("Error occurred during schedule update request.");
    };

    xhr.send(); // Trigger the update script
}, 150); // Run every 15 seconds

</script>
