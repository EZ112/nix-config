{ config, lib, pkgs, ... }:

{
  imports =
    [       
      ./hardware-configuration.nix

      # System
      ./system/base.nix
      ./system/bluetooth.nix
      ./system/network.nix

      # User
      ./user/ez.nix
    ];

  environment.systemPackages = with pkgs; [
     neovim 
  ];

  system.stateVersion = "25.05"; # Do not Change this value
}

