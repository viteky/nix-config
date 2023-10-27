{ inputs, outputs, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-power-menu
      rofi-screenshot
      rofi-bluetooth
    ];
    extraConfig = {
      modes = "window,drun,power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu";
    };
    theme = (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/viteky/rofi/main/theme/config1.rasi";
      sha256 = "19na02bh2y9zywv4gnmjc1cfvc5729kij5l2w3zsy6143q8g22nz";
    });
    font = "JetBrainsMono Nerd Font";
    terminal = "alacritty";
  };
}