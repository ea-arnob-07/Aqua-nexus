#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -f "$script_dir/web/build_web.sh" ]]; then
  project_dir="$script_dir"
elif [[ -f "$script_dir/aquanexus/web/build_web.sh" ]]; then
  project_dir="$script_dir/aquanexus"
else
  echo "Could not find the AquaNexus project."
  echo "Place this script either inside the project root or next to the aquanexus folder."
  exit 1
fi

if ! command -v emcmake >/dev/null 2>&1 || ! command -v emcc >/dev/null 2>&1; then
  echo "Emscripten is not active. Activate emsdk first, then run this script again."
  exit 1
fi

chmod +x "$project_dir/web/build_web.sh" "$project_dir/web/run_web.sh"

cd "$project_dir"
./web/build_web.sh "$@"
./web/run_web.sh
