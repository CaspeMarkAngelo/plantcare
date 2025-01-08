<?php
include('config/db.php');

$schedule_id = $_POST['schedule_id'];

$query = "UPDATE schedules SET last_execution_time = NOW() WHERE id = '$schedule_id'";

if ($conn->query($query)) {
    echo 'Last execution time updated successfully.';
} else {
    echo 'Error updating last execution time.';
}
?>
