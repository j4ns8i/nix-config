{
  dotfiles = {
    general = rec {
      username = "j4ns8i";
      homeDirectory = "/home/${username}";
      hostname = "laptar-2";
    };

    home-manager = {
      home.stateVersion = "26.05";

      bat.enable = true;
      bun.enable = true;
      direnv.enable = true;
      fd.enable = true;
      firefox.enable = true;
      fonts.enable = true;
      fzf.enable = true;
      ghostty.enable = true;
      git.enable = true;
      kubernetes.enable = true;
      lazygit.enable = true;
      neovim.enable = true;
      pure.enable = true;
      tmux.enable = true;
      zoxide.enable = true;
      zsh.enable = true;
    };
  };
}
