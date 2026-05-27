{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.fd = {
    enable = lib.mkEnableOption "fd";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.fd;
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [ fd ];
      home.file = {
        ".config/fd/ignore".source =
          config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.general.root}/config/fd/ignore";
      };
    };
}
