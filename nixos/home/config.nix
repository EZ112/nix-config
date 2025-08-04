{ config, lib, pkgs, ... }:

{
  home-manager.users.ez = ./ez.nix;
  home-manager.backupFileExtension = "backup";
}

