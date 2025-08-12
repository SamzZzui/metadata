#!/bin/bash
# Termux Polished v2 - Image Metadata Tool

# Banner
clear
echo "=============================================="
echo "   📸 Termux Image Metadata Tool - v2"
echo "=============================================="
echo

# Dependencies check
command -v exiftool >/dev/null 2>&1 || { echo "❌ exiftool missing! Install: pkg install exiftool"; exit 1; }
command -v termux-open-url >/dev/null 2>&1 || echo "⚠️ termux-api missing! Install: pkg install termux-api"

# Function to prompt for image file
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
    echo "1. Basic File Info"
    echo "2. Camera Info"
    echo "3. GPS Location"
    echo "4. Date & Time"
    echo "5. Software Info"
    echo "6. All Metadata"
    echo "7. Remove Metadata"
    echo "8. Export Metadata to text file"
    echo "9. Check for Editing Software"
    echo "10. Extract Thumbnail"
    echo "11. Orientation Info"
    echo "12. Flash Info"
    echo "13. Lens Info"
    echo "14. Search Image Origin (Google Lens / TinEye / Yandex)"
    echo "15. Color Space Info"
    echo "16. Exposure Info"
    echo "17. Exit"
    echo "========================"
    echo -n "Select option: "
    read choice

    case $choice in
        1) get_image_file && exiftool "$image_file" | grep -iE "File Name|File Size|File Type|Create Date|Modify Date";;
        2) get_image_file && exiftool "$image_file" | grep -iE "Camera Model|Make|Model|Lens";;
        3) get_image_file && exiftool "$image_file" | grep -iE "GPS Latitude|GPS Longitude";;
        4) get_image_file && exiftool "$image_file" | grep -iE "Create Date|Modify Date|Date/Time Original";;
        5) get_image_file && exiftool "$image_file" | grep -iE "Software";;
        6) get_image_file && exiftool "$image_file";;
        7) get_image_file && exiftool -all= "$image_file" && echo "✅ Metadata removed!";;
        8) get_image_file && exiftool "$image_file" > metadata.txt && echo "✅ Saved to metadata.txt";;
        9) get_image_file && exiftool "$image_file" | grep -iE "Software|Processing";;
        10) get_image_file && exiftool -b -ThumbnailImage "$image_file" > thumbnail.jpg && echo "✅ Thumbnail saved as thumbnail.jpg";;
        11) get_image_file && exiftool "$image_file" | grep -iE "Orientation";;
        12) get_image_file && exiftool "$image_file" | grep -iE "Flash";;
        13) get_image_file && exiftool "$image_file" | grep -iE "Lens";;
        14) echo "🌐 Opening search engines..."
            termux-open-url "https://lens.google.com/uploadbyurl"
            termux-open-url "https://tineye.com"
            termux-open-url "https://yandex.com/images/search";;
        15) get_image_file && exiftool "$image_file" | grep -iE "Color Space";;
        16) get_image_file && exiftool "$image_file" | grep -iE "Exposure";;
        17) echo "👋 Exiting..."; exit 0;;
        *) echo "❌ Invalid option";;
    esac
done
