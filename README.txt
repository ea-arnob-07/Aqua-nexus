AQUANEXUS - QUICK START AND CONTROLS
===================================

DESKTOP BUILD (MSYS2 UCRT64)
----------------------------
1. Open the MSYS2 UCRT64 terminal.
2. Open this extracted project folder.
3. Run:  chmod +x build_msys2.sh run_msys2.sh
4. Run:  ./build_msys2.sh
5. Run:  ./run_msys2.sh

KEYBOARD AND MOUSE CONTROLS
---------------------------
Right mouse drag  - Orbit the camera
Mouse wheel       - Zoom in or out
Arrow keys         - Move the camera target
Q / E             - Move the camera target down or up
V                 - Restore the reference camera view
C                 - Start or stop the close cinematic pond tour
1 / 2 / 3         - Start or stop Fan 1 / Fan 2 / Fan 3
F                 - Start or stop all circulation fans
D                 - Switch directly to DAY mode
N                 - Switch directly to NIGHT mode
SPACE             - Pause or resume the simulation
X                 - Cycle simulation speed: 1x -> 5x -> 20x
R                 - Reset the simulation and camera
H                 - Hide or show all HUD cards
B                 - Enlarge or restore the Pond 2 sensor telemetry HUD
F11               - Enter or leave fullscreen
ESC               - Exit the application

CLICKABLE HUD
-------------
The fan rows, all-fans control, speed choices, pause, reset, DAY, NIGHT and
fullscreen buttons can all be clicked. The simulation starts in DAY mode.

POND 2 SENSOR HUD
-----------------
The normal right-side sensor HUD now uses larger, clearer text. Press B to open
the expanded live sensor view. It shows all six readings with large values,
channel descriptions, condition status and the overall water-quality index.
Press B again to return to the normal right-side HUD.

NIGHT ENVIRONMENT MODEL
-----------------------
Night mode gradually cools the pond and slightly lowers dissolved oxygen and
pH because photosynthesis stops while aquatic respiration continues. The
unionised NH3 reading also eases slightly in cooler, lower-pH water. Water
level and hydrostatic pressure continue to respond to circulation normally.

AQUANEXUS WEB / GITHUB PAGES
----------------------------
The browser version opens the simulation directly in a full-screen canvas.

LOCAL WEB BUILD
---------------
Activate an Emscripten SDK shell and run:
    ./web/build_web.sh

Then start the local server:
    ./web/run_web.sh

Open http://localhost:8080. A local HTTP server is required because browsers do
not load WebAssembly correctly by double-clicking index.html.

GITHUB PAGES DEPLOYMENT
-----------------------
1. Extract this ZIP first. Do not upload the ZIP itself as a repository file.
2. Upload the CONTENTS inside the aquanexus folder to the repository root.
   CMakeLists.txt and .github must be at the repository root. Include the hidden
   .github folder.
3. In the repository, open Settings -> Pages.
4. Under Build and deployment, select Source: GitHub Actions.
5. Push to the main or master branch. The included workflow builds the optimized
   WebAssembly release and deploys it automatically.
6. Open the Pages URL shown after the workflow finishes.

WEB PERFORMANCE PROFILE
-----------------------
The web build automatically uses a lower internal render resolution, a smaller
shadow map, cheaper shadow/AO/noise sampling and lighter procedural geometry.
Bloom is disabled only in WebGL. The desktop MSYS2 build keeps its full-quality
rendering settings. For best browser performance, use an updated Chrome, Edge
or Firefox with hardware acceleration enabled.
