{inputs, pkgs, ...}:
{
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    xwayland = true;
  
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty"; 
      menu = "wofi --show drun --show-icons";      
      bars = [];
      
      gaps = {
        inner = 10;
        outer = 10;
      };

      focus = {
        followMouse = "no";
      };

      window = {
        border = 3;
        titlebar = false;
      };

      fonts = {
        names = ["JetBrainsMono Nerd Font"];
        size = 10.0;
      };
      startup = [  
        {command = "waybar &";}
        {command = "autotiling-rs &";}
        {command = "swayosd &";}
      ];

    };
    extraConfig = ''
      corner_radius 6
      blur enable
      input * {
        tap enabled
        natural_scroll enable
        accel_profile "flat"
        pointer_accel 1
      }
      
    '';
  };
}