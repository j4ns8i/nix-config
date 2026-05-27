{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.go = {
    enable = lib.mkEnableOption "go";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.go;
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [ go ];
    };
}
