<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Layout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
        }
        .main-container {
            width: 90%; /* Adjusted for responsiveness */
            max-width: 800px;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center; /* Center text inside the container */
        }
        .canvas-container {
            position: relative;
            width: 100%;
            max-width: 500px;
            border: 1px solid #ccc;
            background-color: #A9A9A9;
            margin-bottom: 20px;
            border-radius: 8px;
        }
        canvas {
            display: block;
            margin: 0 auto;
            border-radius: 8px;
        }
        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }
        /* Styling for the buttons */
        .button-container {
            display: flex;
            gap: 15px;
            margin-top: 20px;
            justify-content: center;
            width: 100%;
        }
        button {
            padding: 12px 25px;
            font-size: 16px;
            background-color: #006A4E;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        button:hover {
            background-color: #45a049;
            transform: scale(1.05); 
        }
        button:active {
            transform: scale(1); 
        }
        button:focus {
            outline: none;
        }
    </style>
</head>
<body>
    <?php include('sidebar.php'); ?>
    <div class="main-container">
        <h1>View Saved Layout</h1>
        <div class="canvas-container">
            <canvas id="viewCanvas" width="500" height="500"></canvas>
        </div>
        <!-- Added a container for the buttons -->
        <div class="button-container">
            <button onclick="goBack()">Back to Designer</button>
            <button onclick="refreshLayout()">Refresh Layout</button>
        </div>
    </div>

    <script>
        const canvas = document.getElementById('viewCanvas');
        const ctx = canvas.getContext('2d');

        // Load images
        const images = {
            Basil: loadImage('http://localhost/capstone/layouts/summerplants/basil.png'),
            Beet: loadImage('http://localhost/capstone/layouts/summerplants/beet.png'),
            BellPepper: loadImage('http://localhost/capstone/layouts/summerplants/bell-pepper.png'),
            BitterGourd: loadImage('http://localhost/capstone/layouts/summerplants/bitter-gourd.png'),
            BokChoy: loadImage('http://localhost/capstone/layouts/summerplants/bok-choy.png'),
            Cabbage: loadImage('http://localhost/capstone/layouts/summerplants/cabbage.png'),
            Carrot: loadImage('http://localhost/capstone/layouts/summerplants/carrot.png'),
            Chayote: loadImage('http://localhost/capstone/layouts/summerplants/chayote.png'),
            Chicory: loadImage('http://localhost/capstone/layouts/summerplants/chicory.png'),
            Chili: loadImage('http://localhost/capstone/layouts/summerplants/chili.png'),
            Chives: loadImage('http://localhost/capstone/layouts/summerplants/chives.png'),
            Coriander: loadImage('http://localhost/capstone/layouts/summerplants/coriander.png'),
            Corn: loadImage('http://localhost/capstone/layouts/summerplants/corn.png'),
            Eggplant: loadImage('http://localhost/capstone/layouts/summerplants/eggplant.png'),
            Fennel: loadImage('http://localhost/capstone/layouts/summerplants/fennel.png'),
            Fennugreek: loadImage('http://localhost/capstone/layouts/summerplants/fennugreek.png'),
            Garlic: loadImage('http://localhost/capstone/layouts/summerplants/garlic.png'),
            Ginger: loadImage('http://localhost/capstone/layouts/summerplants/ginger.png'),
            GreenBeans: loadImage('http://localhost/capstone/layouts/summerplants/green-beans.png'),
            Kohlrabi: loadImage('http://localhost/capstone/layouts/summerplants/kohlrabi.png'),
            Lettuce: loadImage('http://localhost/capstone/layouts/summerplants/lettuce.png'),
            Mint: loadImage('http://localhost/capstone/layouts/summerplants/mint.png'),
            Moringa: loadImage('http://localhost/capstone/layouts/summerplants/moringa.png'),
            MustardGreens: loadImage('http://localhost/capstone/layouts/summerplants/mustard-greens.png'),
            Okra: loadImage('http://localhost/capstone/layouts/summerplants/okra.png'),
            Onion: loadImage('http://localhost/capstone/layouts/summerplants/onion.png'),
            Oregano: loadImage('http://localhost/capstone/layouts/summerplants/oregano.png'),
            Pineapple: loadImage('http://localhost/capstone/layouts/summerplants/pineapple.png'),
            Pumpkin: loadImage('http://localhost/capstone/layouts/summerplants/pumpkin.png'),
            Purslane: loadImage('http://localhost/capstone/layouts/summerplants/purslane.png'),
            Radish: loadImage('http://localhost/capstone/layouts/summerplants/radish.png'),
            Spinach: loadImage('http://localhost/capstone/layouts/summerplants/spinach.png'),
            SummerSquash: loadImage('http://localhost/capstone/layouts/summerplants/summer-squash.png'),
            SweetBasil: loadImage('http://localhost/capstone/layouts/summerplants/sweet-basil.png'),
            SweetPotato: loadImage('http://localhost/capstone/layouts/summerplants/sweet-potato.png'),
            Taro: loadImage('http://localhost/capstone/layouts/summerplants/taro.png'),
            Tomato: loadImage('http://localhost/capstone/layouts/summerplants/tomato.png'),
            Zucchini: loadImage('http://localhost/capstone/layouts/summerplants/zucchini.png'),
            Pump: loadImage('http://localhost/capstone/layouts/pump.png'),
            Arduino: loadImage('http://localhost/capstone/layouts/uno.png'),
            defaultLayout: loadImage('http://localhost/capstone/layouts/canvas2.jpg') // Background image
        };

        // Helper to load images with error handling
        function loadImage(src) {
            const img = new Image();
            img.src = src;
            img.onload = () => console.log(`Image loaded: ${src}`);
            img.onerror = () => console.error(`Failed to load image: ${src}`);
            return img;
        }

        // Fetch and redraw the layout
        function refreshLayout() {
            console.log("Refreshing layout...");
            fetch('saved-layout.json?t=' + new Date().getTime())
                .then(response => {
                    if (!response.ok) throw new Error('Failed to fetch layout data');
                    return response.json();
                })
                .then(data => {
                    console.log('Updated Layout data:', data);
                    drawLayout(data);
                })
                .catch(error => {
                    console.error('Error refreshing layout:', error);
                    alert('Failed to refresh the saved layout.');
                });
        }

        // Draw the layout
        function drawLayout(layout) {
            ctx.clearRect(0, 0, canvas.width, canvas.height);

            // Draw the default background image
            const bg = images.defaultLayout;
            if (bg.complete) {
                ctx.drawImage(bg, 0, 0, canvas.width, canvas.height);
            } else {
                bg.onload = () => ctx.drawImage(bg, 0, 0, canvas.width, canvas.height);
            }

            // Draw other items from the layout
            layout.forEach(item => {
                const img = images[item.item];
                if (img && img.complete) {
                    ctx.drawImage(img, item.x, item.y, item.width, item.height);
                } else if (img) {
                    img.onload = () => ctx.drawImage(img, item.x, item.y, item.width, item.height);
                }
            });
        }

        // Fetch saved layout data
        fetch('saved-layout.json')
            .then(response => {
                if (!response.ok) throw new Error('Failed to fetch layout data');
                return response.json();
            })
            .then(data => {
                console.log('Layout data:', data);
                drawLayout(data);
            })
            .catch(error => {
                console.error('Error loading layout:', error);
                alert('Failed to load the saved layout.');
            });

        // Go back to the designer page
        function goBack() {
            window.location.href = "http://localhost/capstone(test)/layout.php";
        }
    </script>
</body>
</html>
