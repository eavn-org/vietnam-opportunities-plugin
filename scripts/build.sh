#!/usr/bin/env bash
# Builds one archive per plugin in dist/, with plugin.json at the archive root,
# the layout ChatGPT's "Upload plugin archive" expects.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
for dir in plugins/*/; do
  name="$(basename "$dir")"
  python3 -m json.tool "$dir/plugin.json" >/dev/null
  python3 -m json.tool "$dir/mcp.json" >/dev/null
  rm -f "dist/$name.zip"
  (cd "$dir" && zip -qrX "../../dist/$name.zip" . -x '.*' -x '*/.*')
  echo "built dist/$name.zip"
  unzip -l "dist/$name.zip" | tail -n +4 | head -n -2
done
