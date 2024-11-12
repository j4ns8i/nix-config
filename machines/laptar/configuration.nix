# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."luks-e36709a4-36aa-4551-b6db-f007b53a82c6".device = "/dev/disk/by-uuid/e36709a4-36aa-4551-b6db-f007b53a82c6";

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Display Manager / Desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome = {
    enable = true;
    extraGSettingsOverrides = ''
      [org.gnome.desktop.peripherals.keyboard]
      repeat-interval=30
      delay=220

      [org.gnome.desktop.input-sources]
      xkb-options=['terminate:ctrl_alt_bksp','caps:swapescape']

      [org.gnome.desktop.interface]
      color-scheme='prefer-dark'
      font-name='Public Sans 12'
      document-font-name='Public Sans 11'

      [org.gnome.desktop.background]
      picture-uri-dark='${pkgs.gnome-backgrounds}/share/backgrounds/gnome/amber-d.jxl'
      picture-uri='${pkgs.gnome-backgrounds}/share/backgrounds/gnome/amber-l.jxl'

      [org.gnome.shell]
      favorite-apps=['firefox.desktop','Alacritty.desktop','org.gnome.Calendar.desktop','org.gnome.Nautilus.desktop','org.gnome.Settings.desktop']
    '';
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # TODO: this has no effect
  # services.xserver.autoRepeatDelay = 220;
  # services.xserver.autoRepeatInterval = 30;

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.j4ns8i = {
    isNormalUser = true;
    description = "Justin Smalkowski";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Enable automatic login for the user.
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = "j4ns8i";
    };
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # terminal utilities
    efibootmgr
    gnumake
    zlib
    gcc
    git
    tmux
    zsh
    ripgrep
    fontconfig
    jq
    htop
    fzf
    bat
    unzip
    tree
    numlockx
    neovim
    zoxide
    home-manager

    # apps
    alacritty
    firefox
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    commit-mono
    jetbrains-mono
    fira-code-nerdfont

    # system sans-serif typefaces
    public-sans
    inter
  ];

  programs.fzf.keybindings = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}

# vim: set sw=2 :
