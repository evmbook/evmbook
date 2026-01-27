#!/bin/bash
# Build Kindle version of Mastering EVM (2025 Edition)
# Requires: pandoc, kindlegen (or Kindle Previewer for KPF)
# Note: Amazon prefers uploading EPUB directly to KDP which auto-converts

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$ROOT_DIR/dist"

# First build EPUB
"$SCRIPT_DIR/build-epub.sh"

echo "Building Kindle version..."

# Check if kindlegen is available
if command -v kindlegen &> /dev/null; then
    kindlegen "$OUTPUT_DIR/mastering-evm-2025.epub" -o mastering-evm-2025.mobi
    echo "Kindle MOBI built successfully: $OUTPUT_DIR/mastering-evm-2025.mobi"
else
    echo "kindlegen not found."
    echo "Options:"
    echo "  1. Upload EPUB directly to KDP (recommended)"
    echo "  2. Install Kindle Previewer and use it to convert EPUB to KPF"
    echo "  3. Install kindlegen (deprecated but still works)"
    echo ""
    echo "EPUB is available at: $OUTPUT_DIR/mastering-evm-2025.epub"
fi
