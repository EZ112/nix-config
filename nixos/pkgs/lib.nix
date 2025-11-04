{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     brightnessctl
     neovim 
     ripgrep
     wget
     neofetch
     keychain
     gnumake
     impala
     wl-clipboard
     mpv
     ffmpeg
     sassc
     gnome-themes-extra
     gtk-engine-murrine
     nwg-look
     pcmanfm
  ];
}
