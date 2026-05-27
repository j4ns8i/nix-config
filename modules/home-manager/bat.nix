{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.bat = {
    enable = lib.mkEnableOption "bat";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.bat;
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [ bat ];
      home.file = {
        ".config/bat/config".source =
          config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.general.root}/config/bat/config";
      };
    };
}
