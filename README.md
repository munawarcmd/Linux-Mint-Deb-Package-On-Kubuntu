# 🍃 get-mint-debs

A lightweight Bash script to download and install the latest Snap‑free `.deb` builds of Thunderbird and Chromium from Linux Mint’s upstream repository. Ideal for Ubuntu‑based distributions that prefer traditional `.deb` packages over Snaps.

## Features

- Retrieves the latest 64‑bit `.deb` packages for Thunderbird (including English locale) and Chromium  
- Skips already‑downloaded files to save bandwidth  
- Installs or upgrades via `dpkg` and resolves dependencies with `apt‑get`  
- Caches all packages in `~/.local/mint‑debs/` for easy inspection  

## Requirements

- Ubuntu‑based distribution (e.g., Kubuntu, Pop!_OS, Linux Lite)  
- 64‑bit Intel/AMD system  
- Installed utilities: `wget`, `dpkg`, `apt‑get`  
- Internet connection  

## Installation

1. Clone the repository  
   ```bash
   git clone https://github.com/<your‑username>/get‑mint‑debs.git
   cd get‑mint‑debs

Make the script executable

bash
Copy
Edit
chmod +x get‑mint‑debs.sh
Usage
Run the script whenever you want to install or update:

bash
Copy
Edit
./get‑mint‑debs.sh
What happens:

The script checks Linux Mint’s upstream pool for the latest .deb filenames

It downloads any missing or updated packages into ~/.local/mint‑debs/

It installs or updates Thunderbird and Chromium

It runs apt‑get install -f to fix any broken dependencies

How It Works
Discovery: Parses the directory listings on packages.linuxmint.com for Thunderbird and Chromium packages

Selection: Chooses the highest‑version AMD64 .deb files via version sorting

Download: Retrieves only new or updated files, skipping those already cached

Installation: Applies dpkg -i followed by apt‑get install -f to ensure a smooth install

Cleanup
To remove all cached .deb files and free up space:

bash
Copy
Edit
rm -rf ~/.local/mint‑debs/*
License
Released under the MIT License. See LICENSE for details.
