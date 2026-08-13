<div align="center">
  <img src="docs/visual_goal.png" alt="AquaNexus Logo" width="100%">
  
  # 🌊 AquaNexus 🐟
  
  **A Real-Time C++ & OpenGL Aquaculture Digital-Twin Simulation**
  
  [![Made with C++](https://img.shields.io/badge/Made%20with-C++17-blue.svg?style=for-the-badge&logo=c%2B%2B)](#)
  [![OpenGL](https://img.shields.io/badge/OpenGL-3.3%20Core-5586A4.svg?style=for-the-badge&logo=opengl)](#)
  [![WebGL](https://img.shields.io/badge/WebGL-2.0-990000.svg?style=for-the-badge&logo=webgl)](#)
  [![Platform](https://img.shields.io/badge/Platform-Web%20%7C%20Windows-lightgrey.svg?style=for-the-badge)](#)
</div>

---

## 🌟 Overview
**AquaNexus** is an advanced, photorealistic digital-twin demo built entirely from scratch. It simulates a rural aquaculture environment featuring realistic earthen ponds, dynamic water circulation, dense vegetation, and live telemetry data. The simulation is rendered in real-time, bringing to life the intricate balance of a functioning aquatic ecosystem!

---

## ✨ Key Features

### 🎨 Photorealistic Rendering
- **PBR Direct Lighting** with Cook-Torrance/GGX style shading.
- **Dynamic Weather & Time:** Procedural atmospheric sky, soft cloud fields, and a stunning day/night cycle.
- **High-Quality Post-Processing:** ACES-style filmic tone mapping, half-resolution bloom, and ambient occlusion.
- **Organic Environment:** Thousands of procedural grass blades with wind animation, irregular rocks, and dark wet shorelines.

### 💧 Advanced Water Optics
- **Dynamic Surface:** Animated water waves with capillary normal details and radial ripples from fan outlets.
- **Depth-Aware Optics:** Screen-space refraction, linearized depth difference, and Beer-Lambert absorption for natural deep-water coloring.
- **Interactive Shoreline:** Depth-driven foam and GGX-like sun glints.

### ⚙️ Live Simulation & Telemetry
- **Water Circulation:** Transparent cubic Bezier pipes with moving water packets and individual fan speed controls.
- **Dynamic Water Quality:** Real-time updates for pH, temperature, pressure, dissolved oxygen (DO), and ammonia (NH3).
- **Fish AI:** Fish behavior changes dynamically based on water quality, swimming depth, and inlet wave currents.

---

## 🎮 Controls

| 🎯 Action | ⌨️ Input |
| :--- | :--- |
| **Orbit Camera** | `Right Mouse Drag` |
| **Zoom** | `Mouse Wheel` |
| **Move Camera Target** | `Arrow Keys` |
| **Move Target Up/Down** | `Q` / `E` |
| **Restore Reference View** | `V` |
| **Cinematic Auto-Tour** | `C` |
| **Toggle Individual Fans** | `1`, `2`, `3` |
| **Toggle All Fans** | `F` |
| **Day/Night Mode** | `D` / `N` |
| **Pause/Resume** | `SPACE` |
| **Simulation Speed** | `X` (1x ➔ 5x ➔ 20x) |
| **Reset Simulation** | `R` |
| **Toggle Fullscreen** | `F11` |
| **Toggle UI HUD** | `H` |
| **Expand Telemetry** | `B` |
| **Exit** | `ESC` |

---

## 🚀 Experience AquaNexus
The project is fully compiled to **WebAssembly** via Emscripten and can be run directly in your browser. 
Simply visit the **GitHub Pages** link in this repository's environments to see the digital twin in action! No heavy game engines involved—just pure C++ and OpenGL power!

---
<div align="center">
  <i>Developed for realistic aquaculture simulation and interactive data visualization.</i>
</div>
