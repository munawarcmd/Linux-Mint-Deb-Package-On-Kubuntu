#!/bin/bash

# 🍃 mint-updater.sh
# Fetch and install the latest .deb versions of Thunderbird and Chromium from Linux Mint on Ubuntu-based distros
# Author: You

# Directory to cache downloaded packages
WORKDIR="$HOME/.local/mint-debs"
mkdir -p "$WORKDIR"
cd "$WORKDIR" || exit 1

# Base URLs
TB_URL="http://packages.linuxmint.com/pool/upstream/t/thunderbird/"
CH_URL="http://packages.linuxmint.com/pool/upstream/c/chromium/"

echo "🔍 Checking for latest Thunderbird and Chromium .deb packages from Linux Mint..."

# Function to get latest .deb by pattern
get_latest_deb() {
    local pattern="$1"
    local base_url="$2"
    wget -q -O - "$base_url" | grep -oP "$pattern" | sort -V | tail -1
}

# Thunderbird
TB_MAIN=$(get_latest_deb 'thunderbird.*?linuxmint.*?_amd64\.deb' "$TB_URL")
TB_LOCALE=$(get_latest_deb 'thunderbird-locale-en.*?linuxmint.*?_all\.deb' "$TB_URL")

# Chromium
CH_MAIN=$(get_latest_deb 'chromium.*?linuxmint.*?_amd64\.deb' "$CH_URL")

# Download packages if not already present
for PKG in "$TB_MAIN" "$TB_LOCALE"; do
    [ -f "$PKG" ] || wget -c "${TB_URL}${PKG}"
done

[ -f "$CH_MAIN" ] || wget -c "${CH_URL}${CH_MAIN}"

# Install/upgrade both apps
echo "📦 Installing/updating Thunderbird and Chromium..."
sudo dpkg -i thunderbird*.deb chromium*.deb
sudo apt -f install -y

echo "✅ Done! Mint packages installed/updated successfully."
