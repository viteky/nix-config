{pkgs, ...}: {
  den.aspects.desktop = {
    nixos.environment.systemPackages = with pkgs; [];
  };
}
