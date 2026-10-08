{
  den.aspects.laptop.nixos = {
    config,
    lib,
    pkgs,
    modulesPath,
    ...
  }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = ["xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci"];
    boot.initrd.kernelModules = ["evdi"];
    boot.kernelModules = ["kvm-intel"];
    boot.extraModulePackages = [config.boot.kernelPackages.evdi];

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/961ac43e-d4aa-46b4-b0c0-e171733df3bb";
      fsType = "btrfs";
    };

    fileSystems."/home" = {
      device = "/dev/disk/by-uuid/961ac43e-d4aa-46b4-b0c0-e171733df3bb";
      fsType = "btrfs";
      options = ["subvol=home"];
    };

    fileSystems."/nix" = {
      device = "/dev/disk/by-uuid/961ac43e-d4aa-46b4-b0c0-e171733df3bb";
      fsType = "btrfs";
      options = ["subvol=nix"];
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/75F7-3831";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/b8bbe01e-7668-4eb2-8125-595cdc05dc99";}
    ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
