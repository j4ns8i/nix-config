{ config, lib, ... }:
{
  imports = [
    ./bat.nix
    ./bun.nix
    ./direnv.nix
    ./fd.nix
    ./firefox.nix
    ./fonts.nix
    ./fzf.nix
    ./ghostty.nix
    ./git.nix
    ./go.nix
    ./kubernetes.nix
    ./lazygit.nix
    ./neovim.nix
    ./pure.nix
    ./starship.nix
    ./tmux.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  options = {
    dotfiles.home-manager.home.stateVersion = lib.mkOption {
      type = lib.types.str;
      description = "Version of Home Manager state to use.";
    };
  };

  config = {
    home = {
      stateVersion = config.dotfiles.home-manager.home.stateVersion;
      username = config.dotfiles.general.username;
      homeDirectory = config.dotfiles.general.homeDirectory;
      shell.enableZshIntegration = true;
    };
  };
}
