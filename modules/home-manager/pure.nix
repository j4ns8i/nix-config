{ config, lib, ... }:
{
  options.dotfiles.home-manager.pure = {
    enable = lib.mkEnableOption "pure";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.pure;
      symlink =
        path: config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.general.root}/${path}";
    in
    lib.mkIf cfg.enable {
      home.file = {
        ".config/zsh/plugins/pure".source = fetchGit {
          url = "https://github.com/sindresorhus/pure";
          rev = "dbefd0dcafaa3ac7d7222ca50890d9d0c97f7ca2";
        };
        ".config/zsh/plugins/pure.zsh".source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.general.root}/config/pure/pure.zsh";
      };
    };
}
