{den, ...}: {
  den.aspects.nvidia = {
    includes = [
      (den.batteries.unfree [
        "nvidia-x11"
        "nvidia-settings"
        "nvidia-kernel-modules"
      ])
    ];
    nixos = {config, ...}: {
      services.xserver.videoDrivers = ["nvidia"];

      hardware.nvidia = {
        open = false;
        package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
        powerManagement = {
          enable = true;
          finegrained = false;
        };
      };
    };
  };
}
