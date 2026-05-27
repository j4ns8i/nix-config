{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.dotfiles.home-manager.fonts = {
    enable = lib.mkEnableOption "fonts";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.fonts;
    in
    lib.mkIf cfg.enable {
      home.packages = with pkgs; [
        noto-fonts-color-emoji
        jetbrains-mono
        geist-font
        roboto-mono
      ];
      fonts.fontconfig = {
        enable = true;
        defaultFonts.emoji = [
          "Noto Color Emoji"
        ];
        defaultFonts.monospace = [
          "JetBrains Mono"
          "Geist Mono"
          "Roboto Mono"
          "Noto Color Emoji"
        ];
      };
    };
}
