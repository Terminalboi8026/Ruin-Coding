#!/usr/bin/env bash
# Simple VSIX packer without vsce. Requires `zip` and the `code` CLI to install.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
# Derive package name and version from package.json so VSIX filename matches updates
NAME=""
VERSION=""
if command -v node >/dev/null 2>&1; then
	NAME=$(node -p "require('./package.json').name") || NAME=""
	VERSION=$(node -p "require('./package.json').version") || VERSION=""
else
	# Fallback to grep/sed parsing if node is not available
	NAME=$(grep -oP '"name"\s*:\s*"\K[^"]+' package.json 2>/dev/null || true)
	VERSION=$(grep -oP '"version"\s*:\s*"\K[^"]+' package.json 2>/dev/null || true)
fi
if [ -z "$NAME" ]; then NAME="ruin-language"; fi
if [ -z "$VERSION" ]; then VERSION="unversioned"; fi
OUT="${ROOT_DIR}/${NAME}-${VERSION}.vsix"
cd "$ROOT_DIR"
rm -f "$OUT"
TMPDIR=$(mktemp -d)

cleanup() {
	rm -rf "$TMPDIR"
}
trap cleanup EXIT

echo "Packaging extension into VSIX..."
rm -f "$OUT"

# Copy files into temp/extension preserving structure
mkdir -p "$TMPDIR/extension"
# Use rsync if available for nicer exclusion handling, fall back to cp
if command -v rsync >/dev/null 2>&1; then
	rsync -a --exclude 'node_modules' --exclude '.git' --exclude '*.vsix' ./ "$TMPDIR/extension/"
else
	# copy everything, then remove patterns
	cp -a . "$TMPDIR/extension/"
	rm -rf "$TMPDIR/extension/node_modules" || true
	rm -rf "$TMPDIR/extension/.git" || true
	rm -f "$TMPDIR/extension"/*.vsix || true
fi

# Create the VSIX (zip with extension/ as top-level folder)
(cd "$TMPDIR" && zip -r "$OUT" extension) >/dev/null

if [ -f "$OUT" ]; then
	echo "Created $OUT"
	echo
	echo "To install (if you have the 'code' CLI):"
	echo "  code --install-extension $OUT"
	echo
	echo "Or open VS Code → Extensions → ⋯ → Install from VSIX... and pick $OUT"
else
	echo "Failed to create VSIX"
	exit 1
fi
