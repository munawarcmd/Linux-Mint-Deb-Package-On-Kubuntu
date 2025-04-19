#!/usr/bin/env bash
#
# 🍃 get-mint-debs.sh
# Install the latest Snap‑free .deb builds of Thunderbird & Chromium
# from Linux Mint’s upstream repo on Ubuntu‑based systems.

set -euo pipefail
IFS=$'\n\t'

# Where to cache downloads
WORKDIR="${HOME}/.local/mint-debs"
mkdir -p "${WORKDIR}"
cd "${WORKDIR}"

# Upstream URLs
TB_URL="http://packages.linuxmint.com/pool/upstream/t/thunderbird/"
CH_URL="http://packages.linuxmint.com/pool/upstream/c/chromium/"

echo "🔍 Checking for latest .deb packages on Linux Mint..."

# Fetch the latest matching filename from a directory listing
get_latest_deb() {
    local pattern="$1" base_url="$2"
    wget -q -O - "${base_url}" \
      | grep -oP "${pattern}" \
      | sort -V \
      | tail -1
}

# Identify latest package names
TB_MAIN="$(get_latest_deb 'thunderbird_[0-9].+linuxmint.*?_amd64\.deb' "${TB_URL}")"
TB_LOCALE="$(get_latest_deb 'thunderbird-locale-en_[0-9].+linuxmint.*?_all\.deb' "${TB_URL}")"
CH_MAIN="$(get_latest_deb 'chromium_[0-9].+linuxmint.*?_amd64\.deb' "${CH_URL}")"

# Download if missing
for pkg in "${TB_MAIN}" "${TB_LOCALE}"; do
  if [[ ! -f "${pkg}" ]]; then
    echo "📥 Downloading ${pkg}..."
    wget -c "${TB_URL}${pkg}"
  else
    echo "✔︎ ${pkg} already present."
  fi
done

if [[ ! -f "${CH_MAIN}" ]]; then
  echo "📥 Downloading ${CH_MAIN}..."
  wget -c "${CH_URL}${CH_MAIN}"
else
  echo "✔︎ ${CH_MAIN} already present."
fi

# Install or upgrade
echo "📦 Installing/updating Thunderbird & Chromium..."
sudo dpkg -i "${TB_MAIN}" "${TB_LOCALE}" "${CH_MAIN}"
sudo apt-get install -f -y

echo "✅ Done! Latest .deb versions installed from Linux Mint."
