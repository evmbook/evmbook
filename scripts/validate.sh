#!/bin/bash
# Validate Mastering EVM (2025 Edition) content
# Checks for missing files, broken links, and content issues

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
CONTENT_DIR="$ROOT_DIR/content"

ERRORS=0
WARNINGS=0

echo "=========================================="
echo "Validating Mastering EVM (2025 Edition)"
echo "=========================================="
echo ""

# Check chapters exist (00-27)
echo "--- Checking Chapters ---"
for i in $(seq -w 0 27); do
    CHAPTER_FILE=$(find "$CONTENT_DIR/chapters" -name "${i}-*.mdx" 2>/dev/null | head -1)
    if [ -z "$CHAPTER_FILE" ]; then
        echo "ERROR: Missing chapter $i"
        ((ERRORS++))
    else
        echo "OK: Chapter $i - $(basename "$CHAPTER_FILE")"
    fi
done
echo ""

# Check appendices exist (a-h)
echo "--- Checking Appendices ---"
for letter in a b c d e f g h; do
    APPENDIX_FILE=$(find "$CONTENT_DIR/appendices" -name "${letter}-*.mdx" 2>/dev/null | head -1)
    if [ -z "$APPENDIX_FILE" ]; then
        echo "ERROR: Missing appendix $letter"
        ((ERRORS++))
    else
        echo "OK: Appendix $letter - $(basename "$APPENDIX_FILE")"
    fi
done
echo ""

# Check meta files
echo "--- Checking Meta Files ---"
for meta in "colophon.mdx" "about.mdx"; do
    if [ -f "$CONTENT_DIR/meta/$meta" ]; then
        echo "OK: $meta"
    else
        echo "WARNING: Missing $meta"
        ((WARNINGS++))
    fi
done
echo ""

# Check for broken internal links (basic check)
echo "--- Checking Internal Links ---"
# Look for references to chapters that don't exist
LINK_ISSUES=$(grep -roh "Chapter [0-9]\+" "$CONTENT_DIR" 2>/dev/null | sort -u | while read -r line; do
    NUM=$(echo "$line" | grep -oE '[0-9]+')
    if [ "$NUM" -gt 27 ]; then
        echo "WARNING: Reference to $line (max is 27)"
    fi
done)
if [ -n "$LINK_ISSUES" ]; then
    echo "$LINK_ISSUES"
    ((WARNINGS++))
else
    echo "OK: No obvious chapter reference issues"
fi
echo ""

# Check frontmatter
echo "--- Checking Frontmatter ---"
for file in "$CONTENT_DIR/chapters"/*.mdx; do
    if ! head -1 "$file" | grep -q "^---$"; then
        echo "WARNING: Missing frontmatter in $(basename "$file")"
        ((WARNINGS++))
    fi
done
echo "OK: Frontmatter check complete"
echo ""

# Summary
echo "=========================================="
echo "Validation Summary"
echo "=========================================="
echo "Errors:   $ERRORS"
echo "Warnings: $WARNINGS"
echo ""

if [ $ERRORS -gt 0 ]; then
    echo "FAILED: Please fix errors before building"
    exit 1
else
    echo "PASSED: Content is ready for building"
    exit 0
fi
