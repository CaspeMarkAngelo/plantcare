<?php
include('config/db.php'); // Database connection

// Query to fetch all notifications
$query = "SELECT `id`, `device_id`, `device_name`, `message`, `created_at` FROM `notifications` ORDER BY `id` DESC";
$result = $conn->query($query);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notifications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php include('sidebar.php')?>
    <div class="content mt-4">
        <h2>Notifications</h2>
        
        <?php
        // Check if there are any notifications
        if ($result->num_rows > 0) {
            echo '<table class="table table-striped">';
            echo '<thead>
                    <tr>
                        <th>Device Name</th>
                        <th>Message</th>
                        <th>Created At</th>
                    </tr>
                  </thead>';
            echo '<tbody>';
            
            // Display each notification
            while ($row = $result->fetch_assoc()) {
                echo '<tr>';
                echo '<td>' . $row['device_name'] . '</td>';
                echo '<td>' . $row['message'] . '</td>';
                echo '<td>' . $row['created_at'] . '</td>';
                echo '</tr>';
            }
            
            echo '</tbody>';
            echo '</table>';
        } else {
            echo '<p>No notifications found.</p>';
        }

        $conn->close();
        ?>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
