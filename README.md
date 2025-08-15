# 📸 Termux Image Metadata Tool v2

A powerful **Bash-based image metadata extraction tool** designed for **Termux** users.  
Easily extract, view, and manage metadata from image files — including camera info, GPS location, exposure details, and more.  
Supports **metadata removal**, **thumbnail extraction**, and **reverse image search** via Google Lens, TinEye, and Yandex.

---

## 🚀 Features
- **View Basic File Info** (name, size, type, timestamps)
- **Camera Details** (make, model, lens)
- **GPS Coordinates** (latitude, longitude)
- **Date & Time Information**
- **Software Used** for image processing
- **All Metadata Extraction**
- **Remove All Metadata**
- **Export Metadata** to a `.txt` file
- **Detect Editing Software**
- **Extract Embedded Thumbnails**
- **Orientation, Flash, Lens Info**
- **Reverse Image Search** (Google Lens, TinEye, Yandex)
- **Color Space & Exposure Details**

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
1. Basic File Info
2. Camera Info
3. GPS Location
4. Date & Time
5. Software Info
6. All Metadata
7. Remove Metadata
8. Export Metadata to text file
9. Check for Editing Software
10. Extract Thumbnail
11. Orientation Info
12. Flash Info
13. Lens Info
14. Search Image Origin (Google Lens / TinEye / Yandex)
15. Color Space Info
16. Exposure Info
17. Exit
========================

---

# 🔧 Installation

1. Clone the repository:

apt update - y&& apt upgrade - y

```
git clone https://github.com/princtest/termux-image-metadata-tool.git
```

cd termux-image-metadata-tool

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


---

# 🤝 Contributing

Pull requests are welcome!
For major changes, please open an issue first to discuss what you would like to change.


---

# 📬 Contact

For issues or suggestions, open a GitHub issue in this repository.