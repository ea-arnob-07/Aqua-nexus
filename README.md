# AquaNexus

A real-time **C++17 + raw OpenGL 3.3** aquaculture digital-twin demo for MSYS2 UCRT64. This rebuild is aimed at the supplied rural reference: realistic earthen ponds, blue pond water, dense vegetation, village background, transparent circulation pipes, rotating fans, fish, debris accumulation and live Pond-2 sensors.

The default composition intentionally keeps:

- **Pond 1** near / lower-right
- **Pond 2** left-middle
- **Pond 3** far / upper-right
- a triangular transparent pipe network: P1 -> P2 -> P3 -> P1

`docs/reference_target.jpg` is the supplied visual reference. `docs/visual_goal.png` is the photoreal dashboard concept used as a secondary visual target.

## Why v4 looks less cartoon-like

The previous version had advanced words in the renderer, but too much of the actual scene was still built from clean boxes, spheres and saturated flat colors. v4 changes the things that matter visually:

- continuous rounded/eroded pond-basin mesh instead of four box walls;
- irregular embedded crest rocks and a dark wet shoreline band;
- much lower, physically believable pond water surface relative to the bank;
- thousands of procedural grass/rice/reed blades rendered in large batched meshes;
- wind animation in vegetation from the PBR vertex shader;
- irregular organic bush geometry instead of perfect spheres;
- procedural ground, bank, wood, thatch, metal and vegetation micro-variation;
- restrained natural color palette instead of game-like saturated greens;
- depth-aware water optics and post-process contact grounding.

## Rendering stack

- **C++17**
- **OpenGL 3.3 Core** on desktop
- **GLFW** window / input
- **GLEW** OpenGL extension loading
- **GLM** mathematics
- **CMake + Ninja**
- **Emscripten / WebGL 2** optional web target
- separate runtime GLSL files in `shaders/`

### Photoreal rendering features

- Cook-Torrance / GGX-style PBR direct lighting
- Schlick Fresnel
- 4096 x 4096 directional shadow map with weighted PCF
- procedural 2D value noise + multi-octave FBM materials
- wind-deformed vegetation vertex shading
- procedural atmospheric sky and soft cloud field
- HDR desktop render target
- half-resolution bloom
- ACES-style filmic tone mapping
- FXAA-style local edge smoothing + detail recovery
- lightweight depth-contact ambient occlusion
- atmospheric distance haze
- restrained saturation, warm daylight balance, vignette and subtle grain

### Water optics

Each pond uses a subdivided animated surface rather than a flat transparent rectangle:

- four directional wave bands
- high-frequency capillary normal detail
- fan-outlet radial ripples
- physically inspired Fresnel reflection
- screen-space refraction of the opaque scene
- **linearized depth difference** between water and pond bottom
- Beer-Lambert-style absorption so deeper water naturally becomes darker blue
- turbidity / quality coupling
- GGX-like sun glints
- depth-driven shoreline foam

### Transparent pipes and circulation

- cubic Bezier pipe routes
- high-resolution outer clear tube + inner water tube
- refractive/Fresnel glass shader
- individually controlled fan speed
- moving water packets only while the corresponding fan is spinning
- outlet bubbles and turbulence
- pipe flanges, motors and five-blade rotors

## Simulation

The simulation is a visual digital twin for demonstration, not a certified CFD or aquaculture-control model.

- fan speed transfers water between the connected ponds;
- unequal fan states create small water-level differences;
- circulation improves simulated dissolved oxygen;
- waste + fish loading increase simulated ammonia;
- waste + fish loading reduce simulated DO;
- Pond-2 pH, temperature, pressure, level, NH3 and DO update continuously;
- poor Pond-2 water quality changes fish speed and swimming depth;
- visible organic debris slowly accumulates in one corner of every pond.

Use **X** to switch 1x -> 5x -> 20x during a presentation.

## MSYS2 UCRT64 install

Open **MSYS2 UCRT64**.

```bash
pacman -Syu
```

If MSYS2 asks you to close/reopen the terminal, open **UCRT64** again, then install:

```bash
pacman -S --needed \
  mingw-w64-ucrt-x86_64-toolchain \
  mingw-w64-ucrt-x86_64-cmake \
  mingw-w64-ucrt-x86_64-ninja \
  mingw-w64-ucrt-x86_64-glfw \
  mingw-w64-ucrt-x86_64-glew \
  mingw-w64-ucrt-x86_64-glm
```

## Build

From the extracted project folder:

```bash
chmod +x build_msys2.sh
./build_msys2.sh
```

Run:

```bash
./build/bin/AquaVillage3D_Cinematic.exe
```

The build automatically copies the `shaders/` directory beside the executable. The shader loader also searches the project root, `../` and `../../`, so launching from the project root or `build/bin` both work.

### Manual build

```bash
rm -rf build
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build build --parallel
./build/bin/AquaVillage3D_Cinematic.exe
```

## Controls

| Control | Action |
|---|---|
| Right mouse drag | Orbit camera |
| Mouse wheel | Zoom |
| Arrow keys | Move camera target |
| Q / E | Move camera target up / down |
| V | Restore reference composition |
| C | Close auto-tour: Pond 1 -> Pond 2 -> Pond 3 cinematic path |
| 1 / 2 / 3 | Fan 1 / 2 / 3 ON/OFF |
| F | Toggle all fans |
| D | Switch to day mode |
| N | Switch to night mode |
| SPACE | Pause / resume |
| X | 1x -> 5x -> 20x simulation speed |
| R | Reset simulation + camera |
| H | Hide / show monitoring HUD |
| B | Enlarge / restore Pond 2 sensor telemetry HUD |
| F11 | Toggle fullscreen / restore window |
| ESC | Exit |

The simulation starts in **day mode**. The left-side fan, speed, pause, reset, day/night and fullscreen controls are clickable. The header and bottom HUD bars have been removed; only the transparent operational cards remain.

## Browser build and GitHub Pages

The browser version opens the simulation directly in a full-screen canvas.

To make a local WebAssembly build from an activated Emscripten SDK shell:

```bash
chmod +x web/build_web.sh web/run_web.sh
./web/build_web.sh
./web/run_web.sh
```

Open `http://localhost:8080`. The build output is written to `dist/`.

For GitHub Pages:

1. Extract the ZIP and upload the contents inside the `aquanexus` folder—not the ZIP itself—to the repository root. `CMakeLists.txt` and `.github` must be at the root.
2. Include `.github/workflows/pages.yml`; on Windows, make sure the hidden `.github` folder is selected.
3. Open **Settings -> Pages** and choose **GitHub Actions** as the source.
4. Push to `main` or `master`, or run the workflow manually from the **Actions** tab.
5. The workflow installs Emscripten, creates an optimized WebAssembly build and deploys `dist/`.

The generated `index.html` is only the minimal full-screen WebAssembly loader required by the browser.

## Folder structure

```text
AquaNexus/
|-- CMakeLists.txt
|-- build_msys2.sh
|-- run_msys2.sh
|-- diagnose_msys2.sh
|-- MSYS2_INSTALL.txt
|-- README.md
|-- README.txt
|-- src/
|   |-- main.cpp
|   |-- App.cpp / App.hpp
|   |-- Camera.cpp / Camera.hpp
|   |-- Mesh.cpp / Mesh.hpp
|   |-- Scene.cpp / Scene.hpp
|   |-- Shader.cpp / Shader.hpp
|   |-- Simulation.cpp / Simulation.hpp
|   `-- UI.cpp / UI.hpp
|-- shaders/
|   |-- pbr.vert / pbr.frag
|   |-- water.vert / water.frag
|   |-- glass.vert / glass.frag
|   |-- sky.vert / sky.frag
|   |-- shadow.vert / shadow.frag
|   |-- post.vert / post.frag
|   |-- bright.vert / bright.frag
|   |-- blur.vert / blur.frag
|   `-- ui.vert / ui.frag
|-- docs/
|   |-- reference_target.jpg
|   |-- visual_goal.png
|   |-- TECHNICAL.md
|   `-- VALIDATION.md
|-- .github/
|   `-- workflows/pages.yml
`-- web/
    |-- build_web.sh
    |-- run_web.sh
    `-- shell.html
```

## Performance

The Emscripten build now enables a dedicated WebGL performance profile while the desktop build retains the original high-quality settings. Web-only changes include:

- 72% internal 3D render resolution while HUD text remains at canvas resolution;
- 1536-pixel shadow map and reduced shadow casters;
- cached shader uniform locations;
- cheaper PBR shadow, AO, cloud and procedural-noise sampling;
- reduced palm, distant-tree, pipe-particle and fish-detail draw calls;
- lower-cost procedural meshes and no WebGL bloom pass;
- `-O3`, link-time optimization and `emmalloc` for the WebAssembly release.

For best results, use a current Chrome, Edge or Firefox with hardware acceleration enabled. The scene intentionally remains detailed, so low-power phones may still be slower than a desktop browser.

If an older desktop integrated GPU is slow:

1. resize the window smaller;
2. change `shadowSize_` in `src/Scene.hpp` from `4096` to `2048`;
3. reduce `2200` / `1800` grass blade counts in the `SceneRenderer` constructor;
4. reduce the `Mesh::roundedWaterSurface(128,40,...)` perimeter/radial subdivisions.

No Unity/Unreal or external game engine is used. Geometry, materials and animation are generated by the custom C++ / OpenGL renderer.


## v5 Visual Updates
- Freer screen rotation: left or right mouse drag both orbit the camera.
- Pond water tuned to a more blueish look.
- Pipe arches lowered for a flatter layout.
- Pipe interior flow particles made brighter and denser.
- Fish sizes reduced significantly.

- v6 update: fan/pump assemblies moved from the middle of the pipes to the START of each pipe near the pond edge.


## v7 Concept Update
- Ponds are spaced much farther apart in a village-scale chain.
- Main visible flat pipes now emphasize Pond 1 -> Pond 2 and Pond 2 -> Pond 3.
- A low rear return line keeps loop circulation behavior intact.
- Water has been pushed further toward a clean sky-blue look for clearer visible flow.


## v15 Visual / Camera Updates
- **C key** now starts a close-up auto-tour camera path.

## Day / Night and Fish Update

- The application starts in daylight. Press **D** for day and **N** for night.
- At night, the sensor model gradually lowers pond temperature, dissolved oxygen and pH; unionised NH3 also eases slightly with the cooler/lower-pH water.
- Pond labels show only `POND 1`, `POND 2` and `POND 3`; visible fish quantities are no longer printed in the scene.
- Fish retain positive rheotaxis and naturally face/station-hold against active inlet waves; normal roaming fish remain mixed into every school.
- The cinematic route travels **Pond 1 -> Pond 2 -> Pond 3** with zoomed-in detail shots.
- Pond water is tuned to a **deeper blue-green** look.
- Pond basins and water depth are increased for a stronger sense of depth.
