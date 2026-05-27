{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.ghostty.enable = lib.mkEnableOption "ghostty";
  config =
    let
      cfg = config.dotfiles.home-manager.ghostty;
      osToml = if pkgs.stdenv.isDarwin then "darwin.toml" else "nixos.toml";
      root = config.dotfiles.general.root;
    in
    lib.mkIf cfg.enable {
      home.file.".config/ghostty/config".source =
        config.lib.file.mkOutOfStoreSymlink "${root}/config/ghostty/config";
      home.file.".config/ghostty/os.toml".source =
        config.lib.file.mkOutOfStoreSymlink "${root}/config/ghostty/${osToml}";
      home.file.".config/ghostty/themes/catppuccin".source = fetchGit {
        url = "https://github.com/catppuccin/ghostty";
        rev = "9e38fc2b4e76d4ed5ff9edc5ac9e4081c7ce6ba6";
      };
      home.file.".config/ghostty/themes/catppuccin-mocha".source =
        config.lib.file.mkOutOfStoreSymlink "${root}/config/ghostty/themes/catppuccin/themes/catppuccin-mocha.conf";
      home.file.".config/ghostty/themes/black-metal-nile".source =
        config.lib.file.mkOutOfStoreSymlink "${root}/config/ghostty/black-metal-nile";
    };
}
