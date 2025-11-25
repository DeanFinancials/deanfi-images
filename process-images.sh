#!/bin/bash
# Image Processing Script for Default Images
# Converts AI-generated images to proper format and dimensions

set -e  # Exit on error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RAW_DIR="$SCRIPT_DIR/raw"
DEFAULTS_DIR="$SCRIPT_DIR/defaults"

echo "🖼️  Processing AI-generated images..."
echo ""

# Function to process an image
process_image() {
    local input="$1"
    local output_name="$2"
    local output_path="$DEFAULTS_DIR/$output_name"
    
    echo "📤 Processing: $(basename "$input")"
    echo "   Output: $output_name"
    
    # Resize to 1600x900, crop to center, optimize, strip metadata, convert to sRGB
    convert "$input" \
        -resize 1600x900^ \
        -gravity center \
        -extent 1600x900 \
        -quality 85 \
        -strip \
        -colorspace sRGB \
        "$output_path"
    
    # Get file size and dimensions for verification
    local size=$(identify -format "%b" "$output_path")
    local dims=$(identify -format "%wx%h" "$output_path")
    
    echo "   ✅ Created: $dims pixels, $size"
    echo ""
}

# Process each image
process_image "$RAW_DIR/Market.png" "market-analysis-default.jpg"
process_image "$RAW_DIR/Retirement.png" "retirement-planning-default.jpg"
process_image "$RAW_DIR/Debt.png" "debt-management-default.jpg"
process_image "$RAW_DIR/FinancialTips.png" "financial-tips-default.jpg"

echo "🎉 All images processed successfully!"
echo ""
echo "📊 Summary:"
ls -lh "$DEFAULTS_DIR"/*.jpg | awk '{printf "   %s - %s\n", $9, $5}'
echo ""
echo "✅ Images are ready in the defaults/ directory"
echo "💡 Next step: git add defaults/ && git commit -m 'Add default category images'"
