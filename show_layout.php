<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saved Layout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        img {
            max-width: 100%;
            height: auto;
            border: 1px solid #ccc;
        }

        .actions {
            margin: 20px 0;
        }

        .actions button {
            padding: 10px 20px;
            margin: 0 10px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <?php include('sidebar.php'); ?>
    <h1>Saved Layout</h1>
    <div class="actions">
        <button onclick="window.location.href='layout.php'">Back to Designer</button>
    </div>
    <?php
    if (isset($_GET['image'])) {
        $imagePath = 'uploads/' . basename($_GET['image']);
        if (file_exists($imagePath)) {
            echo '<img src="' . $imagePath . '" alt="Saved Layout">';
        } else {
            echo '<p>Image not found.</p>';
        }
    } else {
        echo '<p>No image specified.</p>';
    }
    ?>
</body>
</html>
