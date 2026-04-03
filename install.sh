#!/usr/bin/env bash
# Kalera Claude Code — One-Command Installer
# Installs everything-claude-code + Munin memory system into Claude Code
#
# Usage:
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/3d-era/kalera-claude-code/main/install.sh)"
#
# Or clone first:
#   git clone https://github.com/3d-era/kalera-claude-code.git
#   cd kalera-claude-code && ./install.sh

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
IS_CURL_MODE=false

# Detect if running from curl (no local repo)
if [[ ! -d "$REPO_DIR/.claude-plugin" ]]; then
  echo "📦 Cloning Kalera Claude Code..."
  REPO_DIR=$(mktemp -d)
  IS_CURL_MODE=true
  git clone --depth 1 https://github.com/3d-era/kalera-claude-code.git "$REPO_DIR"
fi

echo ""
echo "🚀 Kalera Claude Code — Installer"
echo "=================================="
echo ""

# Check claude CLI
if ! command -v claude &>/dev/null; then
  echo "❌ Claude Code CLI not found."
  echo "   Install from: https://claude.ai/code"
  [[ "$IS_CURL_MODE" == true ]] && rm -rf "$REPO_DIR"
  exit 1
fi

# Add marketplace
echo "📦 Adding Kalera marketplace..."
claude plugin marketplace add kalera-cc 2>/dev/null || true

# Install main plugin
echo "⚙️  Installing everything-claude-code..."
claude plugin install everything-claude-code@kalera-cc 2>/dev/null || \
  claude plugin install kalera-claude-code@kalera-cc 2>/dev/null || \
  echo "   (main plugin install skipped — may already be installed)"

# Install Munin memory plugin
echo "🧠 Installing Munin memory plugin..."
claude plugin install munin-claude-code@kalera-cc 2>/dev/null || \
  echo "   (Munin plugin install skipped — may already be installed)"

# Install rules
echo ""
echo "📋 Installing rules (plugin limitation — must be manual)..."
if [[ -d "$REPO_DIR/rules" ]]; then
  mkdir -p ~/.claude/rules
  cp -r "$REPO_DIR/rules/common" ~/.claude/rules/
  echo "   ✅ Copied rules/common/"
  # Copy language rules if they exist
  for lang in typescript python golang java kotlin cpp rust swift php dart; do
    if [[ -d "$REPO_DIR/rules/$lang" ]]; then
      cp -r "$REPO_DIR/rules/$lang" ~/.claude/rules/ 2>/dev/null && echo "   ✅ Copied rules/$lang/"
    fi
  done
fi

[[ "$IS_CURL_MODE" == true ]] && rm -rf "$REPO_DIR"

echo ""
echo "✅ Kalera Claude Code installed!"
echo ""
echo "Next steps:"
echo "  1. Restart Claude Code"
echo "  2. Sign up at https://munin.kalera.app (free)"
echo "  3. Create a project, add MUNIN_PROJECT to your .env"
echo ""
echo "Docs: https://github.com/3d-era/kalera-claude-code"
