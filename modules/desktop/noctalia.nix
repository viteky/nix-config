{inputs, ...}: {
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
    };
  };

  flake-file.nixConfig = {
    extra-substituters = ["https://noctalia.cachix.org"];
    extra-trusted-public-keys = ["noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="];
  };

  den.aspects.desktop.noctalia = {
    nixos = {pkgs, ...}: {
      imports = [
        inputs.noctalia-greeter.nixosModules.default
        inputs.noctalia.nixosModules.default
      ];
      programs.noctalia.enable = true;
      programs.noctalia.recommendedServices.enable = true;
      programs.noctalia-greeter.enable = true;
      programs.noctalia-greeter.settings = {
        cursor = {
          theme = "Bibata-Modern-Ice";
          size = 20;
          path = "${pkgs.bibata-cursors}/share/icons";
        };
        output.name = "DP-2";
        idle.timeout = 300;
      };
    };
    homeManager = {pkgs, ...}: {
      imports = [inputs.noctalia.homeModules.default];
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
      };
    };
  };
}
