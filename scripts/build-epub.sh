#!/bin/bash
# Build EPUB version of Mastering EVM (2025 Edition)
# Requires: pandoc

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$ROOT_DIR/dist"
CONTENT_DIR="$ROOT_DIR/content"

# Create output directory
mkdir -p "$OUTPUT_DIR"

echo "Building Mastering EVM (2025 Edition) EPUB..."

# Collect all chapter files in order
CHAPTERS=""
for i in $(seq -w 0 27); do
    CHAPTER_FILE=$(find "$CONTENT_DIR/chapters" -name "${i}-*.mdx" 2>/dev/null | head -1)
    if [ -n "$CHAPTER_FILE" ]; then
        CHAPTERS="$CHAPTERS $CHAPTER_FILE"
    fi
done

# Collect all appendix files in order
APPENDICES=""
for letter in a b c d e f g h; do
    APPENDIX_FILE=$(find "$CONTENT_DIR/appendices" -name "${letter}-*.mdx" 2>/dev/null | head -1)
    if [ -n "$APPENDIX_FILE" ]; then
        APPENDICES="$APPENDICES $APPENDIX_FILE"
    fi
done

# Build EPUB with pandoc
pandoc \
    --from=markdown \
    --to=epub3 \
    --toc \
    --toc-depth=3 \
    --number-sections \
    --epub-chapter-level=1 \
    --metadata title="Mastering EVM (2025 Edition)" \
    --metadata subtitle="The Complete Guide to the Ethereum Virtual Machine" \
    --metadata author="C. M. Mercer" \
    --metadata date="January 2026" \
    --metadata lang="en-US" \
    --metadata rights="CC BY-NC 4.0" \
    --highlight-style=tango \
    --output="$OUTPUT_DIR/mastering-evm-2025.epub" \
    $CHAPTERS $APPENDICES

echo "EPUB built successfully: $OUTPUT_DIR/mastering-evm-2025.epub"
