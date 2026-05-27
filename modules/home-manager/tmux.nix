{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.tmux.enable = lib.mkEnableOption "tmux";
  config =
    let
      cfg = config.dotfiles.home-manager.tmux;
      symlink = config.lib.file.mkOutOfStoreSymlink;
      osConf = if pkgs.stdenv.isDarwin then "darwin.conf" else "nixos.conf";
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [ tmux ];
      home.file = {
        ".config/tmux/tmux.conf".source =
          symlink "${config.dotfiles.general.root}/config/tmux/tmux.conf";
        ".config/tmux/os.conf".source =
          symlink "${config.dotfiles.general.root}/config/tmux/${osConf}";
        ".config/tmux/vim-tmux-navigator.conf".source =
          symlink "${config.dotfiles.general.root}/config/tmux/vim-tmux-navigator.conf";
        ".config/tmux/themes".source = fetchGit {
          url = "https://github.com/tinted-theming/tinted-tmux";
          rev = "20396f130e477512632c37f72590b71f59dbef88";
        };
      };
    };
}
