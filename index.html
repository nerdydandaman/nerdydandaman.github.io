<!DOCTYPE html>
<html>
    <head>
        <meta name="description" content="This is the final draft of my senior research educational simulation.">
        <meta name="author" content="Daniel Olson">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1, maximum-scale=1, user-scalable=0">
        <link rel="stylesheet" href="styles.css">
        <style id="chosenBackground">
            body {
                background-image: url("./roughPersonDraftBackground.jpg");
            }
            #truckSVG {
                height: 10%;
                z-index: 1;
                animation-timing-function: linear;  
                position: absolute;
                animation-duration: 5s;
            }
            #crateSVG {
                height: 3.88%;
                z-index: 0;
                animation-timing-function: linear;  
                position: absolute;
                animation-duration: 5s;
            }

        </style>
        <title>
            IRF Simulation
        </title>
    </head>

    <body class="slide" id="chooseFrame">
        <!-- This section will contain the GUI element definitions -->
        <!-- This div contains the menu elements, and will reside on the top of the page -->
        <div class="optionshead" id="scrollingBackground">
            <form action="/action_page.php" method="get">
                <!-- Slider, menu, and button labels -->
                <span class="projecttitle">Inertial Reference Frames</span>
                <span class="chooseframetitle">Choose a Reference-Frame</span>
                <span class="pickupvelocitytitle">Pickup-Truck Velocity</span>

                <span class="resetbuton">Reset the Simulation</span>

                <!-- Create a new "row" -->
                <br>

                <!-- Create the drop-down menus, the sliders, and the button -->
                <!-- Create the drop-down menu -->
                <span class="chooseframe">
                    <select onchange="chooseBackground();" id="frameSelector">
                        <option value="Bystander">Bystander</option>
                        <option value="ThePickup">Pickup-Truck</option>
                    </select>
                </span>

                <!-- Create the velocity-controlling sliders -->
                <!-- Pickup velocity slider -->
                <span>
                    <input type="range" min="10" max="40" class="pickupvelocity" id="truckVel" onchange="updateTruckVel(this.value);" oninput="updateTruckAnimationSpeed(this.value);" onchange="chooseBackground(this.value);">
                </span>

                <!-- Create the reset button -->
                <span>
                    <input type="reset" value="Reset" class="resetting" id="reset">
                </span>

                <!-- Create a new "row" -->
                <br>

                <!-- Create two boxes to display the velocity underneath the sliders -->
                <!-- Truck velocity label -->
                <span>
                    <input type="text" class="displayedTVel" id="truckVelValue" readonly>
                </span>
            </form>
        </div>

        <!-- Define the SVG images used in the simulation -->
        <div>
            <img src="svgpickup.svg" height="10%" alt="pickup-truck with an open back" class="pickup" id="truckSVG">
            <img src="svgcrate.svg" height="3.88%" alt="generic brown crate"  class="crate" id="crateSVG">
        </div>

        <!-- Write the functions to be used in the simulation -->
        <!-- Wrtie a function that codes the reset button -->
        <script>
            document.getElementById("reset").onclick = function() {
                location.reload();
            }
        </script>

        <!-- Wrtie a function that displays the pickup velocity based on the slider -->
        <script>
            function updateTruckVel(tVelVal) {
                document.getElementById('truckVelValue').value=tVelVal+' mph';
            };
        </script>
        
        <!-- Wrtie a function that chooses the background art for each reference frame -->
        <script>
            function chooseBackground(bAnimVel) {
                // Set a counter variable and other loop variables
                var i;
                k=1.0;
                bAnimT=48.0;

                // This code sets the default background image and sets a variable that is tied to the background image that can be changed as necessary
                var chosenFrame = document.getElementById("chooseFrame");
                chosenFrame.style.backgroundImage = "url('./roughDraftBackground.jpg')";

                //  Use conditional statements to determine what background is selected and set stylization choices
                if(document.getElementById("frameSelector").value === "Bystander"){
                    // Resets the pickup location for a smoother transition upon frame selection
                    document.getElementById('truckSVG').className = 'pickup';
                    document.getElementById("crateSVG").className = 'alternateCrate';
                    // Sets details for the bystander frame
                    chosenFrame.style.backgroundImage = "url('./roughPersonDraftBackground.jpg')";
                    document.getElementById("chooseFrame").style.animationDuration='0s';
                }else if(document.getElementById("frameSelector").value === "ThePickup"){
                    // Resets the pickup location for smoother transition
                    document.getElementById('truckSVG').className = 'pickupVer2';
                    document.getElementById("crateSVG").className = 'stillcrate';
                    // Sets details for the pickup frame
                    // Set different resolution background images as backgrounds depending on the screen resolution
                    chosenFrame.style.backgroundImage = "url('./roughDraftBackground.jpg')";
                }
            };
        </script>
        
        <!-- Wrtie a function that controls the velocity of the pickup -->
        <script>
            function updateTruckAnimationSpeed(tAnimVel) {
                // Set up loop variables
                var i;
                k=1.0;
                tAnim=48.0;

                // Create three nested for loops inside if conditionals that reset the class of each SVG, thus ressetting the program as well as setting the animation details to the correct values for each velocity
                // For the bystander frame
                if(document.getElementById("frameSelector").value === "Bystander"){
                    for(i = 10; i < 41; i++){
                        tAnim=tAnim*k;
                        j=i+1;
                        k=i/j;
                        if(tAnimVel==i){
                            document.getElementById("crateSVG").className = 'crate' + i;
                            document.getElementById("truckSVG").className = 'pickup' + i;
                            // This line of code controls the distance from the boxes starting position at which the box hits the ground 
                            document.getElementById('truckSVG').style.animationDuration=tAnim + 's';
                            document.getElementById('crateSVG').style.animationDuration=tAnim + 's';
                            break;
                        }
                    }
                }
                // For the pickup frame
                if(document.getElementById("frameSelector").value === "ThePickup"){
                    for(i = 10; i < 41; i++){
                        tAnim=tAnim*k;
                        j=i+1;
                        k=i/j;
                        if(tAnimVel==i){
                            document.getElementById('crateSVG').className = 'crate' + i + 'Ver2';
                            document.getElementById('truckSVG').className = 'pickupVer2';
                            document.getElementById('truckSVG').style.animationDuration=tAnim + 's';
                            document.getElementById('crateSVG').style.animationDuration=tAnim + 's';
                            break;
                        }
                    }
                }
            };
        </script>
    </body>
</html>
