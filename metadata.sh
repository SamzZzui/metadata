#!/bin/bash
# Termux Polished v1 - Image Metadata Tool (Auto File/Folder Mode)

clear
echo "=============================================="
echo "   📸 Termux Image Metadata Tool - v1"
echo "=============================================="
echo

# Dependencies check
command -v exiftool >/dev/null 2>&1 || { echo "❌ exiftool missing! Install: pkg install exiftool"; exit 1; }
command -v termux-open-url >/dev/null 2>&1 || echo "⚠️ termux-api missing! Install: pkg install termux-api"

# Prompt file/folder mode
get_target() {
    echo -n "📌 Process Single File or Folder? (f/F): "
    read mode
    if [[ "$mode" =~ ^[Ff]$ ]]; then
        if [[ "$mode" == "f" ]]; then
            echo -n "📂 Enter image file path: "
            read image_file
            if [ -z "$image_file" ] || [ ! -f "$image_file" ]; then
                echo "❌ Invalid file!"
                return 1
            fi
            target_type="file"
        else
            echo -n "📂 Enter folder path: "
            read folder_path
            if [ -z "$folder_path" ] || [ ! -d "$folder_path" ]; then
                echo "❌ Invalid folder!"
                return 1
            fi
            target_type="folder"
        fi
    else
        echo "❌ Invalid choice!"
        return 1
    fi
    return 0
}

# Process folder images
process_folder() {
    local folder="$1"
    local pattern="$2"
    for img in "$folder"/*.{jpg,jpeg,png,JPG,JPEG,PNG}; do
        [ -f "$img" ] || continue
        echo "📄 $img"
        if [ -z "$pattern" ]; then
            exiftool "$img"
        else
            exiftool "$img" | grep -iE "$pattern"
        fi
        echo "---------------------------------"
    done
}

# Remove metadata from folder
remove_metadata_folder() {
    for img in "$1"/*.{jpg,jpeg,png,JPG,JPEG,PNG}; do
        [ -f "$img" ] || continue
        exiftool -all= "$img"
        echo "✅ Metadata removed from: $img"
    done
}

# Export metadata from folder
export_metadata_folder() {
    for img in "$1"/*.{jpg,jpeg,png,JPG,JPEG,PNG}; do
        [ -f "$img" ] || continue
        exiftool "$img" > "${img%.*}_metadata.txt"
        echo "✅ Saved: ${img%.*}_metadata.txt"
    done
}

# Menu loop
while true; do
    echo
    echo "========= MENU ========="
    echo " 1.  Basic File Info"
    echo " 2.  Camera Info"
    echo " 3.  GPS Location"
    echo " 4.  Date & Time"
    echo " 5.  Software Info"
    echo " 6.  All Metadata"
    echo " 7.  Remove Metadata"
    echo " 8.  Export Metadata to text file"
    echo " 9.  Check for Editing Software"
    echo "10.  Extract Thumbnail"
    echo "11.  Orientation Info"
    echo "12.  Flash Info"
    echo "13.  Lens Info"
    echo "14.  Search Image Origin (Google Lens / TinEye / Yandex)"
    echo "15.  Color Space Info"
    echo "16.  Exposure Info"
    echo "17.  Exit"
    echo "========================"
    echo -n "Select option: "
    read choice

    case $choice in
        1) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" | grep -iE "File Name|File Size|File Type|Create Date|Modify Date" || process_folder "$folder_path" "File Name|File Size|File Type|Create Date|Modify Date";;
        2) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" | grep -iE "Camera Model|Make|Model|Lens" || process_folder "$folder_path" "Camera Model|Make|Model|Lens";;
        3) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" | grep -iE "GPS Latitude|GPS Longitude" || process_folder "$folder_path" "GPS Latitude|GPS Longitude";;
        4) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" | grep -iE "Create Date|Modify Date|Date/Time Original" || process_folder "$folder_path" "Create Date|Modify Date|Date/Time Original";;
        5) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" | grep -iE "Software" || process_folder "$folder_path" "Software";;
        6) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" || process_folder "$folder_path" "";;
        7) get_target && [[ $target_type == "file" ]] && exiftool -all= "$image_file" && echo "✅ Metadata removed!" || remove_metadata_folder "$folder_path";;
        8) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" > metadata.txt && echo "✅ Saved to metadata.txt" || export_metadata_folder "$folder_path";;
        9) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" | grep -iE "Software|Processing" || process_folder "$folder_path" "Software|Processing";;
        10) get_target && [[ $target_type == "file" ]] && exiftool -b -ThumbnailImage "$image_file" > thumbnail.jpg && echo "✅ Thumbnail saved as thumbnail.jpg" || for img in "$folder_path"/*.{jpg,jpeg,png,JPG,JPEG,PNG}; do [ -f "$img" ] || continue; exiftool -b -ThumbnailImage "$img" > "${img%.*}_thumbnail.jpg"; echo "✅ Thumbnail saved: ${img%.*}_thumbnail.jpg"; done;;
        11) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" | grep -iE "Orientation" || process_folder "$folder_path" "Orientation";;
        12) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" | grep -iE "Flash" || process_folder "$folder_path" "Flash";;
        13) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" | grep -iE "Lens" || process_folder "$folder_path" "Lens";;
        14) echo "🌐 Opening search engines..."
            termux-open-url "https://lens.google.com/uploadbyurl"
            termux-open-url "https://tineye.com"
            termux-open-url "https://yandex.com/images/search";;
        15) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" | grep -iE "Color Space" || process_folder "$folder_path" "Color Space";;
        16) get_target && [[ $target_type == "file" ]] && exiftool "$image_file" | grep -iE "Exposure" || process_folder "$folder_path" "Exposure";;
        17) echo "👋 Exiting..."; exit 0;;
        *) echo "❌ Invalid option";;
    esac
done