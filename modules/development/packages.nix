{
  den.aspects.development = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [devenv];
    };
  };
}
