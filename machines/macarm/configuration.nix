{ self, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    neovim
    home-manager

    zlib
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
      "graphite2"
      "graphviz"
      "grep"
      "grip"
      "gts"
      "harfbuzz"
      "helm"
      "highway"
      "icu4c@76"
      "imath"
      "jasper"
      "jpeg-turbo"
      "jpeg-xl"
      "k3d"
      "kubectx"
      "kubernetes-cli"
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
      "luacheck"
      "luajit"
      "luv"
      "lz4"
      "lzo"
      "m4"
      "mpdecimal"
      "msgpack"
      "netpbm"
      "openexr"
      "openssl@3"
      "pango"
      "pcre2"
      "pipx"
      "pixman"
      "pkg-config"
      "podman"
      "postgresql@14"
      "pyenv"
      "python-packaging"
      "python@3.12"
      "python@3.13"
      "readline"
      "redis"
      "sops"
      "sqlite"
      "stylua"
      "tfenv"
      "tilt"
      "tree-sitter"
      "unibilium"
      "watch"
      "webp"
      "xorgproto"
      "xxhash"
      "xz"
      "yq"
      "zstd"
    ];

    taps = [
      "oven-sh/bun"
    ];

    casks = [
      "alacritty"
      "kitty"
      "obsidian"
      "slack"
      "spotify"
    ];
  };

  programs.zsh = {
    enable = true;
    loginShellInit = "eval \"$(/opt/homebrew/bin/brew shellenv)\"";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  nix.settings.trusted-users = [ "root" "justin.smalkowski" ];

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
