{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.bun.enable = lib.mkEnableOption "bun";
  config =
    let
      cfg = config.dotfiles.home-manager.bun;
      root = config.dotfiles.general.root;
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [ bun ];
      home.file = {
        ".config/zsh/plugins/bun.zsh".source =
          config.lib.file.mkOutOfStoreSymlink "${root}/config/bun/bun.zsh";
      };
    };
}
