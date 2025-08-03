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
      ".bashrc".source = /home/ez/dotfiles/.bashrc;

      ".config/starship.toml".source = /home/ez/dotfiles/starship.toml;

      ".config/alacritty".source = /home/ez/dotfiles/alacritty;
      ".config/hypr".source = /home/ez/dotfiles/hypr;
      ".config/neofetch".source = /home/ez/dotfiles/neofetch;
      ".config/rofi".source = /home/ez/dotfiles/rofi;
      ".config/wallpapers".source = /home/ez/dotfiles/wallpapers;
      ".config/waybar".source = /home/ez/dotfiles/waybar;
   };

   home.stateVersion = "25.05"; # Do not Change this value
}
