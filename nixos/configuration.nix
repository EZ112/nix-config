# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
in
{
  imports =
    [       
      ./hardware-configuration.nix

      # System
      ./system/base.nix
      ./system/audio.nix
      ./system/bluetooth.nix
      ./system/compositor.nix
      ./system/file-manager.nix
      ./system/fonts.nix
      ./system/network.nix
      ./system/polkit.nix
      ./system/login.nix

      # User
      ./user/ez.nix

      # Packages
      ./pkgs/lib.nix
      ./pkgs/chat.nix
      ./pkgs/starship.nix

      # Home Manager
      (import "${home-manager}/nixos")
      ./home/config.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05"; # Do not Change this value
}

