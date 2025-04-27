{
  # DESCRIPTION BLOCK
  description = "FLAKE FILE";

  # INPUTS BLOCk
  inputs = 
  {
    # DEFINE URL WHERE NIX PACKAGES ARE AT
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  # OUTPUTS BLOCK
  outputs = {self, nixpkgs, ...} :
    let 
      lib = nixpkgs.lib;
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

      # homeManager
  };
}
