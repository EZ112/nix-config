{ config, lib, pkgs, ... }:

{
  # Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  # hint electron app to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}

