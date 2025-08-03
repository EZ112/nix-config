# Alias
## Utils
alias ll='ls -la'

## NIX
alias nrs='sudo nixos-rebuild switch -I nixos-config=$HOME/dotfiles/nixos/configuration.nix'
alias ncg='sudo nix-collect-garbage -d && nix-collect-garbage -d'

# Starship
eval "$(starship init bash)"
