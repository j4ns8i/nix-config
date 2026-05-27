{ config, lib, ... }:
{
  options.dotfiles.home-manager.zoxide = {
    enable = lib.mkEnableOption "zoxide";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.zoxide;
    in
    lib.mkIf cfg.enable {
      programs.zoxide = {
        enable = true;
      };
    };
}
