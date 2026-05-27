{ config, lib, ... }:
{
  options.dotfiles = {

    general = {
      username = lib.mkOption {
        type = lib.types.str;
        description = "Primary username for this machine configuration.";
      };

      homeDirectory = lib.mkOption {
        type = lib.types.str;
        description = "Home directory for this machine configuration.";
      };

      hostname = lib.mkOption {
        type = lib.types.str;
        description = "Hostname for this machine configuration.";
      };

      root = lib.mkOption {
        type = lib.types.str;
        default = "${config.dotfiles.general.homeDirectory}/git/j4ns8i/nix-config";
      };
    };

    home-manager = lib.mkOption {
      type = lib.types.submodule {
        freeformType = lib.types.attrsOf lib.types.anything;
      };
    };

    nix-darwin = lib.mkOption {
      type = lib.types.submodule {
        freeformType = lib.types.attrsOf lib.types.anything;
      };
    };

  };
}
