#!/bin/bash
# Headless alternative to `xcode-select --install`, which opens a GUI prompt.
set -euo pipefail
xcode-select -p >/dev/null 2>&1 && exit 0

flag=/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
touch "$flag"
trap 'rm -f "$flag"' EXIT

label=$(softwareupdate -l 2>/dev/null \
  | sed -n 's/^.*Label: \(Command Line Tools.*\)$/\1/p' \
  | sort -V | tail -n1)
[ -n "$label" ] || { echo "Command Line Tools not found in softwareupdate" >&2; exit 1; }
softwareupdate -i "$label" --verbose
