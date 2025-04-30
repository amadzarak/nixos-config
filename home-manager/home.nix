{ config, pkgs, ... }:
let
#  customNeovim = import ../nvim/nvim.nix;
in
{
  imports =
  [ # Include the results of the hardware scan.
    ./waybar.nix
  ];

  home.username = "amad";
  home.homeDirectory = "/home/amad";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # ALLOW UNFREE IN HOME MANAGER
  nixpkgs.config.allowUnfree = true;
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
#  programs.neovim = customNeovim pkgs;
#  programs.neovim = 
#  {
#    enable = true;
#    extraLuaConfig = ''
#      vim.opt.clipboard = 'unnamedplus' -- use system keyboard for yank
#      vim.opt.nu = true                 -- set line numbers -- set line numbers
#      vim.opt.relativenumber = true     -- use relative line numbers
#
#      -- set tab size to 2 spaces
#      vim.opt.tabstop = 2
#      vim.opt.softtabstop = 2
#      vim.opt.shiftwidth = 2
#      vim.opt.expandtab = true
#      vim.opt.smartindent = true
       
#      vim.opt.wrap = false
       
#      vim.opt.incsearch = true -- incremental search
       
#      vim.opt.termguicolors = true
#    '';
#    plugins = 
#    [
#        (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [p.c p.go p.java p.python]))
#    ];
#  };

  # KITTY
  programs.kitty =
  {
    enable = true;
    font = 
    {
      name = "Fira Code";
      size = 11;
    };
    themeFile = "Catppuccin-Macchiato";
  };

  home.packages = 
  [ 
      pkgs.oh-my-posh 
      pkgs.tree
      pkgs.slack

  ];
  home.file = {};
  home.sessionVariables = {};
  programs.home-manager.enable = true;
}
