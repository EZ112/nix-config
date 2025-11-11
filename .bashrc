# Alias
## Utils
alias ll='ls -la'

## NIX
alias sw-boot='sudo /run/current-system/bin/switch-to-configuration boot'
alias nrs='sudo nixos-rebuild switch -I nixos-config=$HOME/dotfiles/nixos/configuration.nix'
alias ncg='sudo nix-collect-garbage -d && nix-collect-garbage -d'

# Eval
eval "$(direnv hook bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"

export EDITOR="nvim"
