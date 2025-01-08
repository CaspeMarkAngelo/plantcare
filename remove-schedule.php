<?php
include('config/db.php');

// Check if the schedule_id is provided
if (isset($_POST['schedule_id'])) {
    $schedule_id = $_POST['schedule_id'];

    // Prepare and execute the DELETE query
    $query = "DELETE FROM watering_time WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $schedule_id); // "i" for integer type
    if ($stmt->execute()) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'error' => 'Failed to delete schedule']);
    }
    $stmt->close();
} else {
    echo json_encode(['success' => false, 'error' => 'Schedule ID not provided']);
}

$conn->close();
?>
