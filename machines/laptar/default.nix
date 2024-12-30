{
  imports = [
    ./configuration.nix
    ./hardware-configuration.nix
  ];

  config.nix-config.common.setHostname = true;
}
