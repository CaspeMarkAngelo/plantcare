<?php
// Include your database configuration
include('config/db.php');

// Check if form data is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get data from form
    $firstname = $_POST['firstname'];
    $middlename = $_POST['middlename'];
    $lastname = $_POST['lastname'];
    $sex = $_POST['sex'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    // Optional: Hash the password for security
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    
    // Prepare the SQL query to insert data into the users table
    $sql = "INSERT INTO users (firstname, middlename, lastname, sex, username, password) 
            VALUES (?, ?, ?, ?, ?, ?)";

    // Prepare the statement
    if ($stmt = $conn->prepare($sql)) {
        // Bind parameters to the statement
        $stmt->bind_param("ssssss", $firstname, $middlename, $lastname, $sex, $username, $hashed_password);
        
        // Execute the query
        if ($stmt->execute()) {
            echo "Account saved successfully!";
        } else {
            echo "Error saving account: " . $stmt->error;
        }
        
        // Close the statement
        $stmt->close();
    } else {
        echo "Error preparing query: " . $conn->error;
    }
}

// Close the connection
$conn->close();
?>
