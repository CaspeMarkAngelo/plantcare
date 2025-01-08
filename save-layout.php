<?php
// Capture the raw POST data
$data = file_get_contents("php://input");

// Check if data is received
if ($data) {
    // Decode the JSON data to verify its structure
    $decodedData = json_decode($data, true);
    
    // Validate the JSON structure
    if (json_last_error() === JSON_ERROR_NONE && is_array($decodedData)) {
        $layoutFile = 'saved-layout.json';

        // Attempt to save the data to the JSON file
        if (file_put_contents($layoutFile, json_encode($decodedData, JSON_PRETTY_PRINT))) {
            echo json_encode(['success' => true, 'message' => 'Layout saved successfully.']);
        } else {
            // Handle file writing errors
            echo json_encode(['success' => false, 'message' => 'Failed to save the layout to the file.']);
        }
    } else {
        // Handle invalid JSON
        echo json_encode(['success' => false, 'message' => 'Invalid JSON data received.']);
    }
} else {
    // Handle the case where no data is sent
    echo json_encode(['success' => false, 'message' => 'No data received.']);
}
?>
