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
    in
    {
      darwinConfigurations = {
        yuzu = mkDarwin "yuzu" "aarch64-darwin";
      };
    };
}
