{ inputs, ... }:
{
  imports = [
    ./hardware.nix
    ./disko.nix
    ../../configuration.nix
  ];

  networking.hostName = "leyndell";
}
