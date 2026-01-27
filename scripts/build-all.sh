#!/bin/bash
# Build all formats of Mastering EVM (2025 Edition)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=========================================="
echo "Building Mastering EVM (2025 Edition)"
echo "All Formats"
echo "=========================================="
echo ""

# Build PDF
echo "--- Building PDF ---"
"$SCRIPT_DIR/build-pdf.sh"
echo ""

# Build EPUB
echo "--- Building EPUB ---"
"$SCRIPT_DIR/build-epub.sh"
echo ""

# Build Kindle
echo "--- Building Kindle ---"
"$SCRIPT_DIR/build-kindle.sh"
echo ""

echo "=========================================="
echo "Build Complete!"
echo "=========================================="
echo ""
echo "Output files:"
ls -la "$(dirname "$SCRIPT_DIR")/dist/"
