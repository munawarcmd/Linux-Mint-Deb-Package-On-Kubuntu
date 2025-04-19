# 🍃 get-mint-debs

A lightweight Bash script that fetches and installs the latest **Snap‑free `.deb`** versions of **Thunderbird** and **Chromium** from **Linux Mint’s upstream repository**, for Ubuntu‑based distributions (e.g., Kubuntu, Pop!_OS).

---

## ✅ Features

- Downloads 64‑bit `.deb` packages of Thunderbird (main + `en` locale) and Chromium  
- Skips downloads if files already exist  
- Installs or updates via `dpkg` and resolves dependencies with `apt`  
- Caches packages in `~/.local/mint-debs/`  

---

## 📦 Requirements

- Ubuntu‑based distro (tested on Kubuntu 25.04)  
- 64‑bit architecture  
- `wget`, `dpkg`, `apt` installed  
- Internet connection  

---

## 🚀 Usage

1. **Download & make executable**  
   ```bash
   chmod +x get-mint-debs.sh
