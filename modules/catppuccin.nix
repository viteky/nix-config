{inputs, ...}: {
  flake-file.inputs = {
    catppuccin.url = "github:catppuccin/nix";
  };

  den.aspects.catppuccin = let
    flavor = "macchiato";
    accent = "blue";
  in {
    nixos = {
      imports = [
        inputs.catppuccin.nixosModules.catppuccin
      ];

      catppuccin = {
        enable = true;
        inherit flavor accent;
        cache.enable = true;
        gtk.icon.enable = false;
        plymouth.enable = false;
      };
    };

    homeManager = {
      imports = [
        inputs.catppuccin.homeModules.catppuccin
      ];

      catppuccin = {
        enable = true;
        inherit flavor accent;
        gtk.icon.enable = false;
        firefox.force = true;
        thunderbird.profile = "default";
      };
    };
  };
}
