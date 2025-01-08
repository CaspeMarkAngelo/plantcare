<?php
include('config/db.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $device_id = intval($_POST['device_id']); // Sanitize input

    if ($device_id > 0) {
        // Start a transaction to ensure atomicity
        $conn->begin_transaction();

        try {
            // Delete related entries in the watering_time table
            $query1 = "DELETE FROM watering_time WHERE device_id = ?";
            $stmt1 = $conn->prepare($query1);
            $stmt1->bind_param("i", $device_id);
            $stmt1->execute();

            // Delete related entries in the schedules table
            $query2 = "DELETE FROM schedules WHERE device_id = ?";
            $stmt2 = $conn->prepare($query2);
            $stmt2->bind_param("i", $device_id);
            $stmt2->execute();

            // Commit the transaction
            $conn->commit();

            // Close statements
            $stmt1->close();
            $stmt2->close();

            echo 'success';
        } catch (Exception $e) {
            // Rollback the transaction in case of failure
            $conn->rollback();
            echo 'failure';
        }
    } else {
        echo 'invalid_device';
    }
}
?>
