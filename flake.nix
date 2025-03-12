{
  description = "j4ns8i's multi-system NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    ghostty.url = "github:ghostty-org/ghostty";
  };

  outputs = { self, nix-darwin, nixpkgs, nixos-wsl, ghostty, ... } @ inputs:
    let
      mkNixOSSystem = name: cfg: nixpkgs.lib.nixosSystem {
        system = cfg.system or "x86_64-linux";
        modules = with builtins;
          map (filename: (toString ./modules) + "/${filename}")
              (attrNames (readDir ./modules))
          ++ (cfg.modules or []);
        specialArgs = inputs // {
          setupCfg = {
            inherit (cfg) user;
            hostname = name;
          };
        };
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
          user = "j4ns8i";
        };
        laptar-2 = {
          modules = [
            ./machines/laptar
          ];
          user = "j4ns8i";
        };
        woos = {
          modules = [
            nixos-wsl.nixosModules.default
            ./machines/woos
          ];
          user = "j4ns8i";
        };
      };
      nixDarwinSystems = {
        "justinsmalkowski-YJ0VNX32G2" = {
          modules = [
            ./machines/macarm
          ];
          user = "justin.smalkowski";
        };
      };
    in {
      nixosConfigurations = nixpkgs.lib.mapAttrs mkNixOSSystem nixOSSystems;
      darwinConfigurations = nixpkgs.lib.mapAttrs mkNixDarwinSystem nixDarwinSystems;
    };
}

# vim: set sw=2 :
