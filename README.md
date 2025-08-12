# 📸 Termux Image Metadata Tool v2

A powerful **Termux-based** Bash script to view, export, remove, and search image metadata.

## 📦 Installation

```bash
pkg update && pkg upgrade
pkg install exiftool termux-api
termux-setup-storage

▶️ Usage

1. Save metadata_tool.sh in Termux home folder.


2. Make it executable:

chmod +x metadata_tool.sh


3. Run:

./metadata_tool.sh



📌 Features

View Basic Info (file size, name, type, date)

View Camera Details (make, model, lens)

GPS Location

Date & Time info

Software used for editing

Extract all metadata

Remove metadata

Export metadata to text file

Extract thumbnail (thumbnail.jpg)

Orientation, Flash, Lens, Color Space, Exposure details

Search image origin in Google Lens, TinEye, Yandex


☁️ Upload to GitHub

1. Create a new GitHub repo (e.g., termux-metadata-tool).


2. In Termux:

git init
git remote add origin https://github.com/YOUR_USERNAME/termux-metadata-tool.git
git add metadata_tool.sh README.md
git commit -m "Initial commit"
git branch -M main
git push -u origin main