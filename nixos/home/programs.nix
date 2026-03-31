{ config, pkgs, ... }:

{
  programs = {
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

    yazi = {
      enable = true;
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
