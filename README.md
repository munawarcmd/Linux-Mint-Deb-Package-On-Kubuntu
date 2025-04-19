# 🍃 get-mint-debs

A lightweight Bash script that fetches and installs the latest **Snap‑free **`` versions of **Thunderbird** and **Chromium** from **Linux Mint’s upstream repository**, for Ubuntu‑based distributions (e.g., Kubuntu, Pop!\_OS).

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
   ```
2. **Run the updater**
   ```bash
   ./get-mint-debs.sh
   ```

---

## 🔄 How It Works

- Parses Linux Mint’s upstream pool to find the latest .deb filenames
- Downloads any new packages into `~/.local/mint-debs/`
- Installs or updates them via `dpkg` and fixes dependencies with `apt-get install -f`

---

## 🛡️ Security & Notes

- Packages are served directly by `packages.linuxmint.com`
- No extra repositories are added—safe for Ubuntu systems
- Run the script manually whenever you want to refresh

---

## 🧹 Cleanup

Remove cached .deb files to free space:

```bash
rm -rf ~/.local/mint-debs/*
```

---

## ✍️ License

Distributed under the MIT License.

