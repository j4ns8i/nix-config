{ config, lib, ... }:
{
  options.dotfiles.home-manager.firefox = {
    enable = lib.mkEnableOption "firefox";
  };

  config =
    let
      cfg = config.dotfiles.home-manager.firefox;
    in
    lib.mkIf cfg.enable {
      programs.firefox = {
        enable = true;
        policies = {
          Preferences = {
            "general.autoScroll" = true;
            "app.shield.optoutstudies.enabled" = false;
            "browser.aboutConfig.showWarning" = false;
            "browser.discovery.enabled" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.urlbar.showSearchSuggestionsFirst" = false;
            "signon.rememberSignons" = false;
          };
          # See https://mozilla.github.io/policy-templates/#extensionsettings for format.
          # TL;DR to get key, curl https://addons.mozilla.org/api/v5/addons/addon/<slug> | jq .guid
          ExtensionSettings = {
            "uBlock0@raymondhill.net" = {
              installation_mode = "normal_installed";
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            };
            "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
              installation_mode = "normal_installed";
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            };
          };
        };
      };
    };
}
