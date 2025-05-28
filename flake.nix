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

    # Nixd LSP for nix language
    nixd.url = "github:nix-community/nixd";
  };

  # OUTPUTS BLOCK
  outputs = {self, nixpkgs, home-manager, nixd, ...} :
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
          modules = [
            ./configuration.nix
                # MAY 9: 11:07 PM: I Attempted to use thsi tutorial to install nixd.
                # doesnt seem to have worked.
                # https://github.com/nix-community/nixd/blob/b5079c4d79905048d3c0b39e1a2a6a66067f1111/docs/user-guide.md
                #            {
                #nixpkgs.overlays = [ nixd.overlays.default ];
                #environment.systemPackages = with pkgs;[
                #nixd
                #];
                #}
          ];
        };
      };

      # home-manager/home.nix
      homeConfigurations = 
      {
        amad = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = 
          [
            ./home-manager/home.nix
          ];
        };
      };
  };
}
