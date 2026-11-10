#!/usr/bin/env bash
# Builds dist/vietnam-opportunities.zip with plugin.json at the archive root,
# the layout ChatGPT's "Upload plugin archive" expects.
set -euo pipefail
cd "$(dirname "$0")/.."
python3 -m json.tool plugin/plugin.json >/dev/null
python3 -m json.tool plugin/mcp.json >/dev/null
rm -f dist/vietnam-opportunities.zip
(cd plugin && zip -qrX ../dist/vietnam-opportunities.zip . -x '.*' -x '*/.*')
unzip -l dist/vietnam-opportunities.zip
