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
    };

    programs.nix-ld.enable = true;

    networking = {
      nameservers = ["1.1.1.1" "1.0.0.1"];
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
      plymouth.enable = true;
      supportedFilesystems = ["ntfs"];
      loader.systemd-boot.enable = true;
      loader.systemd-boot.consoleMode = "max";
    };
  };
}
