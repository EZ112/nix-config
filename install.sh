#!/usr/bin/env bash
set -euo pipefail

# --- Default Config ---
ESP_SIZE="512MB"
SWAP_SIZE="8GB"

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

prompt_for_mandatory_input() {
    local prompt_text="$1"
    local -n var_name="$2" # Nameref to assign to the variable in the parent scope
    local input=""
    while true; do
        read -rp "$prompt_text" input
        if [ -n "$input" ]; then
            var_name="$input"
            break
        else
            error "This field cannot be empty. Please try again."
        fi
    done
}

select_disk() {
    info "Listing available block devices..."
    lsblk -o NAME,SIZE,TYPE,MOUNTPOINTS
    
    prompt_for_mandatory_input "(*) Please enter the name of the disk to install NixOS on (e.g., /dev/sda): " DISK_INPUT
    if [ -b "$DISK_INPUT" ]; then
        DISK="$DISK_INPUT"
    else
        error "The disk '$DISK_INPUT' does not exist. Please choose a valid disk."
        exit 1
    fi
}

confirm_installation() {
    warning "--- Installation Summary ---"
    echo "  Disk to be WIPED:      $DISK"
    warning "----------------------------"
    
    read -rp "Are you ABSOLUTELY SURE you want to proceed? This will erase all data on $DISK. (y/n): " final_confirm
    if [[ ! "$final_confirm" =~ ^[Yy]$ ]]; then
        error "Installation cancelled by user."
        exit 1
    fi
}

perform_disk_operation() {
  info "Wiping disk: $DISK..."
  sudo wipefs -a "$DISK"
  sudo sgdisk --zap-all "$DISK"
  success "Disk wiped."

  info "Creating partitions on $DISK..."
  sudo parted "$DISK" --script -- \
    mklabel gpt \
    mkpart root ext4 "$ESP_SIZE" "-${SWAP_SIZE}" \
    mkpart swap linux-swap "-${SWAP_SIZE}" 100% \
    mkpart ESP fat32 1MiB "$ESP_SIZE" \
    set 3 esp on
  success "Partitions created."

  info "Formatting partitions..."
  sudo mkfs.ext4 -L root "${DISK}p1"          # p1: root
  sudo mkswap -L swap "${DISK}p2"             # p3: swap
  sudo mkfs.fat -F 32 -n boot "${DISK}p3"     # p3: ESP
  success "Partitions formatted."

  info "Mounting filesystems..."
  sudo mount /dev/disk/by-label/root /mnt
  sudo swapon /dev/disk/by-label/swap
  sudo mkdir -p /mnt/boot
  sudo mount -o umask=077 /dev/disk/by-label/boot /mnt/boot
  success "Filesystems mounted."
}

generate_nix_config() {
  info "Generating NixOS configuration..."
  sudo nixos-generate-config --root /mnt
  info "Starting NixOS installation... (This will take a while)"
  sudo nixos-install --root /mnt
  success "NixOS installation complete!"
  warning "You can now reboot your system. Don't forget to remove the installation media."
}

main(){
  select_disk
  confirm_installation
  perform_disk_operation
  generate_nix_config
}

main
