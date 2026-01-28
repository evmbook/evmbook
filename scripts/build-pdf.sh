#!/bin/bash
# Build PDF version of Mastering EVM (2025 Edition)
# Requires: pandoc, LaTeX (texlive-full recommended)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$ROOT_DIR/dist"
CONTENT_DIR="$ROOT_DIR/content"

# Create output directory
mkdir -p "$OUTPUT_DIR"

echo "Building Mastering EVM (2025 Edition) PDF..."

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

# Build PDF with pandoc
pandoc \
    --from=markdown \
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
    --variable mainfont="DejaVu Serif" \
    --variable sansfont="DejaVu Sans" \
    --variable monofont="DejaVu Sans Mono" \
    --metadata title="Mastering EVM (2025 Edition)" \
    --metadata author="B.L. Brocer" \
    --metadata date="January 2026" \
    --highlight-style=tango \
    --output="$OUTPUT_DIR/mastering-evm-2025.pdf" \
    $CHAPTERS $APPENDICES

echo "PDF built successfully: $OUTPUT_DIR/mastering-evm-2025.pdf"
