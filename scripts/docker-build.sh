#!/bin/bash
# Docker-based build for Mastering EVM (2025 Edition)
# Usage: ./scripts/docker-build.sh [pdf|epub|all]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$ROOT_DIR/dist"

BUILD_TYPE="${1:-pdf}"

# Create output directory
mkdir -p "$OUTPUT_DIR"

echo "Building Mastering EVM (2025 Edition) using Docker..."
echo "Build type: $BUILD_TYPE"

# Use pandoc/extra image which includes LaTeX
IMAGE="pandoc/extra:latest"

case "$BUILD_TYPE" in
    pdf)
        echo "Generating PDF..."
        docker run --rm -v "$ROOT_DIR:/book" -w /book -e LANG=C.UTF-8 "$IMAGE" \
            /bin/sh -c '
                cd /book
                FILES=""
                for i in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27; do
                    F=$(ls content/chapters/${i}-*.mdx 2>/dev/null | head -1)
                    [ -n "$F" ] && FILES="$FILES $F"
                done
                for letter in a b c d e f g h; do
                    F=$(ls content/appendices/${letter}-*.mdx 2>/dev/null | head -1)
                    [ -n "$F" ] && FILES="$FILES $F"
                done
                echo "Processing files: $FILES"
                pandoc \
                    --from=markdown+yaml_metadata_block+fenced_code_blocks+backtick_code_blocks \
                    --to=pdf \
                    --pdf-engine=xelatex \
                    --toc \
                    --toc-depth=3 \
                    --number-sections \
                    --top-level-division=chapter \
                    --variable documentclass=book \
                    --variable papersize=letter \
                    --variable fontsize=11pt \
                    --variable geometry:margin=1in \
                    --metadata title="Mastering EVM (2025 Edition)" \
                    --metadata author="C. M. Mercer" \
                    --metadata date="January 2026" \
                    --highlight-style=tango \
                    --output=dist/mastering-evm-2025.pdf \
                    $FILES
            '
        echo "PDF built: $OUTPUT_DIR/mastering-evm-2025.pdf"
        ;;
    epub)
        echo "Generating EPUB..."
        docker run --rm -v "$ROOT_DIR:/book" -w /book -e LANG=C.UTF-8 "$IMAGE" \
            /bin/sh -c '
                cd /book
                FILES=""
                for i in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27; do
                    F=$(ls content/chapters/${i}-*.mdx 2>/dev/null | head -1)
                    [ -n "$F" ] && FILES="$FILES $F"
                done
                for letter in a b c d e f g h; do
                    F=$(ls content/appendices/${letter}-*.mdx 2>/dev/null | head -1)
                    [ -n "$F" ] && FILES="$FILES $F"
                done
                echo "Processing files: $FILES"
                pandoc \
                    --from=markdown+yaml_metadata_block+fenced_code_blocks+backtick_code_blocks \
                    --to=epub3 \
                    --toc \
                    --toc-depth=3 \
                    --number-sections \
                    --metadata title="Mastering EVM (2025 Edition)" \
                    --metadata author="C. M. Mercer" \
                    --metadata date="January 2026" \
                    --highlight-style=tango \
                    --output=dist/mastering-evm-2025.epub \
                    $FILES
            '
        echo "EPUB built: $OUTPUT_DIR/mastering-evm-2025.epub"
        ;;
    all)
        "$0" pdf
        "$0" epub
        ;;
    *)
        echo "Usage: $0 [pdf|epub|all]"
        exit 1
        ;;
esac

echo "Build complete!"
