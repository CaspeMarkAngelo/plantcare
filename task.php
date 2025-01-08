<?php
// Database connection
$host = 'localhost';
$dbname = 'plantcare';
$username = 'root'; // Replace with your DB username
$password = ''; // Replace with your DB password

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $taskName = $_POST['task'];
    $period = $_POST['period'];
    $repeats = $_POST['repeats'];

    // Get the current date and time for the first task execution
    $nextRun = date('Y-m-d H:i:s', time()); // Set to current time

    // Insert task into the database
    $stmt = $pdo->prepare("INSERT INTO tasks (task_name, period, repeats, next_run, status) VALUES (:task_name, :period, :repeats, :next_run, 'inactive')");
    $stmt->bindParam(':task_name', $taskName);
    $stmt->bindParam(':period', $period);
    $stmt->bindParam(':repeats', $repeats);
    $stmt->bindParam(':next_run', $nextRun);
    $stmt->execute();

    echo "Task scheduled successfully!";
}
?>
