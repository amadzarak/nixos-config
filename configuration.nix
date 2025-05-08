# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # April 23, 2025: Using networkmanager instead of wpa_supplicant -> seems to be
  # quite a bit easier.
  networking.networkmanager.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # April 26, 2025: [11:21 AM] -> Enable nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # April 23, 2025: [7:48 PM]: Enable hyprland
  programs.hyprland = 
  {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"]; # Wayland

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # April 28, 2025: [6:59 PM]: Enable docker on NixOS
  virtualisation.docker.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.zsh = 
  {
      enable = true;
  };
  users.defaultUserShell = pkgs.zsh;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.amad = {
    isNormalUser = true;
    description = "amad";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
    useDefaultShell = true;
  };

  nix.settings.allowed-users = 
  [
  	"amad"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	  vim		# April 23, 2025: Install vim
	  kitty		# [7:50 PM] April 23, 2025: Install kitty terminal
    kitty-themes  #April 29, 2025
	  wget		# [8:25 PM] April 23, 2025
	  git		# [8:25 PM] April 23, 2025
	  waybar	# [8:27 PM] April 23, 2025
	  neovim 	# [8:28 PM] April 23, 2025
	  rofi-wayland
	  wl-clipboard
	  google-chrome
	  vivaldi
	  vscode
	  ripgrep	# [7:16 PM] April 25, 2025
	  tmux		# [7:30 PM] April 25, 2025
	  hyprpaper	# [7:59 PM] April 25, 2025
	  yazi
	  waypaper	# [9:43 PM] April 25, 2025
	  fastfetch	# [12:54 PM] April 26, 2025
	  unzip		# [1:56 PM] April 26, 2025: Fix error in nvim 'style.lua' error
	  nixfmt-rfc-style	# [7:36 PM] April 28, 2025: Add nixfmt package
    qemu    # QEMU emulator/virtualizer April 29, 2025 @ 7:36 PM
    python311
    docker-compose
  ];

  environment.shells = with pkgs; [zsh];

  # FONTS
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    fira-code
    fira-code-symbols
    noto-fonts
    noto-fonts-emoji
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
