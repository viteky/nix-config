{
  den.aspects.virtualisation = {
    nixos = {pkgs, ...}: {
      programs.virt-manager.enable = true;
      virtualisation = {
        spiceUSBRedirection.enable = true;
        libvirtd = {
          enable = true;
          qemu = {
            swtpm.enable = true;
            vhostUserPackages = with pkgs; [virtiofsd];
          };
        };
      };

      environment.systemPackages = with pkgs; [
        virt-viewer
        dnsmasq
      ];
    };

    homeManager = {
      dconf.settings = {
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = ["qemu:///system"];
          uris = ["qemu:///system"];
        };
      };
    };

    provides.to-users = {user, ...}: {
      user.extraGroups = ["libvirtd"];
    };
  };
}
