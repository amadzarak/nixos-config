{ config, pkgs, ... }:
let
  customNeovim = import ../nvim/nvim.nix;
in
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
      "tree" = "tree -L 1";
    };
  };

  # ZSHELL
  programs.zsh = 
  {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    shellAliases = 
    {
      "waybar-reload" = "pkill waybar && hyprctl dispatch exec waybar";
      "tree" = "tree -L 1";
    };
    oh-my-zsh = 
    {
      enable = true;
      plugins = [];
    };
  };

  # ZSHELL : oh-my-posh
  programs.oh-my-posh = 
  {
      enable = true;
      enableZshIntegration = true;
      #      useTheme = "clean-detailed";
      #useTheme = "di4am0nd";
      useTheme = "negligible";
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

  # NEOVIM
  programs.neovim = customNeovim pkgs;

  home.packages = 
  [ 
      pkgs.oh-my-posh 
      pkgs.tree

  ];
  home.file = {};
  home.sessionVariables = {};
  programs.home-manager.enable = true;
}
