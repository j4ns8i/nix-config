# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  interfaceEthName = "enp4s0f3u1c2";
  interfaceWifiName = "wlp3s0";
  zWaveDeviceUnit = "dev-serial-by\\x2did-usb\\x2dNabu_Casa_ZWA\\x2d2_80B54EE0D590\\x2dif00.device";
  zigbeeDeviceUnit = "dev-serial-by\\x2did-usb\\x2dNabu_Casa_ZBT\\x2d2_DCB4D910E280\\x2dif00.device";
in
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.ensureProfiles.profiles = {
    br0 = {
      connection = {
        id = "br0";
        type = "bridge";
        interface-name = "br0";
        autoconnect = true;
        autoconnect-priority = 100;
        autoconnect-slaves = 1;
      };
      bridge = { };
      ipv4.method = "disabled";
      ipv6.method = "ignore";
    };
    "br0-slave-${interfaceEthName}" = {
      connection = {
        id = "br0-slave-${interfaceEthName}";
        type = "ethernet";
        interface-name = interfaceEthName;
        master = "br0";
        slave-type = "bridge";
        autoconnect = true;
        autoconnect-priority = 100;
      };
      ethernet = { };
      ipv4.method = "disabled";
      ipv6.method = "ignore";
    };
    "Wired connection 1" = {
      connection = {
        id = "Wired connection 1";
        interface-name = interfaceEthName;
        autoconnect = false;
        type = "ethernet";
      };
    };
    wifi = {
      connection = {
        id = "${interfaceWifiName}";
        type = "wifi";
        interface-name = interfaceWifiName;
        autoconnect = true;
        autoconnect-priority = 10;
      };
      ipv4.route-metric = 600;
      ipv6.route-metric = 600;
    };
  };

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
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome = {
    enable = true;

    extraGSettingsOverrides = ''
      [org.gnome.desktop.peripherals.keyboard]
      repeat-interval=30
      delay=220

      [org.gnome.desktop.interface]
      color-scheme='prefer-dark'
      font-name='Public Sans 12'
      document-font-name='Public Sans 11'

      [org.gnome.desktop.background]
      picture-uri-dark='${pkgs.gnome-backgrounds}/share/backgrounds/gnome/amber-d.jxl'
      picture-uri='${pkgs.gnome-backgrounds}/share/backgrounds/gnome/amber-l.jxl'

      [org.gnome.shell]
      favorite-apps=['firefox.desktop','com.mitchellh.ghostty.desktop','org.gnome.Calendar.desktop','org.gnome.Nautilus.desktop','org.gnome.Settings.desktop']
    '';
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "esc";
          };
        };
      };
    };
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
  services.pulseaudio.enable = false;
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
  users.users."${config.dotfiles.general.username}" = {
    isNormalUser = true;
    description = "Justin Smalkowski";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

  # Enable automatic login for the user.
  services.displayManager = {
    autoLogin = {
      enable = true;
      user = config.dotfiles.general.username;
    };
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

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
    delta
    uv
    go
    rustup
    busybox
    tree-sitter
    pnpm
    nodejs
    tlp
    file
    opencode

    # apps
    firefox

    ghostty
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    commit-mono
    jetbrains-mono
    nerd-fonts.fira-code

    # system sans-serif typefaces
    public-sans
    inter
  ];

  programs.fzf.keybindings = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  environment.sessionVariables.LIBVIRT_DEFAULT_URI = "qemu:///system";

  services.mullvad-vpn = {
    enable = true;
    gui.enable = true;
  };

  virtualisation.libvirtd = {
    enable = true;
    onShutdown = "shutdown";
  };
  programs.virt-manager.enable = true;

  systemd.services.libvirt-guests = {
    overrideStrategy = "asDropinIfExists";
    environment = {
      URIS = "default qemu:///system";
    };
    wants = [
      zWaveDeviceUnit
      zigbeeDeviceUnit
      "network-online.target"
    ];
    after = [
      zWaveDeviceUnit
      zigbeeDeviceUnit
    ];
  };

  networking.firewall.trustedInterfaces = [
    "virbr0"
    "br0"
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

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

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings.trusted-users = [
    "root"
    config.dotfiles.general.username
  ];

  networking.hostName = config.dotfiles.general.hostname;

}

# vim: set sw=2 :
