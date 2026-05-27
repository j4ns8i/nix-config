{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.zsh.enable = lib.mkEnableOption "zsh";
  config =
    let
      zshrcExtra = ''
        ### BEGIN init from dotfiles/modules/zsh.nix ###
        export ZSH_CONFIG_DIR=~/.config/zsh
        source ''${ZSH_CONFIG_DIR}/init.zsh
        ### END init from dotfiles/modules/zsh.nix ###
      '';
      symlink = config.lib.file.mkOutOfStoreSymlink;
      osZsh = if pkgs.stdenv.isDarwin then "darwin.zsh" else "nixos.zsh";
      root = config.dotfiles.general.root;
      machineZsh = "${root}/config/zsh/${config.dotfiles.general.hostname}.zsh";
      cfg = config.dotfiles.home-manager.zsh;
    in
    lib.mkIf cfg.enable {
      programs.zsh = {
        enable = true;
        initContent = zshrcExtra;
      };
      home.packages = with pkgs; [ zsh ];
      home.file = {
        ".config/zsh/share".source = symlink "${root}/config/zsh/share";
        ".config/zsh/local/os.zsh".source = symlink "${root}/config/zsh/${osZsh}";
        ".config/zsh/init.zsh".source = symlink "${root}/config/zsh/init.zsh";
        ".config/zsh/local/machine.zsh".source = symlink "${machineZsh}";
      };
    };
}
