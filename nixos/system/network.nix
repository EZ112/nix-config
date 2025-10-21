{ config, lib, pkgs, ... }:

{
  networking.hostName = "zen";
  networking.wireless.iwd.enable = true;
}
