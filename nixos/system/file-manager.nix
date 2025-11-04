{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pcmanfm
  ];

  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    devmon.enable = true;
  };
}

