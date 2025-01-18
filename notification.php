<?php
include('config/db.php'); // Include database connection

// Query to fetch all notifications
$query = "SELECT `id`, `device_id`, `device_name`, `message`, `created_at`, `is_read` FROM `notifications` ORDER BY `id` DESC";
$result = $conn->query($query);

// Fetch unread count
$unread_count_query = "SELECT COUNT(*) AS unread_count FROM notifications WHERE is_read = 0";
$unread_count_result = $conn->query($unread_count_query);
$unread_count = $unread_count_result->fetch_assoc()['unread_count'];

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notifications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        #notification-icon {
            position: relative;
            cursor: pointer;
        }
        #notification-count {
            position: relative;
            top: -5px;
            right: -5px;
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            font-size: 12px;
            display: <?php echo ($unread_count > 0) ? 'block;' : 'none;'; ?> /* Display count only if there are unread notifications */
        }
        .modal-dialog {
            max-width: 80%; /* Adjust modal width */
        }
    </style>
</head>
<body>
    <?php include('sidebar.php'); ?>
    <div class="content mt-4">
        <h2>Notifications</h2>

        <!-- Notification Icon and Count -->
        <div id="notification-icon" style="position: relative; cursor: pointer;">
                <span class="icon">
                    <img src="assets/notification.png" alt="Notifications" width="50">
                </span>
                <span id="notification-count" style="position: absolute; top: -5px; right: -5px; background-color: red; color: white; border-radius: 50%; padding: 2px 6px; font-size: 12px; <?php echo ($unread_count > 0) ? 'display: block;' : 'display: none;'; ?>">
                    <?php echo $unread_count; ?>
                </span>
            </div>
        </div>
    </div>
        

        <!-- Modal for Notifications -->
        <div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="notificationModalLabel">Notifications</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="notifications-list">
                        <!-- Notifications will be populated here -->
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
                        ?>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Open the modal when the notification icon is clicked
            document.getElementById("notification-icon").addEventListener("click", function () {
                // Show the modal
                $('#notificationModal').modal('show');

                // Mark notifications as read
                markNotificationsRead();
            });
        });

        // Function to mark notifications as read
        function markNotificationsRead() {
            fetch("mark-notifications-read.php", { method: "POST" })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        document.getElementById("notification-count").style.display = "none"; // Hide notification count
                    }
                })
                .catch(err => console.error(err));
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
