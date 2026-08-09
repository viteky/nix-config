{den, ...}: {
  den.schema.host = {
    includes = [den.batteries.hostname];
  };

  den.default.nixos = {pkgs, ...}: {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.avahi.enable = true;
    services.openssh.enable = true;

    programs.nix-ld.enable = true;

    networking = {
      nameservers = ["1.1.1.1" "1.0.0.1"];
      networkmanager = {
        enable = true;
        # dns = "systemd-resolved";
        plugins = with pkgs; [
          networkmanager-fortisslvpn
          networkmanager-openvpn
          networkmanager-openconnect
        ];
      };
    };

    # services.resolved.enable = true;

    environment.sessionVariables.NIXOS_OZONE_WL = 1;

    boot = {
      # consoleLogLevel = 3;
      initrd.verbose = false;
      plymouth.enable = true;
      supportedFilesystems = ["ntfs"];
      kernelParams = ["quiet"];
      loader.limine = {
        enable = true;
        secureBoot.enable = true;
        style.interface.helpHidden = true;
      };
    };
  };
}
