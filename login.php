<?php
session_start();
include 'config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $conn->real_escape_string($_POST['username']);
    $password = $_POST['password']; // No need to escape, as it's not directly used in SQL

    // Prepared statement to select user details by username
    $stmt = $conn->prepare("SELECT id, username, password FROM users WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        // Verify password using password_verify for hashed passwords
        if ($password === $row['password']) {
            // Store user details in session
            $_SESSION['userid'] = $row['id'];
            $_SESSION['username'] = $row['username'];
            $_SESSION['firstname'] = $row['firstname'];
            // Redirect to index.php after login
            header("Location: index.php");
            exit;
        } else {
            $_SESSION['error'] = "Incorrect password.";
        }
    } else {
        $_SESSION['error'] = "No user found with that username.";
    }

    $stmt->close();
}
?>

<!-- HTML and CSS for Login Page -->
<<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Include Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>

<div class="background"></div>

<div class="container">
    <div class="left-section">
        <img src="assets/logo_login.png" alt="Plant Logo">
    </div>

    <div class="right-section" style="font-weight: bold;">
        <!-- Display error message if it exists in session -->
        <?php if(isset($_SESSION['error'])): ?>
            <div class="error-message"><?= $_SESSION['error']; unset($_SESSION['error']); ?></div>
        <?php endif; ?>

        <form action="login.php" method="POST">
            <p>Username: </p>
            <input type="text" name="username" placeholder="Username" >

            <div class="password-container">
                <p>Password</p>
                <input type="password" id="password" name="password" placeholder="Password">
                <span class="toggle-password">
                    <i class="fas fa-eye" id="togglePasswordIcon"></i>
                </span>
            </div>

            <button type="submit">Log In</button>
        </form>

        <div class="footer">
            <p>No account? <span class="footer-separator">|</span> <a href="register.php">Register Now</a></p>
        </div>
    </div>
</div>

<script>
    document.querySelector('.toggle-password').addEventListener('click', function() {
        const passwordField = document.getElementById('password');
        const icon = document.getElementById('togglePasswordIcon');
        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            passwordField.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    });
</script>

</body>
</html>

<!-- External CSS (login.css) -->
<style>
/* CSS styling here */
body {
    margin: 0;
    font-family: Arial, sans-serif;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #E5E5E5;
    background-attachment: fixed;
}
p{
  color: grey;
}
.background {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: whitesmoke;
}
.background::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 50%; 
    background-image: url('assets/green.png');
    background-repeat: no-repeat;
    background-position: center; 
    background-size: cover;
}
.container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 70%;
    max-width: 1200px;
    z-index: 1;
}
.left-section {
    margin-top: -72px;
}
.left-section img {
    width: 400px;
}
.right-section {
    background-color: white;
    padding: 30px;
    box-shadow: 5px 8px 0 rgba(0, 0, 0, 0.3), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    width: 240px;
    background-image: linear-gradient(to bottom, white 50%, transparent 50%), 
                      url('assets/cute.png');
    background-repeat: no-repeat;
    background-position: center bottom;
    background-size: contain;
}
.right-section input {
    width: 100%;
    padding: 10px;
    margin: 0px;
    border-radius: 5px;
    border: 1px solid green;
}
.password-container {
    position: relative;
}
.password-container input {
    padding-right: 10px;
}
.toggle-password {
    position: absolute;
    right: 10px;
    top: 70%;
    transform: translateY(-50%);
    cursor: pointer;
}
.right-section button {
    background-color: green;
    color: white;
    padding: 10px;
    width: 50%;
    margin: 15px 60px 0 60px; /* 15px top margin for spacing from the password field */
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
.right-section button:hover {
    background-color: darkgreen;
}
.right-section .footer {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 10px;
}
.right-section .footer p {
    margin: 0;
    font-size: 14px;
}
.footer-separator {
    margin: 0 8px;
    font-weight: bold;
}
.right-section .footer a {
    color: #4CAF50;
    text-decoration: none;
}
.right-section .footer a:hover {
    text-decoration: underline;
}
.right-section::after {
    content: 'PlantCare';
    position: absolute;
    top: 0;
    right: 0;
    padding: 55px 230px;
    font-size: 50px;
    color: whitesmoke;
    font-weight: bold;
}
.error-message {
    color: red;
    text-align: center;
    margin-top: 10px;
}

</style>
