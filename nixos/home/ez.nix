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

      # Screen capture
      hyprshot

      # Terminal
      ghostty

      # Wallpaper
      swww

      # Window switcher
      rofi-wayland

      # LSP
      lua-language-server
   ];

   programs = {
    firefox.enable = true;
    git = {
      enable = true;
      extraConfig = {
         init.defaultBranch = "main";
         user = {
           name = "Izzi";
           email = "izzidz@gmail.com";
         };
      };
    };
   };

   # Home Manager is pretty good at managing dotfiles. The primary way to manage
   # plain files is through 'home.file'.
   home.file = {
      ".bashrc".source = ../../.bashrc;
      ".local/share/icons".source = ../../icons;
   };

   xdg.configFile = {
    # File
    "nvim/init.lua".source = ../../nvim/init.lua;
    "starship.toml".source = ../../starship.toml;

    # Directory
    "ghostty".source = ../../ghostty;
    "hypr".source = ../../hypr;
    "neofetch".source = ../../neofetch;
    "nvim/lua".source = ../../nvim/lua;
    "nvim/lsp".source = ../../nvim/lsp;
    "rofi".source = ../../rofi;
    "waybar".source = ../../waybar;
   };

   home.stateVersion = "25.05"; # Do not Change this value
}
