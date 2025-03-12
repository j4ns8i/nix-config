{ inputs, pkgs, ... }:

{
  wsl.enable = true;
  wsl.defaultUser = "j4ns8i";

  environment.systemPackages = with pkgs; [
    gnumake
    zlib
    gcc
    git
    tmux
    zsh
    ripgrep
    fontconfig
    jq
    htop
    fzf
    bat
    unzip
    tree
    neovim
    zoxide
    home-manager

    ghostty
  ];

  programs.fzf.keybindings = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11";

  virtualisation.docker.enable = true;

  users.users.j4ns8i.extraGroups = [ "docker" ];
}

# vim: set sw=2 :
