{
  den.hosts.x86_64-linux.laptop.users.jaydenv = {};

  den.aspects.laptop = {
    nixos = {
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
