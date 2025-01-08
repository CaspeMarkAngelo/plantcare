<?php
session_start();
include '../config/db.php';

// Check if the post ID is provided
if (!isset($_GET['post_id'])) {
    die("No post ID provided.");
}

$post_id = intval($_GET['post_id']); // Convert to integer for security
$user_id = $_SESSION['userid'] ?? null; // Check if user ID is available in the session

if (!$user_id) {
    die("You must be logged in to delete a post.");
}

// Check if the post exists and belongs to the logged-in user
$query = "SELECT UserID FROM Posts WHERE PostID = $post_id";
$result = mysqli_query($conn, $query);

if ($row = mysqli_fetch_assoc($result)) {
    if ($row['UserID'] == $user_id) {
        // Delete the post
        $delete_query = "DELETE FROM Posts WHERE PostID = $post_id";
        if (mysqli_query($conn, $delete_query)) {
            header("Location: forum.php?message=Post deleted successfully");
            exit;
        } else {
            echo "Error deleting post: " . mysqli_error($conn);
        }
    } else {
        echo "You are not authorized to delete this post.";
    }
} else {
    echo "Post not found.";
}
?>
