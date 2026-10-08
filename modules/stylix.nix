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
        image = ../wallpapers/yosemite.png;
        polarity = "dark";
        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
          size = 20;
        };
        fonts = {
          monospace = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = "JetBrainsMono Nerd Font Mono";
          };
        };

        targets.fontconfig.enable = true;
        targets.qt.enable = true;
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

        targets = {
          fontconfig.enable = true;
          hyprland.enable = true;
          noctalia.enable = true;
          qt.enable = true;
          kde.enable = true;

          gtk = {
            enable = true;
            extraCss = ''
              .dialog-action-area > .text-button {
                color: @dialog_fg_color;
              }
            '';
          };

          kitty = {
            enable = true;
            colors.enable = false;
          };

          ghostty = {
            enable = true;
            colors.enable = false;
          };

          vscode = {
            enable = true;
            colors.enable = false;
          };
        };
      };
    };
  };
}
