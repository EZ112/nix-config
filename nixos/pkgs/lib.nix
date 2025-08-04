{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     brightnessctl
     neovim 
     wget
     neofetch
     keychain
  ];
}

