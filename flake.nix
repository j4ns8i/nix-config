{
  description = ''
    All-in-one system configuration.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:nix-darwin/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      home-manager,
      darwin,
      nixpkgs,
      ...
    }:
    let
      mkDarwin =
        name: system:
        darwin.lib.darwinSystem {
          system = system;
          specialArgs = { inherit inputs system; };
          modules = [
            ./modules/dotfiles
            ./modules/nix-darwin
            ./machines/${name}
            home-manager.darwinModules.home-manager
            (
              { config, ... }:
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = false;
                home-manager.sharedModules = [
                  ./modules/dotfiles
                  ./machines/${name}
                ];
                home-manager.extraSpecialArgs = {
                  inherit inputs;
                };
                home-manager.users.${config.dotfiles.general.username} = ./modules/home-manager;
              }
            )
          ];
        };
      mkNixos =
        name: system:
        nixpkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./modules/dotfiles
            ./machines/${name}
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = false;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.sharedModules = [
                ./modules/dotfiles
                ./machines/${name}/dotfiles.nix
              ];
              home-manager.users.j4ns8i = ./modules/home-manager;
            }
          ];
        };
    in
    {
      darwinConfigurations = {
        yuzu = mkDarwin "yuzu" "aarch64-darwin";
        justinsmalkowski-YJ0VNX32G2 = mkDarwin "apogee" "aarch64-darwin";
      };
      nixosConfigurations = {
        laptar-2 = mkNixos "laptar" "x86_64-linux";
      };
    };
}
