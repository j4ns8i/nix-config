{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.starship = {
    enable = lib.mkEnableOption "starship";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.starship;
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [ starship ];
      home.file = {
        ".config/starship.toml".source =
          config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.general.root}/config/starship/starship.toml";
        ".config/zsh/plugins/starship.zsh".source =
          config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.general.root}/config/starship/starship.zsh";
      };
    };
}
