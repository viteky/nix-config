# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../common
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];



  # Hostname
  networking.hostName = "laptop";

  programs.light.enable = true;
  
  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Trackpad
  services.xserver.libinput = {
    enable = true;
    touchpad.naturalScrolling = false;
    touchpad.disableWhileTyping = true;
  };

}
