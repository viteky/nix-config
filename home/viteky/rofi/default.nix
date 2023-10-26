{ inputs, outputs, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-power-menu
      rofi-screenshot
      rofi-bluetooth
    ];
    theme = (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/dracula/rofi/main/theme/config1.rasi";
      sha256 = "16n9kcih5h1z21781yc846ym4pnz4vm1pmq4lskikfabqkbnvwjj";
    });
    terminal = "alacritty";
  };
}