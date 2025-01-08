<?php
$uploadedImageUrl = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['imageUpload']) && $_FILES['imageUpload']['error'] === UPLOAD_ERR_OK) {
    $targetDir = "uploads/";
    $targetFile = $targetDir . basename($_FILES["imageUpload"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

    // Check if image file is an actual image or fake image
    if (!empty($_FILES["imageUpload"]["tmp_name"])) {
        $check = getimagesize($_FILES["imageUpload"]["tmp_name"]);
        if($check !== false) {
            $uploadOk = 1;
        } else {
            echo "File is not an image.";
            $uploadOk = 0;
        }
    } else {
        echo "File upload error.";
        $uploadOk = 0;
    }

    // Handle file renaming to avoid conflict
    if (file_exists($targetFile)) {
        $baseName = pathinfo($targetFile, PATHINFO_FILENAME);
        $counter = 1;
        while (file_exists($targetFile)) {
            $targetFile = $targetDir . $baseName . '_' . $counter . '.' . $imageFileType;
            $counter++;
        }
    }

    // Check file size
    if ($_FILES["imageUpload"]["size"] > 2000000) {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
    }

    // Allow certain file formats
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
    // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES["imageUpload"]["tmp_name"], $targetFile)) {
            $uploadedImageUrl = $targetFile;
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }
} else {
    echo "No file uploaded or upload error.";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farm Layout Designer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: auto;
        }

        h1, h2 {
            text-align: center;
        }

        .element-options {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin: 20px 0;
            overflow: hidden;
            transition: max-height 0.3s ease-out;
            max-height: 0; /* collapsed state, fully hidden */
        }

        .element {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            margin: 10px;
            cursor: pointer;
            border-radius: 5px;
            text-align: center;
            width: 100px;
        }

        #toggleElementsBtn {
            padding: 10px 20px;
            margin: 0 10px;
            cursor: pointer;
            background-color: #FF5722;
            color: white;
            border: none;
            border-radius: 5px;
        }



        .resize-controls {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .resize-controls input {
            margin: 0 10px;
            padding: 5px;
            width: 50px;
        }

        canvas {
            border: 1px solid #ccc;
            display: block;
            margin: 20px auto;
        }

        #imageUpload {
            display: block;
            margin: 20px auto;
        }

        .actions {
            display: flex;
            justify-content: center;
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
    <div class="main-container">
        <h1>Farm Layout Designer</h1>

        <form id="imageUploadForm" method="post" enctype="multipart/form-data">
            <input type="file" id="imageUpload" name="imageUpload" accept="image/*">
            <button type="submit">Upload Background Image</button>
        </form>
        
        <div class="actions">
        <button onclick="window.location.href='show_layout.php'">Back to Designer</button>
        <button id="toggleElementsBtn" onclick="toggleElements()">Show/Hide Plants</button>
        </div>
        
        <div class="element-options" id="elementOptions">
        <div class="element" onclick="addElement('arugula')">Arugula</div>
            <div class="element" onclick="addElement('basil')">Basil</div>
            <div class="element" onclick="addElement('beet')">Beet</div>
            <div class="element" onclick="addElement('bellpepper')">Bell Pepper</div>
            <div class="element" onclick="addElement('bittergourd')">Bitter Gourd</div>
            <div class="element" onclick="addElement('bokchoy')">Bok Choy</div>
            <div class="element" onclick="addElement('broccoli')">Broccoli</div>
            <div class="element" onclick="addElement('cabbage')">Cabbage</div>
            <div class="element" onclick="addElement('cabbagenapa')">Cabbage Napa</div>
            <div class="element" onclick="addElement('chard')">Chard</div>
            <div class="element" onclick="addElement('carrot')">Carrot</div>
            <div class="element" onclick="addElement('chayote')">Chayote</div>
            <div class="element" onclick="addElement('chicory')">Chicory</div>
            <div class="element" onclick="addElement('chili')">Chili</div>
            <div class="element" onclick="addElement('chives')">Chives</div>
            <div class="element" onclick="addElement('coriander')">Coriander</div>
            <div class="element" onclick="addElement('corn')">Corn</div>
            <div class="element" onclick="addElement('eggplant')">Eggplant</div>
            <div class="element" onclick="addElement('fennel')">Fennel</div>
            <div class="element" onclick="addElement('fenugreek')">Fenugreek</div>
            <div class="element" onclick="addElement('garlic')">Garlic</div>
            <div class="element" onclick="addElement('ginger')">Ginger</div>
            <div class="element" onclick="addElement('greenbeans')">Green Beans</div>
            <div class="element" onclick="addElement('kohlrabi')">Kohlrabi</div>
            <div class="element" onclick="addElement('lettuce')">Lettuce</div>
            <div class="element" onclick="addElement('lime')">Lime</div>
            <div class="element" onclick="addElement('mint')">Mint</div>
            <div class="element" onclick="addElement('moringa')">Moringa</div>
            <div class="element" onclick="addElement('mustardgreens')">Mustard Greens</div>
            <div class="element" onclick="addElement('okra')">Okra</div>
            <div class="element" onclick="addElement('onion')">Onion</div>
            <div class="element" onclick="addElement('oregano')">Oregano</div>
            <div class="element" onclick="addElement('peas')">Peas</div>
            <div class="element" onclick="addElement('pineapple')">Pineapple</div>
            <div class="element" onclick="addElement('pumpkin')">Pumpkin</div>
            <div class="element" onclick="addElement('pumpkinwinter')">Pumpkin Winter</div>
            <div class="element" onclick="addElement('purslane')">Purslane</div>
            <div class="element" onclick="addElement('radicchio')">Radicchio</div>
            <div class="element" onclick="addElement('radish')">Radish</div>
            <div class="element" onclick="addElement('saladgreens')">Salad Greens</div>
            <div class="element" onclick="addElement('spinach')">Spinach</div>
            <div class="element" onclick="addElement('summersquash')">Summer Squash</div>
            <div class="element" onclick="addElement('sweetbasil')">Sweet Basil</div>
            <div class="element" onclick="addElement('sweetpotato')">Sweet Potato</div>
            <div class="element" onclick="addElement('taro')">Taro</div>
            <div class="element" onclick="addElement('tomato')">Tomato</div>
            <div class="element" onclick="addElement('zucchini')">Zucchini</div>
            <div class="element" onclick="addElement('arduino')">Arduino</div>
            <div class="element" onclick="addElement('pump')">Pump</div>
            <div class="element" onclick="addElement('sensor')">Sensor</div>
        </div>

        

        <div class="resize-controls">
            <label for="iconWidth">Width:</label>
            <input type="number" id="iconWidth" value="50">
            <label for="iconHeight">Height:</label>
            <input type="number" id="iconHeight" value="50">
        </div>

        <canvas id="plotCanvas" width="700" height="700"></canvas>


        <div class="actions">
            <button onclick="clearCanvas()">Clear Canvas</button>
            <button onclick="saveLayout()">Save Layout</button>
            <button onclick="enableWiringMode()">Enable Wiring Mode</button>
            <button onclick="disableWiringMode()">Disable Wiring Mode</button>
            <button onclick="undoLastAction()">Undo Last Action</button>
        </div>

        <div class="resize-controls">
            <label for="lineColor">Line Color:</label>
            <input type="color" id="lineColor" value="#FF0000" onchange="setLineColor(this.value)">
            <label for="lineWidth">Line Width:</label>
            <input type="number" id="lineWidth" value="2" min="1" max="10" onchange="setLineWidth(this.value)">
        </div>


        <form id="saveForm" method="post" action="saves-layout.php" style="display:none;">
            <input type="hidden" name="imageData" id="imageData">
        </form>


    </div>

    <form id="saveForm" method="post" action="saves-layout.php" style="display:none;">
        <input type="hidden" name="imageData" id="imageData">
    </form>

    <script>
        const canvas = document.getElementById('plotCanvas');
        const ctx = canvas.getContext('2d');
        const elements = {

            basil: 'layouts/summerplants/basil.png',
            beet: 'layouts/summerplants/beet.png',
            bellpepper: 'layouts/summerplants/bell-pepper.png',
            bittergourd: 'layouts/summerplants/bitter-gourd.png',
            bokchoy: 'layouts/summerplants/bok-choy.png',
            cabbage: 'layouts/summerplants/cabbage.png',
            carrot: 'layouts/summerplants/carrot.png',
            chayote: 'layouts/summerplants/chayote.png',
            chicory: 'layouts/summerplants/chicory.png',
            chili: 'layouts/summerplants/chili.png',
            chives: 'layouts/summerplants/chives.png',
            coriander: 'layouts/summerplants/coriander.png',
            corn: 'layouts/summerplants/corn.png',
            eggplant: 'layouts/summerplants/eggplant.png',
            fennel: 'layouts/summerplants/fennel.png',
            fennugreek:'layouts/summerplants/fennugreek.png',
            garlic: 'layouts/summerplants/garlic.png',
            ginger: 'layouts/summerplants/ginger.png',
            greenbeans: 'layouts/summerplants/green-beans.png',
            kohlrabi: 'layouts/summerplants/kohlrabi.png',
            lettuce: 'layouts/summerplants/lettuce.png',
            mint: 'layouts/summerplants/mint.png',
            moringa: 'layouts/summerplants/moringa.png',
            mustardgreens: 'layouts/summerplants/mustard-greens.png',
            okra: 'layouts/summerplants/okra.png',
            onion: 'layouts/summerplants/onion.png',
            oregano: 'layouts/summerplants/oregano.png',
            pineapple: 'layouts/summerplants/pineapple.png',
            pumpkin: 'layouts/summerplants/pumpkin.png',
            purslane: 'layouts/summerplants/purslane.png',
            radish: 'layouts/summerplants/radish.png',
            spinach: 'layouts/summerplants/spinach.png',
            summersquash: 'layouts/summerplants/summer-squash.png',
            sweetbasil: 'layouts/summerplants/sweet-basil.png',
            sweetpotato: 'layouts/summerplants/sweet-potato.png',
            taro: 'layouts/summerplants/taro.png',
            tomato: 'layouts/summerplants/tomato.png',
            zucchini: 'layouts/summerplants/zucchini.png',
            lettuce: 'icons/lettuce.png',
            arduino: 'icons/arduino.png',
            pump: 'icons/pump.png',
            sensor: 'icons/sensor.png'
        };

        let isDrawing = false;
        let wiringMode = false;
        let startX = 0;
        let startY = 0;
        let lineColor = 'red';  // Default color
        let lineWidth = 2;      // Default line width

        // JavaScript to toggle the visibility of the elements
        // JavaScript to toggle the visibility of the elements
        // JavaScript to toggle the visibility of the elements
        function toggleElements() {
            var elementOptions = document.getElementById("elementOptions");
            var toggleBtn = document.getElementById("toggleElementsBtn");

            // Check if the container is currently collapsed (max-height: 0)
            if (elementOptions.style.maxHeight === "0px" || elementOptions.style.maxHeight === "") {
                elementOptions.style.maxHeight = elementOptions.scrollHeight + "px"; // Expand fully by setting max-height to scrollHeight (full content)
                toggleBtn.innerText = "Hide Plants"; // Change button text to "Hide Elements"
            } else {
                elementOptions.style.maxHeight = "0px"; // Collapse the container back to 0px, hiding all buttons
                toggleBtn.innerText = "Show Plants"; // Change button text to "Show Elements"
            }
        }




        // Function to change the line color
        function setLineColor(color) {
            lineColor = color;
        }

        // Function to change the line thickness
        function setLineWidth(width) {
            lineWidth = width;
        }
        

        function saveLayout() {
            // Convert canvas to data URL
            const imageData = canvas.toDataURL('image/png');

            // Set the hidden input value to the image data
            document.getElementById('imageData').value = imageData;

            // Submit the form
            document.getElementById('saveForm').submit();
        }


        function enableWiringMode() {
            wiringMode = true;
            canvas.style.cursor = 'crosshair';
        }

        function disableWiringMode() {
            wiringMode = false;
            canvas.style.cursor = 'default';
        }

        canvas.addEventListener('mousedown', function (e) {
            if (!wiringMode) return;

            isDrawing = true;
            const rect = canvas.getBoundingClientRect();
            startX = e.clientX - rect.left;
            startY = e.clientY - rect.top;
        });

        canvas.addEventListener('mousemove', function (e) {
            if (!isDrawing || !wiringMode) return;

            const rect = canvas.getBoundingClientRect();
            const endX = e.clientX - rect.left;
            const endY = e.clientY - rect.top;

            ctx.beginPath();
            ctx.moveTo(startX, startY);
            ctx.lineTo(endX, endY);
            ctx.strokeStyle = lineColor; // Use the dynamic line color
            ctx.lineWidth = lineWidth;   // Use the dynamic line width
            ctx.stroke();

            startX = endX;
            startY = endY;
        });


        canvas.addEventListener('mouseup', function () {
            if (!wiringMode) return;

            isDrawing = false;
        });

        canvas.addEventListener('mouseout', function () {
            if (!wiringMode) return;

            isDrawing = false;
        });


        let backgroundImage = null; // Variable to store the background image
        let actionsStack = []; // Stack to store actions

        
        function addElement(type) {
            const img = new Image();
            img.src = elements[type];
            img.onload = function () {
                canvas.addEventListener('click', function placeElement(event) {
                    const rect = canvas.getBoundingClientRect();
                    const x = event.clientX - rect.left;
                    const y = event.clientY - rect.top;
                    const width = parseInt(document.getElementById('iconWidth').value);
                    const height = parseInt(document.getElementById('iconHeight').value);

                    // Save the action to the stack
                    actionsStack.push({
                        type: 'image',
                        src: img.src,
                        x: x - width / 2,
                        y: y - height / 2,
                        width,
                        height,
                    });

                    // Redraw canvas with the new element
                    redrawCanvas();
                    canvas.removeEventListener('click', placeElement);
                });
            };
        }


        // Function to undo the last action
        function undoLastAction() {
            if (actionsStack.length === 0) {
                alert("No actions to undo.");
                return;
            }

            // Remove the last action
            actionsStack.pop();

            // Redraw the canvas
            redrawCanvas();
        }


        // Function to clear the canvas (update to clear the stack as well)
        function clearCanvas() {
            actionsStack = []; // Clear only the elements
            redrawCanvas(); // Redraw the canvas with just the background
        }

        function redrawCanvas() {
            // Clear the canvas
            ctx.clearRect(0, 0, canvas.width, canvas.height);

            // Redraw the background image (if present)
            if (backgroundImage) {
                ctx.drawImage(backgroundImage, 0, 0, canvas.width, canvas.height);
            }

            // Redraw all elements in the stack
            actionsStack.forEach(action => {
                if (action.type === 'image') {
                    const img = new Image();
                    img.src = action.src;
                    img.onload = function () {
                        ctx.drawImage(img, action.x, action.y, action.width, action.height);
                    };
                }
            });
        }

        <?php if (isset($uploadedImageUrl)): ?>
            const bgImage = new Image();
            bgImage.src = "<?php echo $uploadedImageUrl; ?>";
            bgImage.onload = function () {
                backgroundImage = bgImage; // Store the background image
                redrawCanvas(); // Redraw the canvas including the background
            };
        <?php endif; ?>

    </script>
</body>
</html>
