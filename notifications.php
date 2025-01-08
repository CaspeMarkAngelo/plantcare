<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notifications Modal</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <!-- Trigger Button with Bell Icon -->
    <button type="button" class="btn btn-primary position-relative" data-bs-toggle="modal" data-bs-target="#notificationsModal">
        <i class="fas fa-bell"></i>
        <span id="notification-badge" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="display: none;">
            0
        </span>
    </button>

    <!-- Modal -->
    <div class="modal fade" id="notificationsModal" tabindex="-1" aria-labelledby="notificationsModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="notificationsModalLabel">Notifications</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="notification-list">
                    <p>Loading notifications...</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Function to fetch notifications
        function fetchNotifications() {
            fetch('get_notifications.php')
                .then(response => response.json())
                .then(data => {
                    const notificationList = document.getElementById('notification-list');
                    const notificationBadge = document.getElementById('notification-badge');
                    const notifications = data.notifications;

                    if (notifications.length > 0) {
                        // Update the modal body with notifications
                        notificationList.innerHTML = notifications.map(notification => 
                            `<ul class="list-group">
                                <li class="list-group-item">
                                    <strong>Device:</strong> ${notification.device_name}<br>
                                    <strong>Message:</strong> ${notification.message}
                                </li>
                            </ul>`
                        ).join('');
                        
                        // Show the badge with notification count
                        notificationBadge.innerText = notifications.length;
                        notificationBadge.style.display = 'inline-block';
                    } else {
                        notificationList.innerHTML = '<p>No notifications available.</p>';
                        notificationBadge.style.display = 'none';
                    }
                })
                .catch(error => {
                    console.error('Error fetching notifications:', error);
                    document.getElementById('notification-list').innerHTML = '<p>Error loading notifications.</p>';
                });
        }

        // Fetch notifications when the modal is opened
        document.getElementById('notificationsModal').addEventListener('show.bs.modal', fetchNotifications);
    </script>
</body>
</html>
