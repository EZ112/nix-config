{ config, pkgs, ... }:

{
  home.username = "ez";
  home.homeDirectory = "/home/ez";

  home.sessionVariables = import ./variables.nix;

  imports = [
    ./programs.nix
    ./services.nix
    ./workspaces.nix
    ./ssh.nix
    ./gtk.nix
  ];

  home.packages = with pkgs; [
    waybar # Bar
    font-manager # Font
    swww # Wallpaper
    rofi # Window switcher

    # Notification
    dunst
    libnotify

    # Compiler
    gcc

    # Calendar
    gcalcli

    # AI
    gemini-cli

    # Devtool
    bruno
    devtoolbox

    # Package manager
    luajitPackages.luarocks

    # LSP
    jdt-language-server
    lombok
    lua-language-server
    vscode-langservers-extracted
    typescript-language-server
    emmet-ls
    basedpyright
    ruff

    # Lint
    eslint_d

    # Formatter
    google-java-format
    prettierd
    stylua
    xmlformat
    nixfmt
  ];

  home.file = {
    ".bashrc_local.example".source = ../../.bashrc_local.example;
  };

  xdg.configFile = {
    # File
    "hypr/hyprland.conf".source = ../../hypr/hyprland.conf;
    "hypr/hyprlock.conf".source = ../../hypr/hyprlock.conf;
    "nvim/init.lua".source = ../../nvim/init.lua;
    "nvim/stylua.toml".source = ../../nvim/stylua.toml;
    "starship.toml".source = ../../starship.toml;
    "yazi/keymap.toml".source = ../../yazi/keymap.toml;

    # Directory
    "btop".source = ../../btop;
    "dunst".source = ../../dunst;
    "mpv".source = ../../mpv;
    "nvim/lua".source = ../../nvim/lua;
    "nvim/lsp".source = ../../nvim/lsp;
    "rofi".source = ../../rofi;
    "waybar".source = ../../waybar;
    "yazi/flavors".source = ../../yazi/flavors;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
    };
  };

  home.stateVersion = "25.05"; # Do not Change this value
}
