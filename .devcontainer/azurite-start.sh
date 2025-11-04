
#!/usr/bin/env bash
# Start Azurite in the background (if not already running) and persist data to ./azurite/data
# This script is intended to be run inside the devcontainer (postCreateCommand) or manually from the repo root.

set -euo pipefail

# Resolve repository root reliably (script is in .devcontainer/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Persist azurite data under the repository at ./azurite/data (as requested)
AZ_DIR="$REPO_ROOT/azurite/data"
LOGFILE="$REPO_ROOT/azurite/azurite.out.log"

mkdir -p "$AZ_DIR"
chown -R vscode:vscode "$REPO_ROOT/azurite" || true

if command -v azurite >/dev/null 2>&1; then
  if pgrep -f "azurite" >/dev/null 2>&1; then
    echo "Azurite already running"
  else
    echo "Starting Azurite (blob/queue) -> logs: $LOGFILE, data: $AZ_DIR"
    # Start azurite in background and detach so the postCreateCommand can finish
    nohup azurite --silent --location "$AZ_DIR" --debug "$REPO_ROOT/azurite/debug.log" > "$LOGFILE" 2>&1 &
    sleep 1
    echo "Azurite started"
  fi
else
  echo "azurite not found in PATH. If the container image build succeeded it should be available."
  exit 0
fi
