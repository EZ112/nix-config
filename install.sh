#!/usr/bin/env bash
set -euo pipefail

# This script performs a fresh installation of NixOS using Disko and Flakes.
# Usage: ./install.sh <hostname>

HOSTNAME="${1:-}"

if [ -z "$HOSTNAME" ]; then
    echo "Usage: ./install.sh <hostname>"
    echo "Available hosts in ./nixos/hosts/:"
    ls ./nixos/hosts/
    exit 1
fi

DISKO_CONFIG="./nixos/hosts/$HOSTNAME/disko.nix"

if [ ! -f "$DISKO_CONFIG" ]; then
    echo "Error: Disko configuration for host '$HOSTNAME' not found at '$DISKO_CONFIG'"
    exit 1
fi

# 1. Run Disko to partition and format the disk.
echo "Running Disko for host '$HOSTNAME'..."
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko "$DISKO_CONFIG"

# 2. Install NixOS using the flake.
echo "Installing NixOS for host '$HOSTNAME'..."
sudo nixos-install --flake ".#$HOSTNAME"
