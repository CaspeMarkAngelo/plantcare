<?php
session_start();
include '../config/db.php';

// Check if the user is logged in
if (!isset($_SESSION['userid'])) {
    header("Location: login.php");
    exit;
}

$userid = $_SESSION['userid'];

// Check if the comment ID is provided
if (isset($_POST['comment_id'])) {
    $comment_id = (int)$_POST['comment_id'];

    // Verify if the logged-in user is the author of the comment
    $check_query = "SELECT UserID FROM Comments WHERE CommentID = $comment_id";
    $result = mysqli_query($conn, $check_query);

    if ($result && mysqli_num_rows($result) > 0) {
        $comment_user_id = mysqli_fetch_assoc($result)['UserID'];
        if ($comment_user_id == $userid) {
            // Delete the comment
            $delete_query = "DELETE FROM Comments WHERE CommentID = $comment_id";
            if (mysqli_query($conn, $delete_query)) {
                header("Location: forum.php?message=Comment deleted successfully.");
            } else {
                echo "Error deleting comment: " . mysqli_error($conn);
            }
        } else {
            echo "You are not authorized to delete this comment.";
        }
    } else {
        echo "Comment not found.";
    }
} else {
    echo "No comment ID provided.";
}
?>
