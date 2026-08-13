{inputs, ...}: {
  flake-file.inputs = {
    catppuccin.url = "github:catppuccin/nix";
  };

  den.aspects.catppuccin = {
    nixos = {
      imports = [
        inputs.catppuccin.nixosModules.catppuccin
      ];

      catppuccin = {
        enable = true;
        autoEnable = true;
        flavor = "macchiato";
        accent = "blue";
        cache.enable = true;
        gtk.icon.enable = false;
      };
    };

    homeManager = {
      imports = [
        inputs.catppuccin.homeModules.catppuccin
      ];

      catppuccin = {
        enable = true;
        autoEnable = true;
        flavor = "macchiato";
        accent = "blue";
        gtk.icon.enable = false;
        firefox.force = true;
        thunderbird.profile = "default";
      };
    };
  };
}
