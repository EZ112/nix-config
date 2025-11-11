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
     devenv
     direnv
     lazysql
  ];
}
