{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.kubernetes = {
    enable = lib.mkEnableOption "Kubernetes tools";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.kubernetes;
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [
        stern
        kubectx
        kubectl
        k3d
      ];
    };
}
