{
  description = "NixOS flake";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    sops-nix.url = "github:Mic92/sops-nix";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      vars = import ./system-variables.nix;
    in
    {
	nixosConfigurations.default = nixpkgs.lib.nixosSystem {
	  specialArgs = { inherit inputs vars; };

          modules = [
            ./nixos/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };

    };
}
