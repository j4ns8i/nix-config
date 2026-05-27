{ config, lib, ... }:
{
  options.dotfiles.home-manager.direnv = {
    enable = lib.mkEnableOption "direnv";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.direnv;
    in
    lib.mkIf cfg.enable {
      programs.direnv.enable = true;
      home.file = {
        ".config/direnv/direnvrc".source =
          config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.general.root}/config/direnv/direnvrc";
      };
    };
}
