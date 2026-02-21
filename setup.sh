#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
QMK_HOME="$HOME/qmk_firmware"

echo "=== QMK Keyboard Firmware Setup ==="

# 1. Check/install QMK CLI
if ! command -v qmk &>/dev/null; then
    echo "QMK CLI not found. Installing via Homebrew..."
    brew install qmk/qmk/qmk
else
    echo "QMK CLI found: $(qmk --version)"
fi

# 2. Setup QMK firmware (clones qmk_firmware repo)
echo ""
echo "Running qmk setup..."
qmk setup -y

# 3. Set this repo as overlay directory
echo ""
echo "Setting overlay directory to: $SCRIPT_DIR"
qmk config user.overlay_dir="$SCRIPT_DIR"

# 4. Symlink custom keyboard definitions into qmk_firmware
# (External Userspace overlays keymaps but not keyboard definitions)
echo ""
echo "Symlinking custom keyboard definitions..."

# lily58/zl58 — custom keyboard (not in upstream QMK)
ln -sfn "$SCRIPT_DIR/keyboards/lily58/zl58" "$QMK_HOME/keyboards/lily58/zl58"
echo "  Linked lily58/zl58"

# lily58 zl58 keymap
ln -sfn "$SCRIPT_DIR/keyboards/lily58/keymaps/zl58" "$QMK_HOME/keyboards/lily58/keymaps/zl58"
echo "  Linked lily58/keymaps/zl58"

# 5. Verify setup
echo ""
echo "Running userspace doctor..."
qmk userspace-doctor

echo ""
echo "Setup complete! You can now run:"
echo "  qmk userspace-compile              # compile all keyboards"
echo "  qmk flash -kb lily58/zl58 -km zl58 -c # compile + flash zL58"
