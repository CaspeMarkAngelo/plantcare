<?php
include('../config/db.php');
session_start();

// Check if the user is logged in
if (!isset($_SESSION['userid'])) {
    header("Location: login.php");
    exit;
}

// Retrieve the user's first name and user ID from the session
$firstname = ($_SESSION['firstname']);
$userid = $_SESSION['userid']; // User ID from the session

echo "<br><h2>Welcome to the Community Forum, $firstname!</h2>";
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Community Forum</title>
    <!-- Add Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
       /* Modal and post styling */
        #openModal {
            margin-top: 40px;
            margin-left: 280px;
            width: 200px;
            height: 50px;
            background-color: #006A4E;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.1em;
            cursor: pointer;
            display: block;
            text-align: center;
            transition: background-color 0.3s;
            position: sticky;
            top: 10px;
            z-index: 1000;
        }

        #openModal:hover {
            background-color: #0056b3;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }

        .modal-content {
            position: relative;
            margin: 10% auto;
            padding: 20px;
            width: 50%;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 1.5em;
            cursor: pointer;
            color: #333;
        }

        h2 {
            color: #006A4E;
            text-align: center;
            font-size: 30px;
        }

        h4 {
            text-align: center;
        }

        .form-container {
            margin: 20px auto;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            max-width: 850px;
            width: 100%;
        }

        textarea, input[type="file"], input[type="text"] {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        button {
            display: block;
            width: 100%;
            padding: 10px 0;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s;
            text-align: center;
        }

        button:hover {
            background-color: #0056b3;
        }

        .post {
            margin: 20px auto;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
            max-width: 700px;
            word-wrap: break-word;
        }

        .post img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-top: 10px;
        }

        .post-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 5px;
        }

        .post-header strong {
            font-size: 1em;
            color: #333;
        }

        .post-content {
            margin-top: 5px;
            margin-bottom: 10px;
        }

        .post-meta {
            font-size: 0.9em;
            color: #777;
            margin-top: 5px;
        }

        .comments {
            margin-top: 15px;
            padding: 10px;
            border-top: 1px solid #ddd;
        }

        .comment {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            background-color: #f1f1f1;
            align-items: flex-start;
        }

        .comment-content {
            flex: 1;
        }

        .delete-icon {
            background: none;
            border: 1px solid #f9f9f9;
            border-radius: 50%;
            padding: 5px;
            font-size: 1.5em;
            color: #e74c3c;
            cursor: pointer;
            transition: color 0.3s, border-color 0.3s;
        }

        .delete-icon:hover {
            color: #c0392b;
            border-color: #c0392b;
        }

        .like-button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            margin-right: 10px;
            transition: background-color 0.3s;
        }

        .like-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body class="content">
<a href="../index.php"><button>Back to dashboard</button></a>
    <h4>Feel free to explore and participate in discussions!</h4>

    <!-- Button to open the modal -->
    <button id="openModal">Create a Post</button>

    <!-- Modal Structure -->
    <div id="postModal" class="modal">
        <div class="modal-content">
            <span class="close" id="closeModal">&times;</span>
            <!-- Post Creation Form -->
            <div class="form-container">
                <h2>Create a Post</h2>
                <form action="post_handler.php" method="POST" enctype="multipart/form-data">
                    <textarea name="content" placeholder="Write your post here..." rows="4" required></textarea><br>
                    <label for="image">Attach an Image:</label><br>
                    <input type="file" name="image" id="image" accept="image/*"><br>
                    <input type="hidden" name="user_id" value="<?php echo $userid; ?>">
                    <button type="submit" name="submit_post">Post</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Display Posts -->
    <h2>Recent Posts</h2>
    <?php

    // Fetch posts from the database
    $query = "SELECT Posts.PostID, Posts.UserID, Posts.Content, Posts.ImageURL, Posts.CreatedAt, Users.firstname, Users.lastname 
              FROM Posts 
              JOIN Users ON Posts.UserID = Users.id 
              ORDER BY Posts.CreatedAt DESC";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $post_id = $row['PostID'];
            $post_user_id = $row['UserID'];

            echo "<div class='post'>";
            echo "<div class='post-header'>";
            echo "<strong>" . htmlspecialchars($row['firstname']) . " " . htmlspecialchars($row['lastname']) . ":</strong>";
            if ($post_user_id == $userid) {
                echo "<a href='delete_post.php?post_id=$post_id' class='delete-icon' title='Delete Post' onclick='return confirm(\"Are you sure you want to delete this post?\")'><i class='fa fa-trash'></i></a>";
            }
            echo "</div>";

            echo "<div class='post-content'>";
            echo "<p>" . nl2br(htmlspecialchars($row['Content'])) . "</p>";
            if (!empty($row['ImageURL'])) {
                $image_path = htmlspecialchars($row['ImageURL']);
                if (!preg_match('/^uploads\//', $image_path)) {
                    $image_path = "uploads/" . $image_path;
                }
                echo "<img src='$image_path' alt='Post Image'>";
            }
            echo "</div>";

            // Like button and count for post
            $like_query = "SELECT COUNT(*) AS likes_count FROM likes WHERE post_id = $post_id AND type = 'post'";
            $like_result = mysqli_query($conn, $like_query);
            $like_row = mysqli_fetch_assoc($like_result);
            $like_count = $like_row['likes_count'];

            echo "<div class='post-meta'>";
            echo "<small>Posted on ". htmlspecialchars($row['CreatedAt']). "<br></small> <br>";
            echo "<button class='like-button' data-id='$post_id' data-type='post'>❤️ Like ($like_count)</button>";
            echo "</div>";
            

            // Display comments for this post
            $comment_query = "SELECT Comments.CommentID, Comments.UserID, Comments.CommentText, Comments.CreatedAt, Users.firstname, Users.lastname 
                              FROM Comments 
                              JOIN Users ON Comments.UserID = Users.id 
                              WHERE Comments.PostID = $post_id 
                              ORDER BY Comments.CreatedAt ASC";
            $comment_result = mysqli_query($conn, $comment_query);

            if (mysqli_num_rows($comment_result) > 0) {
                echo "<div class='comments'>";
                while ($comment = mysqli_fetch_assoc($comment_result)) {
                    $comment_id = $comment['CommentID'];
                    $comment_user_id = $comment['UserID'];

                    echo "<div class='comment'>";
                    echo "<div class='comment-content'>";
                    echo "<p><strong>" . htmlspecialchars($comment['firstname']) . " " . htmlspecialchars($comment['lastname']) . ":</strong></p>";
                    echo "<p>" . nl2br(htmlspecialchars($comment['CommentText'])) . "</p>";
                    echo "<p><small>Commented on " . htmlspecialchars($comment['CreatedAt']) . "</small></p>";
                    echo "</div>";

                    // Like button and count for comment
                    $comment_like_query = "SELECT COUNT(*) AS likes_count FROM likes WHERE comment_id = $comment_id AND type = 'comment'";
                    $comment_like_result = mysqli_query($conn, $comment_like_query);
                    $comment_like_row = mysqli_fetch_assoc($comment_like_result);
                    $comment_like_count = $comment_like_row['likes_count'];

                    echo "<div class='comment-meta'>";
                    echo "<button class='like-button' data-id='$comment_id' data-type='comment'>❤️ Like ($comment_like_count)</button>";
                    echo "</div>";

                    if ($comment_user_id == $userid) {
                        echo "<form action='delete_comment.php' method='POST' style='display:inline;'>";
                        echo "<input type='hidden' name='comment_id' value='$comment_id'>";
                        echo "<button type='submit' class='delete-icon' title='Delete Comment' onclick='return confirm(\"Are you sure you want to delete this comment?\")'><i class='fa fa-trash'></i></button>";
                        echo "</form>";
                    }
                    echo "</div>";
                }
                echo "</div>";
            } else {
                echo "<br>";
                echo "<p>No comments yet. Be the first to comment!</p><br>"; 
            }

            // Comment form
            echo "<form action='comment_handler.php' method='POST'>";
            echo "<label for='comment_text'>Write a Comment:</label>";
            echo "<textarea name='comment_text' placeholder='Write a comment...' rows='2' required></textarea><br>";
            echo "<input type='hidden' name='post_id' value='$post_id'>";
            echo "<button type='submit' name='submit_comment'>Comment</button>";
            echo "</form>";

            echo "</div>";  // End of post div
        }
    } else {
        echo "<p>No posts yet. Be the first to create a post!</p>";
    }
    ?>
</body>
</html>

<script>
    // Handle like button click
    document.querySelectorAll('.like-button').forEach(button => {
        button.addEventListener('click', function() {
            const postId = this.getAttribute('data-id');
            const type = this.getAttribute('data-type');

            fetch('like_handler.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ id: postId, type: type })
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    let currentLikes = parseInt(this.textContent.match(/\d+/)[0]);
                    this.textContent = `❤️ Like (${currentLikes + 1})`;
                } else {
                    alert(data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    });
</script>

<script>
        // Get the modal and buttons
        const modal = document.getElementById('postModal');
        const openModalButton = document.getElementById('openModal');
        const closeModalButton = document.getElementById('closeModal');

        // Show the modal when the button is clicked
        openModalButton.onclick = function() {
            modal.style.display = 'block';
        };

        // Hide the modal when the close button is clicked
        closeModalButton.onclick = function() {
            modal.style.display = 'none';
        };

        // Hide the modal when clicking outside of it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = 'none';
            }
        };
    </script>