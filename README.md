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

## 📦 Requirements

Make sure you have **Termux** installed and updated.

```bash
pkg update && pkg upgrade
pkg install bash
pkg install exiftool
pkg install termux-api

---

🔧 Installation

1. Clone the repository:



git clone https://github.com/YOUR-USERNAME/termux-image-metadata-tool.git
cd termux-image-metadata-tool

2. Make the script executable:



chmod +x image_metadata_tool.sh


---

▶️ Usage

Run the script in Termux:

./image_metadata_tool.sh

You will be presented with an interactive menu:

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

🌐 Reverse Image Search

Option 14 allows you to open:

Google Lens

TinEye

Yandex Image Search


Note: This requires termux-api.


---

🛡 License

MIT License

Copyright (c) 2025 YOUR NAME

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

[... full MIT license text here ...]


---


🤝 Contributing

Pull requests are welcome!
For major changes, please open an issue first to discuss what you would like to change.


---

📬 Contact

For issues or suggestions, open a GitHub issue in this repository.


---


MIT License

Copyright (c) 2025 PRINCTEST 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

[... MIT License

Copyright (c) 2025 PRINCTEST 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. ...]