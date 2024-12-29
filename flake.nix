{
  description = "j4ns8i's multi-system NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    ghostty.url = "github:ghostty-org/ghostty";
  };

  outputs = { self, nix-darwin, nixpkgs, ghostty, ... } @ inputs:
    let
      commonModules = name: [
        (import ./common.nix) {
          networking.hostName = name;
        }
      ];
      mkNixOSSystem = name: cfg: nixpkgs.lib.nixosSystem {
        system = cfg.system or "x86_64-linux";
        modules = (commonModules name) ++ (cfg.modules or []);
        specialArgs = inputs;
      };
      mkNixDarwinSystem = name: cfg: nix-darwin.lib.darwinSystem {
        modules = cfg.modules;
        specialArgs = { inherit self; inherit nix-darwin; };
      };
      nixOSSystems = {
        proton-3 = {
          modules = [
            ./machines/proton
          ];
        };
        laptar-2 = {
          modules = [
            ./machines/laptar
          ];
        };
      };
      nixDarwinSystems = {
        "justinsmalkowski-YJ0VNX32G2" = {
          modules = [
            ./machines/macarm
          ];
        };
      };
    in {
      nixosConfigurations = nixpkgs.lib.mapAttrs mkNixOSSystem nixOSSystems;
      darwinConfigurations = nixpkgs.lib.mapAttrs mkNixDarwinSystem nixDarwinSystems;
    };
}

# vim: set sw=2 :
