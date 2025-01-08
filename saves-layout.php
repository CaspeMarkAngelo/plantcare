<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['imageData'])) {
    $imageData = $_POST['imageData'];
    $imageData = str_replace('data:image/png;base64,', '', $imageData);
    $imageData = str_replace(' ', '+', $imageData);
    $imageData = base64_decode($imageData);

    $fileName = 'layout_' . time() . '.png';
    $filePath = 'uploads/' . $fileName;
    file_put_contents($filePath, $imageData);

    header('Location: show_layout.php?image=' . $fileName);
    exit;
}
?>
