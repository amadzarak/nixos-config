{ config, pkgs, ... }:

{
  home.username = "amad";
  home.homeDirectory = "/home/amad";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # BASH
  programs.bash =
  {
    enable = true;
    shellAliases = 
    {
      "waybar-reload" = "pkill waybar && hyprctl dispatch exec waybar";
    };
  };

  programs.zsh = 
  {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    shellAliases = 
    {
      "waybar-reload" = "pkill waybar && hyprctl dispatch exec waybar";
    };
    oh-my-zsh = 
    {
      enable = true;
      plugins = [];
    };
  };

  # GIT
  programs.git = 
  {
    enable = true;
    userName = "Amad";
    userEmail = "amadzarak16@gmail.com";
    extraConfig = 
    {
      init.defaultBranch = "main";
    };
  };

  home.packages = [];
  home.file = {};
  home.sessionVariables = {};
  programs.home-manager.enable = true;
}
