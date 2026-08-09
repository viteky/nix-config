{inputs, ...}: {
  flake-file.inputs = {
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.stylix = {
    nixos = {pkgs, ...}: {
      imports = [inputs.stylix.nixosModules.default];
      stylix = {
        enable = true;
        autoEnable = false;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
        image = ../wallpapers/keyboards.jpg;
        polarity = "dark";
        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
          size = 20;
        };
        fonts = {
          monospace = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = "JetBrainsMono Nerd Font";
          };
        };
      };
    };

    homeManager = {pkgs, ...}: {
      stylix = {
        enable = true;
        autoEnable = false;
        icons = {
          enable = true;
          package = pkgs.papirus-icon-theme;
          dark = "Papirus-Dark";
          light = "Papirus-Light";
        };
        targets.gtk.extraCss = ''
          .dialog-action-area > .text-button {
            color: @dialog_fg_color;
          }
        '';
        targets.gtk.enable = true;
        targets.dank-material-shell.enable = true;
        targets.dank-calendar.enable = true;
      };
    };
  };
}
