{
  config,
  lib,
  pkgs,
  ...
}:

{
  fonts.packages = with pkgs; [
    nerd-fonts.inconsolata
    noto-fonts-cjk-sans
  ];
}
