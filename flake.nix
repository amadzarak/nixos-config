{
  # DESCRIPTION BLOCK
  description = "FLAKE FILE";

  # INPUTS BLOCk
  inputs = 
  {
    # DEFINE URL WHERE NIX PACKAGES ARE AT
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # OUTPUTS BLOCK
  outputs = {self, nixpkgs, home-manager, ...} :
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # configuration.nix
      nixosConfigurations = 
      {
        nixos = lib.nixosSystem 
        {
          system = "x86_64-linux";
          modules = [./configuration.nix];
        };
      };

      # home-manager/home.nix
      homeConfigurations = 
      {
        amad = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [./home-manager/home.nix];
        };
      };
  };
}
