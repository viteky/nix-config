{inputs, ...}: {
  flake-file.inputs = {
    catppuccin.url = "github:catppuccin/nix";
  };

  den.aspects.catppuccin = {
    nixos = {pkgs, ...}: {
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

      fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        noto-fonts-color-emoji
      ];

      fonts.fontconfig = {
        enable = true;
        defaultFonts = {
          monospace = ["JetBrainsMono Nerd Font"];
          emoji = ["Noto Color Emoji"];
        };
      };
    };

    homeManager = {pkgs, config, ...}: {
      imports = [
        inputs.catppuccin.homeModules.catppuccin
      ];

      catppuccin = {
        enable = true;
        autoEnable = true;
        flavor = "macchiato";
        accent = "blue";
        gtk.icon.enable = false;
      };
    };
  };
}
