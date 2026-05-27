{
  inputs,
  config,
  lib,
  system,
  ...
}:
{
  options.dotfiles.nix-darwin = {
    homebrew = lib.mkOption {
      description = ''
        Homebrew settings

        See https://mynixos.com/nix-darwin/options/homebrew
      '';
    };
  };

  config =
    let
      username = config.dotfiles.general.username;
    in
    {
      environment.systemPackages = config.dotfiles.nix-darwin.systemPackages;

      homebrew = config.dotfiles.nix-darwin.homebrew;

      programs.zsh = {
        enable = true;
        enableGlobalCompInit = false;
        enableBashCompletion = false;
      };

      nix.settings.experimental-features = "nix-command flakes";

      system.primaryUser = username;

      users.users.${username} = {
        home = "/Users/${username}";
        name = username;
      };

      # Set Git commit hash for darwin-version.
      system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = config.dotfiles.nix-darwin.system.stateVersion;

      # The platform the configuration will be used on.
      # nixpkgs.hostPlatform = "aarch64-darwin";
      nixpkgs.hostPlatform = system;
    };
}
