{ config, lib, setupCfg, ... }:
{
  options = {
    nix-config.common.setHostname = lib.mkEnableOption "Set hostname when configuring system";
  };

  config = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    networking = lib.mkIf config.nix-config.common.setHostname {
      hostName = setupCfg.hostname;
    };
  };
}
