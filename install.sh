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

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
IS_CURL_MODE=false
SETTINGS_FILE="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/settings.json"

# Detect if running from curl (no local repo)
if [[ ! -d "$REPO_DIR/.claude-plugin" ]]; then
  REPO_DIR=$(mktemp -d)
  IS_CURL_MODE=true
  git clone --depth 1 https://github.com/3d-era/kalera-claude-code.git "$REPO_DIR"
fi

# ─── Helpers ────────────────────────────────────────────────────────
is_tty() { [[ -t 0 ]]; }

ask() {
  local prompt="$1"
  local choice
  if is_tty; then
    echo ""
    echo "$prompt"
    select choice in Auto-fix Skip; do
      [[ -n "$choice" ]] && echo "$choice" && return
    done
  else
    echo "Auto-fix"  # non-interactive: default to auto-fix
  fi
}

resolve() {
  local action="$1"
  case "$action" in
    "Auto-fix") return 0 ;;
    *)          return 1 ;;
  esac
}

# ─── Header ────────────────────────────────────────────────────────
echo ""
echo "🚀 Kalera Claude Code — Installer"
echo "=================================="
echo ""

# ─── Check Claude CLI ───────────────────────────────────────────────
if ! command -v claude &>/dev/null; then
  echo "❌ Claude Code CLI not found."
  echo "   Install from: https://claude.ai/code"
  [[ "$IS_CURL_MODE" == true ]] && rm -rf "$REPO_DIR"
  exit 1
fi

# ─── Detect existing installations ─────────────────────────────────
INSTALLED_PLUGINS=$(claude plugin list 2>/dev/null || echo "")
HAS_OLD_ECC=false
HAS_OLD_MUNIN=false
HAS_CONTEXT7=false
HAS_PLAYWRIGHT=false

ECC_OLD=$(echo "$INSTALLED_PLUGINS" | grep -iE "everything-claude-code.*affaan-m|@affaan-m/everything-claude-code|affaan-m/everything-claude-code" || true)
MUNIN_OLD=$(echo "$INSTALLED_PLUGINS" | grep -iE "munin-claude-code.*munin-ecosystem|@munin-ecosystem/munin-claude-code" || true)

[[ -n "$ECC_OLD" ]]    && HAS_OLD_ECC=true
[[ -n "$MUNIN_OLD" ]]  && HAS_OLD_MUNIN=true

if [[ -f "$SETTINGS_FILE" ]]; then
  grep -q "context7" "$SETTINGS_FILE" 2>/dev/null && HAS_CONTEXT7=true
  grep -q '"playwright"' "$SETTINGS_FILE" 2>/dev/null && HAS_PLAYWRIGHT=true
fi

# ─── Handle ECC conflict ───────────────────────────────────────────
if [[ "$HAS_OLD_ECC" == true ]]; then
  echo "⚠️  CONFLICT: Everything Claude Code detected from upstream"
  echo "   Source: affaan-m/everything-claude-code"
  echo "   → kalera-claude-code is a fork that replaces this."
  echo ""
  _choice=$(ask "  [1] Auto-fix  [2] Skip (keep old)")
  if resolve "$_choice"; then
    echo "   → Uninstalling old version..."
    claude plugin uninstall everything-claude-code@affaan-m/everything-claude-code 2>/dev/null ||
    claude plugin uninstall everything-claude-code 2>/dev/null || true
    echo "   ✅ Old ECC removed."
  else
    echo "   ⏭  Skipped — old ECC kept."
  fi
  echo ""
fi

# ─── Handle Munin conflict ─────────────────────────────────────────
if [[ "$HAS_OLD_MUNIN" == true ]]; then
  echo "⚠️  CONFLICT: Munin detected from old source"
  echo "   Source: munin-ecosystem (3d-era/munin-for-agents)"
  echo "   → kalera-claude-code includes the latest Munin plugin."
  echo ""
  _choice=$(ask "  [1] Auto-fix  [2] Skip (keep old)")
  if resolve "$_choice"; then
    echo "   → Uninstalling old version..."
    claude plugin uninstall munin-claude-code@munin-ecosystem 2>/dev/null ||
    claude plugin uninstall munin-claude-code 2>/dev/null || true
    echo "   ✅ Old Munin removed."
  else
    echo "   ⏭  Skipped — old Munin kept."
  fi
  echo ""
fi

# ─── Handle Context7 MCP ───────────────────────────────────────────
if [[ "$HAS_CONTEXT7" == true ]]; then
  echo "⚠️  NOTE: Context7 MCP found in settings.json"
  echo "   → kalera-claude-code removes its own copy (you already have it)."
  echo ""
  _choice=$(ask "  [1] Auto-fix (remove from kalera-claude-code)  [2] Skip")
  if resolve "$_choice"; then
    # Remove context7 entries from mcp-configs/mcp-servers.json
    if [[ -f "$REPO_DIR/mcp-configs/mcp-servers.json" ]]; then
      if grep -q '"context7"' "$REPO_DIR/mcp-configs/mcp-servers.json"; then
        echo "   ✅ Will skip context7 in kalera-claude-code MCP configs."
      fi
    fi
    echo "   ⏭  Context7 in settings.json untouched."
  else
    echo "   ⏭  Skipped."
  fi
  echo ""
fi

# ─── Handle Playwright MCP ─────────────────────────────────────────
if [[ "$HAS_PLAYWRIGHT" == true ]]; then
  echo "⚠️  NOTE: Playwright MCP found in settings.json"
  echo "   → kalera-claude-code removes its own copy (you already have it)."
  echo ""
  _choice=$(ask "  [1] Auto-fix (remove from kalera-claude-code)  [2] Skip")
  if resolve "$_choice"; then
    echo "   ✅ Will skip Playwright in kalera-claude-code MCP configs."
  else
    echo "   ⏭  Skipped."
  fi
  echo ""
fi

echo "✅ Conflict check complete."
echo ""

# ─── Add marketplace ───────────────────────────────────────────────
echo "📦 Adding Kalera marketplace..."
claude plugin marketplace add kalera-cc 2>/dev/null || true

# ─── Install plugins ───────────────────────────────────────────────
echo "⚙️  Installing everything-claude-code..."
if claude plugin install everything-claude-code@kalera-cc 2>/dev/null; then
  echo "   ✅ everything-claude-code installed"
elif claude plugin install kalera-claude-code@kalera-cc 2>/dev/null; then
  echo "   ✅ kalera-claude-code installed"
else
  echo "   ⚠️  Already installed — check with: claude plugin list"
fi

echo "🧠 Installing Munin memory plugin..."
if claude plugin install munin-claude-code@kalera-cc 2>/dev/null; then
  echo "   ✅ munin-claude-code installed"
else
  echo "   ⚠️  Already installed — check with: claude plugin list"
fi

# ─── Install rules ────────────────────────────────────────────────
echo ""
echo "📋 Installing rules..."
if [[ -d "$REPO_DIR/rules" ]]; then
  mkdir -p ~/.claude/rules

  if [[ -d "$REPO_DIR/rules/common" ]]; then
    cp -rf "$REPO_DIR/rules/common"/* ~/.claude/rules/
    echo "   ✅ rules/common/"
  fi

  for lang in typescript python golang java kotlin cpp rust swift php dart; do
    if [[ -d "$REPO_DIR/rules/$lang" ]]; then
      mkdir -p ~/.claude/rules/$lang
      cp -rf "$REPO_DIR/rules/$lang"/* ~/.claude/rules/$lang/ 2>/dev/null
      echo "   ✅ rules/$lang/"
    fi
  done
fi

# ─── Cleanup ───────────────────────────────────────────────────────
[[ "$IS_CURL_MODE" == true ]] && rm -rf "$REPO_DIR"

# ─── Done ──────────────────────────────────────────────────────────
echo ""
echo "✅ Kalera Claude Code installed!"
echo ""
echo "Next steps:"
echo "  1. Restart Claude Code"
echo "  2. Sign up at https://munin.kalera.app (free)"
echo "  3. Run: /munin-projectid"
echo "     → It will show current ID or prompt you to set it"
echo ""
echo "Docs: https://github.com/3d-era/kalera-claude-code"
