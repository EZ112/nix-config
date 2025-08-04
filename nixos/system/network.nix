{ config, lib, pkgs, ... }:

{
  networking.hostName = "zen";
  networking.networkmanager.enable = true;
}
