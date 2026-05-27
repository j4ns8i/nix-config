{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.neovim = {
    enable = lib.mkEnableOption "neovim";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.neovim;
      # neovimPkg = pkgs.neovim.override {
      #   withNodeJs = true;
      #   withPython3 = true;
      # };
    in
    lib.mkIf cfg.enable {
      home.file = {
        ".config/nvim".source =
          config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.general.root}/config/neovim";
      };
      home.packages = with pkgs; [
        helm-ls
        (neovim)
      ];
    };
}
