{ pkgs, ... }:
{
  dotfiles = {
    general = rec {
      username = "justinsmalkowski";
      homeDirectory = "/Users/${username}";
      hostname = "yuzu";
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
        onActivation.cleanup = "uninstall";
        brews = [
          "aom"
          "autoconf"
          "brotli"
          "bun"
          "ca-certificates"
          "cairo"
          "certifi"
          "coreutils"
          "ctags"
          "delta"
          "ffmpeg"
          "file"
          "fontconfig"
          "freetype"
          "fribidi"
          "gd"
          "gdk-pixbuf"
          "gettext"
          "giflib"
          "git-cliff"
          "glab"
          "glib"
          "gmp"
          "go"
          "gomplate"
          "graphite2"
          "graphviz"
          "grep"
          "grip"
          "gts"
          "harfbuzz"
          "helm"
          "highway"
          "htop"
          "httpie"
          "icu4c@76"
          "imath"
          "jasper"
          "jpeg-turbo"
          "jpeg-xl"
          "jq"
          "libavif"
          "libdeflate"
          "libgit2"
          "libiconv"
          "libpng"
          "librsvg"
          "libssh2"
          "libtiff"
          "libtool"
          "libunistring"
          "libuv"
          "libvmaf"
          "libvterm"
          "libx11"
          "libxau"
          "libxcb"
          "libxdmcp"
          "libxext"
          "libxrender"
          "little-cms2"
          "lpeg"
          "lua"
          "lua-language-server"
          "luacheck"
          "luajit"
          "luv"
          "lz4"
          "lzo"
          "m4"
          "mpdecimal"
          "msgpack"
          "netpbm"
          "nixfmt"
          "node"
          "openexr"
          "openssl@3"
          "pango"
          "pcre2"
          "pipx"
          "pixman"
          "pkg-config"
          "pnpm"
          "podman"
          "postgresql@14"
          "pyenv"
          "python-packaging"
          "python@3.12"
          "python@3.13"
          "readline"
          "redis"
          "ripgrep"
          "rustup"
          "sops"
          "sqlite"
          "stylua"
          "tfenv"
          "tilt"
          "tree"
          "tree-sitter"
          "unibilium"
          "uv"
          "watch"
          "webp"
          "xorgproto"
          "xxhash"
          "xz"
          "yazi"
          "yq"
          "yt-dlp"
          "zstd"
        ];

        taps = [
          "oven-sh/bun"
        ];

        casks = [
          "discord"
          "ghostty"
          "linear"
          "obsidian"
          "slack"
          "spotify"
          "betterdisplay"
        ];
      };
    };
  };
}
