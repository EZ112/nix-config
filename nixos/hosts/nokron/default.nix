{ inputs, ... }:
{
  imports = [
    ./hardware.nix
    ./disko.nix
    ../../configuration.nix
  ];

  networking.hostName = "nokron"; # Example Elden Ring location
}
