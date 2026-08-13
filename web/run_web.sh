#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd "$script_dir/.." && pwd)"
dist_dir="$project_dir/dist"

if [[ ! -f "$dist_dir/index.html" ]]; then
  echo "No web build found. Run ./web/build_web.sh first."
  exit 1
fi

echo "AquaNexus is available at http://localhost:8080"
if command -v python3 >/dev/null 2>&1; then
  python3 -m http.server 8080 --directory "$dist_dir"
elif command -v python >/dev/null 2>&1; then
  python -m http.server 8080 --directory "$dist_dir"
else
  echo "Python is required for the local WebAssembly preview."
  exit 1
fi
