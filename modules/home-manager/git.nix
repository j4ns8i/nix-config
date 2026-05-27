{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.git = {
    enable = lib.mkEnableOption "git";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.git;
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [ git ];
      home.file = {
        ".config/git/config".source =
          config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.general.root}/config/git/gitconfig";
      };
    };
}
