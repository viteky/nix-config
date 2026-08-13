{
  den.aspects.development = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [devenv];
    };

    homeManager = {
      programs.gh.enable = true;
      programs.java.enable = true;
    };
  };
}
