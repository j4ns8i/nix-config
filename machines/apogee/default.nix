{ pkgs, ... }:
{
  dotfiles = {
    general = rec {
      username = "justin.smalkowski";
      homeDirectory = "/Users/${username}";
      hostname = "justin.smalkowski-YJ0VNX32G2";
      root = "${homeDirectory}/code/src/github.com/j4ns8i/nix-config";
    };

    home-manager = {
      home.stateVersion = "25.11";

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

    nix-darwin = {
      system.stateVersion = 5;
      systemPackages = with pkgs; [
        neovim
        home-manager

        libiconv
        zlib
        gnumake
        unzip
        xdg-utils
      ];

      homebrew = {
        enable = true;
        onActivation = {
          cleanup = "uninstall";
          extraFlags = [ "--force-cleanup" ];
        };
        brews = [
          "bun"
          "coreutils"
          "ctags"
          "delta"
          "ffmpeg"
          "file"
          "git-cliff"
          "glab"
          "go"
          "gomplate"
          "graphviz"
          "grip"
          "helm"
          "htop"
          "httpie"
          "jira-cli"
          "jq"
          "libiconv"
          "libvterm"
          "lpeg"
          "lua"
          "lua-language-server"
          "luacheck"
          "luajit"
          "luv"
          "msgpack"
          "node"
          "pipx"
          "pnpm"
          "podman"
          "pyenv"
          "python@3.12"
          "python@3.13"
          "python@3.14"
          "readline"
          "redis"
          "ripgrep"
          "rustup"
          "socat"
          "sops"
          "sqlite"
          "stylua"
          "tfenv"
          "tilt"
          "tree"
          "tree-sitter"
          "uv"
          "watch"
          "xxhash"
          "xz"
          "yamllint"
          "yazi"
          "yq"
          "yt-dlp"
          "zstd"
        ];

        taps = [
          "oven-sh/bun"
        ];

        casks = [
          "betterdisplay"
          "ghostty"
          "obsidian"
          "slack"
          "spotify"
        ];
      };
    };
  };
}
