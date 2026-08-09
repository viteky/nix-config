{
  den.aspects.gaming = {
    nixos = {pkgs, ...}: {
      programs = {
        gamemode.enable = true;
        steam = {
          enable = true;
          remotePlay.openFirewall = true;
          localNetworkGameTransfers.openFirewall = true;
          extest.enable = true;
          extraCompatPackages = with pkgs; [proton-ge-bin];
        };

        gamescope = {
          enable = true;
          capSysNice = false;
          args = [
            "--force-grab-cursor"
            "-r 280"
            "-W 1920"
            "-H 1080"
            "--force-composition"
            "--fullscreen"
          ];
        };
      };
    };

    homeManager = {
      pkgs,
      osConfig,
      ...
    }: {
      programs = {
        mangohud.enable = true;
        lutris = {
          enable = false;
          defaultWinePackage = pkgs.proton-ge-bin;
          extraPackages = with pkgs; [gamescope mangohud gamemode];
          protonPackages = with pkgs; [proton-ge-bin];
          steamPackage = osConfig.programs.steam.package;
        };

        retroarch = {
          enable = true;
          cores = {
            mgba.enable = true;
            snes9x.enable = true;
            desmume.enable = true;
            mupen64plus.enable = true;
            dolphin.enable = true;
          };
        };
      };
    };
  };
}
