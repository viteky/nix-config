{ inputs, outputs, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
    ];
    font = "JetBrainsMono Nerd Font";
  };
}