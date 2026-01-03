{ config, pkgs, ... }: 

{
   home.username = "ez";
   home.homeDirectory = "/home/ez";

   home.sessionVariables = {
      EDITOR = "nvim";
   };

   home.packages = with pkgs; [
      # Bar
      waybar

      # Font
      font-manager

      # Notification
      dunst
      libnotify


      # Terminal
      ghostty

      # Wallpaper
      swww

      # Window switcher
      rofi

      # Compiler
      gcc

      # Package manager
      luajitPackages.luarocks

      # LSP
      lua-language-server
      vscode-langservers-extracted
      typescript-language-server
      emmet-ls

      # Lint
      eslint_d

      # Formatter
      prettierd
      stylua
   ];

   programs = {
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

    yazi = {
      enable = true;
      plugins = {
        mount = pkgs.yaziPlugins.mount;
      };
    };
   };

   # Home Manager is pretty good at managing dotfiles. The primary way to manage
   # plain files is through 'home.file'.
   home.file = {
      ".bashrc".source = ../../.bashrc;
      ".icons".source = ../../gtk/icons;
      ".themes".source = ../../gtk/themes;
   };

   xdg.configFile = {
    # File
    "nvim/init.lua".source = ../../nvim/init.lua;
    "nvim/stylua.toml".source = ../../nvim/stylua.toml;
    "starship.toml".source = ../../starship.toml;
    "yazi/keymap.toml".source = ../../yazi/keymap.toml;

    # Directory
    "ghostty".source = ../../ghostty;
    "dunst".source = ../../dunst;
    "hypr".source = ../../hypr;
    "mpv".source = ../../mpv;
    "neofetch".source = ../../neofetch;
    "nvim/lua".source = ../../nvim/lua;
    "nvim/lsp".source = ../../nvim/lsp;
    "rofi".source = ../../rofi;
    "waybar".source = ../../waybar;
   };

   home.stateVersion = "25.05"; # Do not Change this value
}
