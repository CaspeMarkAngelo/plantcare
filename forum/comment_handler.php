<?php
include '../config/db.php';
session_start();

// Check if the user is logged in
if (!isset($_SESSION['userid'])) {
    header("Location: login.php");
    exit;
}

if (isset($_POST['submit_comment'])) {
    $user_id = $_SESSION['userid']; // Get the user ID from the session
    $post_id = $_POST['post_id'];
    $comment_text = mysqli_real_escape_string($conn, $_POST['comment_text']);

    // Ensure the post ID and user ID are valid before inserting
    if (!empty($post_id) && !empty($user_id) && !empty($comment_text)) {
        $query = "INSERT INTO Comments (PostID, UserID, CommentText) VALUES ('$post_id', '$user_id', '$comment_text')";

        if (mysqli_query($conn, $query)) {
            header("Location: forum.php");
            exit;
        } else {
            echo "Error: " . mysqli_error($conn);
        }
    } else {
        echo "Invalid data provided.";
    }
}
?>
