#!/usr/bin/env bash
set -euo pipefail

# --- Color Definitions ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# --- Helper Functions ---
info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1" >&2; }

setup_and_install() {
  local curr_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd ) 
  local config_dir="$curr_dir/nixos"
  local nix_config_dir=""

  if [ -d "$config_dir" ]; then
    info "Found local configuration at '$config_dir'."
    nix_config_dir="$config_dir"
  fi
  sudo cp /etc/nixos/hardware-configuration.nix $nix_config_dir
  sudo nixos-rebuild switch -I nixos-config="$nix_config_dir/configuration.nix"
}

setup_and_install
