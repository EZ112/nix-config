{ config, pkgs, ... }:

{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        general.import = [
          "${pkgs.alacritty-theme}/share/alacritty-theme/gruvbox_dark.toml"
        ];
        font = {
          size = 12.0;
          normal = {
            family = "Inconsolata Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "Inconsolata Nerd Font";
            style = "Bold";
          };
          italic = {
            family = "Inconsolata Nerd Font";
            style = "Italic";
          };
        };
      };
    };

    bash = {
      enable = true;
      shellAliases = import ./aliases.nix;
      initExtra = ''
        [ -f ~/.bashrc_local ] && source ~/.bashrc_local
      '';
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user = {
          name = "Izzi";
          email = "izzidz@gmail.com";
        };
        core.editor = "nvim";
      };
    };

    obs-studio = {
      enable = true;
      package = (
        pkgs.obs-studio.override {
          cudaSupport = true;
        }
      );
      plugins = with pkgs.obs-studio-plugins; [
        obs-backgroundremoval
      ];
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
    };

    tmux = {
      enable = true;
      shortcut = "Space";
      baseIndex = 1;
      escapeTime = 0;
      plugins = with pkgs; [
        tmuxPlugins.gruvbox
      ];
      extraConfig = builtins.readFile ../../tmux/tmux.conf;
    };

    yazi = {
      enable = true;
      theme = {
        flavor = {
          dark = "gruvbox";
        };
      };
      plugins = {
        mount = pkgs.yaziPlugins.mount;
      };
      shellWrapperName = "y";
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
