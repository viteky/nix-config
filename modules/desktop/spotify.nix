{inputs, ...}: {
  flake-file.inputs.spicetify-nix = {
    url = "github:Gerg-L/spicetify-nix";
  };

  den.aspects.desktop = {
    homeManager = {pkgs, ...}: {
      imports = [inputs.spicetify-nix.homeManagerModules.default];

      programs.spicetify = let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
      in {
        enable = true;
        windowManagerPatch = true;
        theme = spicePkgs.themes.catppuccin;
        colorScheme = "macchiato";
        enabledExtensions = with spicePkgs.extensions; [
          adblock
          shuffle
          popupLyrics
        ];
      };
    };
  };
}
