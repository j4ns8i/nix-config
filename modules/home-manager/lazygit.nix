{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.lazygit = {
    enable = lib.mkEnableOption "lazygit";
  };
  config =
    let
      cfg = config.dotfiles.home-manager.lazygit;
      symlink =
        path: config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.general.root}/${path}";
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [ lazygit ];
      home.file = {
        ".config/zsh/plugins/lazygit.zsh".source = symlink "config/lazygit/lazygit.zsh";
      };
    };
}
