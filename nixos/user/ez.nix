{ config, lib, pkgs, ... }:

{
  users.users.ez = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; 
  };

  nix.settings.trusted-users = ["root" "ez"];
}

