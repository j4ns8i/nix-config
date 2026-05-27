{ config, lib, ... }:
{
  options.dotfiles.home-manager.fzf = {
    enable = lib.mkEnableOption "fzf";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.fzf;
    in
    lib.mkIf cfg.enable {
      programs.fzf = {
        enable = true;
        enableZshIntegration = config.programs.zsh.enable;
      };
    };
}
