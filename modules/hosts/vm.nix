# enables `nix run .#vm`. it is very useful to have a VM
# you can edit your config and launch the VM to test stuff
# instead of having to reboot each time.
{
  inputs,
  den,
  ...
}: {
  den.hosts.x86_64-linux.igloo = {
    users.jaydenv = {};
  };

  den.aspects.igloo.nixos = {
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
    virtualisation.vmVariant = {
      virtualisation.cores = 4;
      virtualisation.memorySize = 4096;
    };

    fileSystems."/" = {
      device = "/dev/vda";
      fsType = "ext4";
    };
  };

  den.aspects.igloo.includes = [
    den.aspects.desktop
    den.aspects.catppuccin
    den.aspects.desktop.noctalia
  ];

  perSystem = {pkgs, ...}: {
    packages.vm = pkgs.writeShellApplication {
      name = "vm";
      text = let
        host = inputs.self.nixosConfigurations.igloo.config;
      in ''
        ${host.system.build.vm}/bin/run-${host.networking.hostName}-vm "$@"
      '';
    };
  };
}
