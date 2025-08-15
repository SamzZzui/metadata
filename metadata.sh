#!/bin/bash
# Termux Polished v3 - Image Metadata Tool

# Banner
clear
echo "=============================================="
echo "   📸 Termux Image Metadata Tool - v3"
echo "=============================================="
echo

# Dependencies check
command -v exiftool >/dev/null 2>&1 || { echo "❌ exiftool missing! Install: pkg install exiftool"; exit 1; }
command -v termux-open-url >/dev/null 2>&1 || echo "⚠️ termux-api missing! Install: pkg install termux-api"

SAMPLE_DIR="sample_images"

# Function to pick image from sample_images folder
pick_from_sample() {
    if [ ! -d "$SAMPLE_DIR" ]; then
        echo "❌ '$SAMPLE_DIR' folder not found!"
        return 1
    fi

    echo "📂 Available images in '$SAMPLE_DIR':"
    files=("$SAMPLE_DIR"/*)
    if [ ${#files[@]} -eq 0 ]; then
        echo "❌ No images found in '$SAMPLE_DIR'"
        return 1
    fi

    select img in "${files[@]}"; do
        if [ -n "$img" ]; then
            image_file="$img"
            return 0
        else
            echo "❌ Invalid selection!"
        fi
    done
}

# Function to prompt for image file manually
get_image_file() {
    echo -n "📂 Enter image file path: "
    read image_file
    if [ -z "$image_file" ]; then
        echo "❌ No file entered!"
        return 1
    elif [ ! -f "$image_file" ]; then
        echo "❌ File not found: $image_file"
        return 1
    fi
    return 0
}

# Menu loop
while true; do
    echo
    echo "========= MENU ========="
    echo "1. 🔎 Pick from 'sample_images' (quick)"
    echo "2. 📂 Enter image path (manual)"
    echo "3. Basic File Info"
    echo "4. Camera Info"
    echo "5. GPS Location"
    echo "6. Date & Time"
    echo "7. Software Info"
    echo "8. All Metadata"
    echo "9. Remove Metadata"
    echo "10. Export Metadata to text file"
    echo "11. Check for Editing Software"
    echo "12. Extract Thumbnail"
    echo "13. Orientation Info"
    echo "14. Flash Info"
    echo "15. Lens Info"
    echo "16. Search Image Origin (Google Lens / TinEye / Yandex)"
    echo "17. Color Space Info"
    echo "18. Exposure Info"
    echo "19. Exit"
    echo "========================"
    echo -n "Select option: "
    read choice

    case $choice in
        1) pick_from_sample ;;
        2) get_image_file ;;
        3) [ -n "$image_file" ] && exiftool "$image_file" | grep -iE "File Name|File Size|File Type|Create Date|Modify Date" ;;
        4) [ -n "$image_file" ] && exiftool "$image_file" | grep -iE "Camera Model|Make|Model|Lens" ;;
        5) [ -n "$image_file" ] && exiftool "$image_file" | grep -iE "GPS Latitude|GPS Longitude" ;;
        6) [ -n "$image_file" ] && exiftool "$image_file" | grep -iE "Create Date|Modify Date|Date/Time Original" ;;
        7) [ -n "$image_file" ] && exiftool "$image_file" | grep -iE "Software" ;;
        8) [ -n "$image_file" ] && exiftool "$image_file" ;;
        9) [ -n "$image_file" ] && exiftool -all= "$image_file" && echo "✅ Metadata removed!" ;;
        10) [ -n "$image_file" ] && exiftool "$image_file" > metadata.txt && echo "✅ Saved to metadata.txt" ;;
        11) [ -n "$image_file" ] && exiftool "$image_file" | grep -iE "Software|Processing" ;;
        12) [ -n "$image_file" ] && exiftool -b -ThumbnailImage "$image_file" > thumbnail.jpg && echo "✅ Thumbnail saved as thumbnail.jpg" ;;
        13) [ -n "$image_file" ] && exiftool "$image_file" | grep -iE "Orientation" ;;
        14) [ -n "$image_file" ] && exiftool "$image_file" | grep -iE "Flash" ;;
        15) [ -n "$image_file" ] && exiftool "$image_file" | grep -iE "Lens" ;;
        16) echo "🌐 Opening search engines..."
            termux-open-url "https://lens.google.com/uploadbyurl"
            termux-open-url "https://tineye.com"
            termux-open-url "https://yandex.com/images/search" ;;
        17) [ -n "$image_file" ] && exiftool "$image_file" | grep -iE "Color Space" ;;
        18) [ -n "$image_file" ] && exiftool "$image_file" | grep -iE "Exposure" ;;
        19) echo "👋 Exiting..."; exit 0 ;;
        *) echo "❌ Invalid option";;
    esac
done