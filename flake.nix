{
  description = "j4ns8i's multi-system NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ...} @ inputs:
    let
      commonModules = name: [
        {
          nix.settings.experimental-features = [ "nix-command" "flakes" ];
          networking.hostName = name;
        }
      ];
      mkSystem = name: cfg: nixpkgs.lib.nixosSystem {
        system = cfg.system or "x86_64-linux";
        modules = (commonModules name) ++ (cfg.modules or []);
        specialArgs = inputs;
      };
      systems = {
        proton-3 = {
          modules = [
            ./machines/proton
          ];
        };
      };
    in {
      nixosConfigurations = nixpkgs.lib.mapAttrs mkSystem systems;
    };
}

# vim: set sw=2 :
