#!/usr/bin/env bash
set -euo pipefail

# Requires an activated Emscripten SDK and GLM headers visible to CMake.
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd "$script_dir/.." && pwd)"
build_dir="$project_dir/build-web"
dist_dir="$project_dir/dist"

emcmake cmake -S "$project_dir" -B "$build_dir" -G Ninja -DCMAKE_BUILD_TYPE=Release "$@"
cmake --build "$build_dir" --parallel

cmake -E remove_directory "$dist_dir"
cmake -E make_directory "$dist_dir"

shopt -s nullglob
artifacts=("$build_dir"/bin/index.*)
if (( ${#artifacts[@]} == 0 )); then
  echo "Web build failed: no index.* artifacts were generated in $build_dir/bin"
  exit 1
fi
for artifact in "${artifacts[@]}"; do
  cmake -E copy_if_different "$artifact" "$dist_dir/"
done
touch "$dist_dir/.nojekyll"

echo "GitHub Pages output ready: $dist_dir"
echo "Local preview: ./web/run_web.sh"
