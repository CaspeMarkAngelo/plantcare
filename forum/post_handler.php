<?php
include '../config/db.php';
session_start();

if (isset($_POST['submit_post'])) {
    $user_id = $_POST['user_id'];
    $content = mysqli_real_escape_string($conn, $_POST['content']);
    $image_url = null;

    // Check if an image is uploaded
    if (!empty($_FILES['image']['name'])) {
        $target_dir = "uploads/";
        $image_name = basename($_FILES['image']['name']);
        $image_url = $target_dir . $image_name;

        // Ensure the uploaded file is a valid image (Check file type)
        $allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
        $image_type = $_FILES['image']['type'];

        if (in_array($image_type, $allowed_types)) {
            // Move the uploaded file to the target directory
            if (!move_uploaded_file($_FILES['image']['tmp_name'], $image_url)) {
                // If moving the file fails, redirect with an error
                $_SESSION['error'] = "There was an error uploading the image.";
                header("Location: forum.php");
                exit();
            }
        } else {
            // If file type is invalid, show an error
            $_SESSION['error'] = "Invalid image file type. Only JPG, PNG, and GIF are allowed.";
            header("Location: forum.php");
            exit();
        }
    }

    // Insert the post into the database
    $query = "INSERT INTO Posts (UserID, Content, ImageURL) VALUES ('$user_id', '$content', '$image_url')";
    
    if (mysqli_query($conn, $query)) {
        // If the post was successfully inserted
        header("Location: forum.php");
        exit();
    } else {
        // If there's a database error
        $_SESSION['error'] = "Error posting your content. Please try again.";
        header("Location: forum.php");
        exit();
    }
}
?>
