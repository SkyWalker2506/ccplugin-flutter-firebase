#!/usr/bin/env bash
set -euo pipefail

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_SRC="$PLUGIN_DIR/skills/flutter-firebase"
SKILL_DEST="${HOME}/.claude/skills/flutter-firebase"
MCP_TEMPLATE="$PLUGIN_DIR/.mcp.json.template"

echo "=== ccplugin-flutter-firebase installer ==="
echo ""

# Check $HOME guard
if [[ -z "${HOME:-}" ]]; then
  echo "ERROR: \$HOME is not set. Aborting." >&2
  exit 1
fi

# Dependency checks
echo "Checking dependencies..."

MISSING_DEPS=()

if ! command -v flutter &>/dev/null; then
  MISSING_DEPS+=("flutter (install: https://docs.flutter.dev/get-started/install)")
fi

if ! command -v firebase &>/dev/null; then
  MISSING_DEPS+=("firebase-tools (install: npm install -g firebase-tools)")
fi

if ! command -v dart &>/dev/null; then
  MISSING_DEPS+=("dart SDK (comes with Flutter)")
fi

if [[ ${#MISSING_DEPS[@]} -gt 0 ]]; then
  echo ""
  echo "WARNING: The following dependencies are missing:"
  for dep in "${MISSING_DEPS[@]}"; do
    echo "  - $dep"
  done
  echo ""
  echo "The plugin will be installed, but MCP tools may not work until dependencies are installed."
  echo ""
fi

# Install SKILL.md
echo "Installing skill..."
mkdir -p "$SKILL_DEST"

# Backup if exists
if [[ -d "$SKILL_DEST" ]] && [[ -f "$SKILL_DEST/SKILL.md" ]]; then
  BACKUP_PATH="${SKILL_DEST}.backup.$(date +%Y%m%d_%H%M%S)"
  echo "  Existing skill found — backing up to $BACKUP_PATH"
  cp -r "$SKILL_DEST" "$BACKUP_PATH"
fi

cp -r "$SKILL_SRC/." "$SKILL_DEST/"
echo "  Skill installed to: $SKILL_DEST"

# Copy .mcp.json.template if user doesn't have .mcp.json configured
if [[ -f "$PLUGIN_DIR/.mcp.json" ]]; then
  MCP_SERVICE_KEY=$(python3 -c "import json,sys; d=json.load(open('$PLUGIN_DIR/.mcp.json')); print(d.get('mcpServers',{}).get('firebase',{}).get('env',{}).get('SERVICE_ACCOUNT_KEY_PATH',''))" 2>/dev/null || echo "")
  if [[ -z "$MCP_SERVICE_KEY" ]]; then
    echo ""
    echo "ACTION REQUIRED: Configure Firebase MCP in .mcp.json"
    echo "  Template: $MCP_TEMPLATE"
    echo "  Copy and fill in:"
    echo "    SERVICE_ACCOUNT_KEY_PATH: path to your Firebase service account JSON"
    echo "    FIREBASE_PROJECT_ID: your Firebase project ID"
  fi
fi

echo ""
echo "=== Installation complete ==="
echo ""
echo "Next steps:"
echo "  1. Run /flutter-setup to verify your environment"
echo "  2. Configure .mcp.json with your Firebase credentials (see .mcp.json.template)"
echo "  3. Run 'flutterfire configure' in your Flutter project"
echo ""
echo "Skill active in Claude Code: /flutter-firebase"
