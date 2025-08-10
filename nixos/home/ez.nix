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
      alacritty

      # Wallpaper
      swww

      # Window switcher
      rofi-wayland
   ];

   programs.firefox.enable = true;
   programs.git = {
      enable = true;
      extraConfig = {
         init.defaultBranch = "main";
	 user = {
	   name = "Izzi";
	   email = "izzidz@gmail.com";
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
    "starship.toml".source = ../../starship.toml;

    # Directory
    "alacritty".source = ../../alacritty;
    "hypr".source = ../../hypr;
    "neofetch".source = ../../neofetch;
    "rofi".source = ../../rofi;
    "waybar".source = ../../waybar;
   };

   home.stateVersion = "25.05"; # Do not Change this value
}
