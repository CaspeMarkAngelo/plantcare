<?php
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit;
}
include('config/db.php');

// Fetch categories from the database
$category_sql = "SELECT DISTINCT category FROM plants";
$categories = $conn->query($category_sql);

// Initialize filter
$filter_category = isset($_POST['category']) ? $_POST['category'] : '';

// Modify SQL query to filter by category
$sql = "SELECT id, name, image_url FROM plants" . ($filter_category ? " WHERE category = '$filter_category'" : "");
$result = $conn->query($sql);

// Fetch notifications and unread count
$notification_query = "SELECT `id`, `device_id`, `device_name`, `message`, `created_at`, `is_read` FROM `notifications` ORDER BY `id` DESC";
$notifications_result = $conn->query($notification_query);

$unread_count_query = "SELECT COUNT(*) AS unread_count FROM notifications WHERE is_read = 0";
$unread_count_result = $conn->query($unread_count_query);
$unread_count = $unread_count_result->fetch_assoc()['unread_count'];

$conn->close();
?>

<?php include('sidebar.php'); ?>
<div class="content">
    <div style="display: flex; align-items: center; justify-content: space-between;">
        <h2>Plant Library</h2>
        <div>
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
                    if ($notifications_result->num_rows > 0) {
                        while ($row = $notifications_result->fetch_assoc()) {
                            echo '<p>' . $row['message'] . ' - ' . $row['device_name'] . ' (' . $row['created_at'] . ')</p>';
                        }
                    } else {
                        echo "No notifications available.";
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>

    <!-- Category Filter Form -->
    <form method="POST" action="">
        <label for="category">Filter by Category:</label>
        <select name="category" id="category" onchange="this.form.submit()">
            <option value="">All Categories</option>
            <?php
            if ($categories->num_rows > 0) {
                while ($category_row = $categories->fetch_assoc()) {
                    $selected = ($filter_category == $category_row['category']) ? 'selected' : '';
                    echo '<option value="' . $category_row['category'] . '" ' . $selected . '>' . $category_row['category'] . '</option>';
                }
            }
            ?>
        </select>
    </form>
    
    <br><br>
    <div class="plant-library">
        <?php
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<div class="plant-card">';
                echo '<img src="' . $row["image_url"] . '" alt="' . $row["name"] . '">';
                echo '<a href="plant-details.php?id=' . $row["id"] . '">' . $row["name"] . '</a>';
                echo '</div>';
            }
        } else {
            echo "No plants found in the database.";
        }
        ?>
    </div>
</div>

<!-- Add Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    .plant-library-container {
        background-color: black;
        padding: 20px;
        border-radius: 10px;
        max-height: 600px;
        overflow-y: scroll;
    }

    .plant-library {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); 
        grid-auto-rows: 1fr;
        gap: 20px;
    }

    .plant-card {
        background-color: lightgray;
        padding: 10px;
        border: 1px solid green;
        text-align: center;
        border-radius: 8px;
        display: flex;
        flex-direction: column;
        align-items: center;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .plant-card:hover {
        transform: scale(1.05); 
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.15); 
    }

    .plant-card img {
        width: 100%; 
        height: 200px; 
        object-fit: cover; 
        border-radius: 8px; 
    }

    .plant-card a {
        margin-top: 10px;
        text-decoration: none;
        color: black;
        font-weight: bold;
        transition: color 0.3s ease;
    }

    .plant-card a:hover {
        color: darkgreen;
    }

  

    @media screen and (max-width: 768px) {
        .plant-card img {
            height: 150px; 
        }

        .plant-library {
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr)); 
        }
    }
</style>

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

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
