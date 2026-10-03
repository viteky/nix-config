{
  den.aspects.desktop.noctalia = {
    nixos = {pkgs, ...}: {
      programs.noctalia = {
        enable = true;
        recommendedServices.enable = true;
      };

      services.displayManager.noctalia-greeter = {
        enable = true;
        passwordlessSyncUsers = ["jaydenv"];
        cursorTheme = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
        };
        settings = {
          output.name = "DP-2";
          idle.timeout = 300;
        };
      };
    };

    homeManager = {
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        settings = ./noctalia-config.toml;
      };
    };
  };
}
