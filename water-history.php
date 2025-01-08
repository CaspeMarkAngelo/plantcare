<?php
session_start();
include 'config/db.php';

header('Content-Type: text/html');

if (!isset($_SESSION['userid'])) {
    header("Location: login.php");
    exit;
}

// Execute the query directly without parameters
$stmt = $conn->prepare("
 SELECT * FROM `water_history` ORDER BY `water_history`.`watered_on` DESC
");
$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Watering History</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .content {
            padding: 20px;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }

        h1 {
            text-align: center;
            color: #4CAF50; 
            font-size: 2em;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table thead {
            background-color: #4CAF50; 
            color: white;
        }

        table, th, td {
            border: none;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9; 
        }

        td.status-watered {
            color: #388e3c;
            font-weight: bold;
        }

        td.status-not-watered {
            color: #d32f2f;
            font-weight: bold;
        }

        tbody tr {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        tbody tr:hover {
            transform: scale(1.05); 
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15); 
        }

        @media screen and (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }

            th, td {
                font-size: 14px;
                padding: 8px;
            }
        }
        th {
            background-color: #006A4E;
        }
    </style>
</head>
<body>

<?php include('sidebar.php'); ?>

<div class="content">
    <h1 style="color: #006A4E;">Watering History</h1>

    <?php if ($result->num_rows > 0): ?>
    <table>
        <thead>
            <tr>
                <th>Device Name</th>
                <th>Watered On</th>
                <th>Message</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($row = $result->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($row['device_name']); ?></td>
                    <td><?php echo htmlspecialchars($row['watered_on']); ?></td>
                    <td><?php echo htmlspecialchars($row['message']); ?></td>
                </tr>
            <?php endwhile; ?>
        </tbody>
    </table>
    <?php else: ?>
        <p>No watering history found for your devices.</p>
    <?php endif; ?>
</div>

</body>
</html>

<?php
$stmt->close();
$conn->close();
?>