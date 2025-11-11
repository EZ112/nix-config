{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     sassc
     gnome-themes-extra
     gtk-engine-murrine
     nwg-look
  ];
}
