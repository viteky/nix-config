{den, ...}: {
  den.schema.host = {
    includes = [den.batteries.hostname];
  };

  den.default.nixos = {pkgs, ...}: {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services = {
      avahi.enable = true;
      openssh.enable = true;
      automatic-timezoned.enable = true;
      geoclue2.enable = true;
    };

    programs.nix-ld.enable = true;

    networking = {
      nameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
      networkmanager = {
        enable = true;
        plugins = with pkgs; [
          networkmanager-openvpn
          networkmanager-openconnect
        ];
      };
    };

    environment.sessionVariables.NIXOS_OZONE_WL = 1;

    boot = {
      initrd.verbose = false;
      consoleLogLevel = 3;
      plymouth.enable = true;
      supportedFilesystems = ["ntfs"];
      kernelParams = [
        "quiet"
        "rd.udev.log_level=3"
        "rd.systemd.show_status=auto"
      ];
      loader = {
        timeout = 0;
        systemd-boot.enable = true;
        systemd-boot.consoleMode = "max";
      };
    };
  };
}
