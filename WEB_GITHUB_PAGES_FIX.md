# GitHub Pages center-darkness fix

The browser build used a reduced WebGL shadow path while the large central ground plane still received the depth shadow map. On some WebGL/GPU combinations that depth texture can be interpreted as a broad false shadow, making the 70 x 62 central ground area look much darker than the surrounding `farGround` plane.

For Emscripten/WebGL only, realtime directional shadow receiving is disabled in the PBR beauty pass. The existing depth-contact AO remains, so objects still keep subtle grounding. Native/MSYS2 rendering is unchanged and retains the original realtime shadows.

The HTML/canvas fallback background also follows DAY/NIGHT mode, preventing browser-only dark gaps around the WebGL canvas.
