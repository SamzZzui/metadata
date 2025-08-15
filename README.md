# 📸 Termux Image Metadata Tool v3

A powerful **Bash-based image metadata extraction tool** designed for **Termux** users.  
Easily extract, view, and manage metadata from image files — including camera info, GPS location, exposure details, and more.  
Supports **metadata removal**, **thumbnail extraction**, and **reverse image search** via Google Lens, TinEye, and Yandex.

---

## 🚀 Features
✅ View **Basic File Info** (name, size, type, timestamps)  
✅ **Camera Details** (make, model, lens)  
✅ **GPS Coordinates** (latitude, longitude)  
✅ **Date & Time** info  
✅ **Software Used** for editing  
✅ **All Metadata Extraction**  
✅ **Remove All Metadata**  
✅ **Export Metadata** to `.txt` file  
✅ **Detect Editing Software**  
✅ **Extract Embedded Thumbnail**  
✅ **Orientation, Flash, Lens Info**  
✅ **Reverse Image Search** (Google Lens, TinEye, Yandex)  
✅ **Color Space & Exposure Details**  

---

# 🌐 Reverse Image Search

Option 14 allows you to open:

Google Lens

TinEye

Yandex Image Search


Note: This requires termux-api.

## 📦 Requirements

Make sure you have **Termux** installed and updated.

You will be presented with an interactive menu:

# ▶️ Usage

You will be presented with an interactive menu:

Run the script in Termux:


========= MENU =========

1. 🔎 Pick from 'sample_images' (quick)
2. 📂 Enter image path (manual)
3. Basic File Info
4. Camera Info
5. GPS Location
6. Date & Time
7. Software Info
8. All Metadata
9. Remove Metadata
10. Export Metadata to text file
11. Check for Editing Software
12. Extract Thumbnail
13. Orientation Info
14. Flash Info
15. Lens Info
16. Search Image Origin (Google Lens / TinEye / Yandex)
17. Color Space Info
18. Exposure Info
19. Exit

========================
---

# 🔧 Installation

1. Clone the repository:
```
apt update - y&& apt upgrade - y
```
```
git clone https://github.com/SamzZzui/metadata.git
```
```
cd termux-image-metadata-tool
```
2. Make the script executable:
```
chmod +x image_metadata_tool.sh
```

```
pkg install exiftool
```
```
pkg install bash
```
```
pkg install termux-api
```
```
chmod +x image_metadata_tool.sh
```
```
./image_metadata_tool.sh
```

## Menu Example:

1. 🔎 Pick from 'sample_images' (quick)
2. 📂 Enter image path (manual)
3. Basic File Info
4. Camera Info.


```
/sdcard/DCIM/Camera/image1.jpg
```

```
/sdcard/DCIM/Camera
```

## 📂 Sample Images

Use the sample_images/ folder for quick testing.

---

# 🤝 Contributing

Pull requests are welcome!
For major changes, please open an issue first to discuss what you would like to change.


---

# 🛡️ License

This project is licensed under the MIT License.
Feel free to modify and use it, but please give credit to SamzZzui.


---

# 📬 Contact

Author: SamzZzui

For any issues, open a GitHub issue in the repository.


