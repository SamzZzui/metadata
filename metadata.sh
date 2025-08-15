#!/bin/bash
# 📸 Termux Image Metadata Tool - v2 (File + Folder Mode)

clear
echo "=============================================="
echo "   📸 Termux Image Metadata Tool - v2"
echo "=============================================="
echo

# Check dependencies
command -v exiftool >/dev/null 2>&1 || { echo "❌ exiftool missing! Install: pkg install exiftool"; exit 1; }
command -v termux-open-url >/dev/null 2>&1 || echo "⚠️ termux-api missing! Install: pkg install termux-api"

# Function: get file or folder
get_target_path() {
    echo -n "📂 Enter file or folder path: "
    read target
    if [ -z "$target" ]; then
        echo "❌ No path entered!"
        return 1
    elif [ ! -e "$target" ]; then
        echo "❌ Path not found: $target"
        return 1
    fi
    return 0
}

# Function: process folder
process_folder() {
    for img in "$1"/*.{jpg,jpeg,png,JPG,JPEG,PNG}; do
        [ -f "$img" ] || continue
        echo "🔍 Processing: $img"
        exiftool "$img" | grep -iE "$2"
    done
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
        1) get_target_path && { [ -d "$target" ] && process_folder "$target" "File Name|File Size|File Type|Create Date|Modify Date" || exiftool "$target" | grep -iE "File Name|File Size|File Type|Create Date|Modify Date"; };;
        2) get_target_path && { [ -d "$target" ] && process_folder "$target" "Camera Model|Make|Model|Lens" || exiftool "$target" | grep -iE "Camera Model|Make|Model|Lens"; };;
        3) get_target_path && { [ -d "$target" ] && process_folder "$target" "GPS Latitude|GPS Longitude" || exiftool "$target" | grep -iE "GPS Latitude|GPS Longitude"; };;
        4) get_target_path && { [ -d "$target" ] && process_folder "$target" "Create Date|Modify Date|Date/Time Original" || exiftool "$target" | grep -iE "Create Date|Modify Date|Date/Time Original"; };;
        5) get_target_path && { [ -d "$target" ] && process_folder "$target" "Software" || exiftool "$target" | grep -iE "Software"; };;
        6) get_target_path && { [ -d "$target" ] && process_folder "$target" "." || exiftool "$target"; };;
        7) get_target_path && { [ -d "$target" ] && find "$target" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec exiftool -all= {} \; || exiftool -all= "$target"; echo "✅ Metadata removed!"; };;
        8) get_target_path && { [ -d "$target" ] && process_folder "$target" "." > metadata.txt || exiftool "$target" > metadata.txt; echo "✅ Saved to metadata.txt"; };;
        9) get_target_path && { [ -d "$target" ] && process_folder "$target" "Software|Processing" || exiftool "$target" | grep -iE "Software|Processing"; };;
        10) get_target_path && { [ -d "$target" ] && for img in "$target"/*.{jpg,jpeg,JPG,JPEG}; do [ -f "$img" ] && exiftool -b -ThumbnailImage "$img" > "${img%.*}_thumbnail.jpg"; done || exiftool -b -ThumbnailImage "$target" > thumbnail.jpg; echo "✅ Thumbnails extracted"; };;
        11) get_target_path && { [ -d "$target" ] && process_folder "$target" "Orientation" || exiftool "$target" | grep -iE "Orientation"; };;
        12) get_target_path && { [ -d "$target" ] && process_folder "$target" "Flash" || exiftool "$target" | grep -iE "Flash"; };;
        13) get_target_path && { [ -d "$target" ] && process_folder "$target" "Lens" || exiftool "$target" | grep -iE "Lens"; };;
        14) echo "🌐 Opening search engines..."
            termux-open-url "https://lens.google.com/uploadbyurl"
            termux-open-url "https://tineye.com"
            termux-open-url "https://yandex.com/images/search";;
        15) get_target_path && { [ -d "$target" ] && process_folder "$target" "Color Space" || exiftool "$target" | grep -iE "Color Space"; };;
        16) get_target_path && { [ -d "$target" ] && process_folder "$target" "Exposure" || exiftool "$target" | grep -iE "Exposure"; };;
        17) echo "👋 Exiting..."; exit 0;;
        *) echo "❌ Invalid option";;
    esac
done