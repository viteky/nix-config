{den, ...}: {
  den.hosts.x86_64-linux.laptop.users.jaydenv = {};

  den.aspects.laptop = {
    includes = with den.aspects; [
      desktop
      desktop.noctalia
      stylix
      catppuccin
      tui
      development
      development.docker
      gaming
      editors.vscode
      editors.nvf
      secureBoot
    ];

    nixos = {
      config,
      pkgs,
      ...
    }: {
      environment.systemPackages = [pkgs.displaylink];
      services = {
        xserver.videoDrivers = ["displaylink"];
        upower.enable = true;
        logind.settings.Login = {
          HandleLidSwitch = "suspend-then-hibernate";
          HandleLidSwitcExternalPower = "lock";
          HandleLidSwitchDocked = "ignore";
          HandlePowerKey = "ignore";
        };
      };
    };
  };
}
