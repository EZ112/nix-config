{ config, lib, pkgs, ... }:

{
  users.users.ez = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; 
  };
}

