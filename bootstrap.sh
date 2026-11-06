#!/bin/bash
# Installs everything needed to run the playbooks on a fresh Mac.
set -euo pipefail
cd "$(dirname "$0")"

sudo -v
sudo ./files/install-clt.sh

if ! command -v brew >/dev/null; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install ansible
ansible-galaxy collection install -r requirements.yml

echo "Done. Run: ansible-playbook macbook.yml -K"
