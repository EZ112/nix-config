{
  ll = "ls -la";
  sw-boot="sudo /run/current-system/bin/switch-to-configuration boot";
  nrs="sudo nixos-rebuild switch -I nixos-config=$HOME/dotfiles/nixos/configuration.nix";
  ncg="sudo nix-collect-garbage -d && nix-collect-garbage -d";
}
