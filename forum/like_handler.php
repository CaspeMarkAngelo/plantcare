<?php
session_start();
include '../config/db.php';

// Get the POST data from the AJAX request
$data = json_decode(file_get_contents('php://input'), true);
$id = $data['id'];
$type = $data['type'];
$user_id = $_SESSION['userid']; // Assuming user ID is stored in session

// Check if the user has already liked the post/comment
if ($type === 'post') {
    $query = "SELECT * FROM likes WHERE user_id = $user_id AND post_id = $id AND type = 'post'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) === 0) {
        // Insert new like
        $query = "INSERT INTO likes (user_id, post_id, type) VALUES ($user_id, $id, 'post')";
        if (mysqli_query($conn, $query)) {
            echo json_encode(['status' => 'success']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Error adding like']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'You have already liked this post']);
    }
} elseif ($type === 'comment') {
    $query = "SELECT * FROM likes WHERE user_id = $user_id AND comment_id = $id AND type = 'comment'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) === 0) {
        // Insert new like
        $query = "INSERT INTO likes (user_id, comment_id, type) VALUES ($user_id, $id, 'comment')";
        if (mysqli_query($conn, $query)) {
            echo json_encode(['status' => 'success']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Error adding like']);
        }
    } else {
        echo json_encode(['status' => 'error', 'message' => 'You have already liked this comment']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid type']);
}

mysqli_close($conn);
?>
