<?php
include('config/db.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $device_id = $_POST['device_id'];

    // Ensure that you validate and sanitize the input
    $device_id = intval($device_id); // Sanitize device_id as an integer

    // Start a transaction to ensure both deletions happen together
    $conn->begin_transaction();
    
    try {
        // Delete from the schedules table
        $query1 = "DELETE FROM schedules WHERE device_id = ?";
        $stmt1 = $conn->prepare($query1);
        $stmt1->bind_param("i", $device_id);
        $stmt1->execute();

        // Delete from the watering_time table
        $query2 = "DELETE FROM watering_time WHERE device_id = ?";
        $stmt2 = $conn->prepare($query2);
        $stmt2->bind_param("i", $device_id);
        $stmt2->execute();

        // Commit the transaction
        $conn->commit();

        // Close prepared statements
        $stmt1->close();
        $stmt2->close();

        echo 'success';
    } catch (Exception $e) {
        // If any error occurs, roll back the transaction
        $conn->rollback();
        echo 'failure';
    }
}
?>

?>
