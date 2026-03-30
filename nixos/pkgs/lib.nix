{
  config,
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    neovim
    ripgrep
    wget
    fastfetch
    keychain
    gnumake
    impala
    wl-clipboard
    mpv
    ffmpeg
    devenv
    fzf
    jamesdsp
  ];
}
