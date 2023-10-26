{ pkgs, config, ...}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        "TERM" = "xterm-256color";
      };

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
        };
      };
      
      window.opacity = 0.9;

      window = {
        padding.x = 5;
        padding.y = 5;
      };
      colors = {
        primary = {
          background = "#${config.colorScheme.colors.base00}";
          foreground = "#${config.colorScheme.colors.base05}";
        };
        cursor = {
          text = "#${config.colorScheme.colors.base00}";
          cursor = "#${config.colorScheme.colors.base05}";
        };
        vi_mode_cursor = {
          text = "#${config.colorScheme.colors.base00}";
          cursor = "#${config.colorScheme.colors.base05}";
        };
        selection = {
          text = "CellForeground";
          background = "#${config.colorScheme.colors.base01}";
        };
        search = {
          matches = {
            foreground = "CellBackground";
            background = "#${config.colorScheme.colors.base01}";
          };
          footer_bar = {
            background = "#${config.colorScheme.colors.base00}";
            foreground = "#${config.colorScheme.colors.base05}";
          };
        };
        normal = {
          black = "#${config.colorScheme.colors.base01}";
          red = "#${config.colorScheme.colors.base08}";
          green = "#${config.colorScheme.colors.base0A}";
          yellow = "#${config.colorScheme.colors.base0B}";
          blue = "#${config.colorScheme.colors.base0D}";
          magenta = "#${config.colorScheme.colors.base0E}";
          cyan = "#${config.colorScheme.colors.base0C}";
          white = "#${config.colorScheme.colors.base05}";
        };
        bright = {
          black = "#${config.colorScheme.colors.base03}";
          red = "#${config.colorScheme.colors.base08}";
          green = "#${config.colorScheme.colors.base0A}";
          yellow = "#${config.colorScheme.colors.base0B}";
          blue = "#${config.colorScheme.colors.base0D}";
          magenta = "#${config.colorScheme.colors.base0E}";
          cyan = "#${config.colorScheme.colors.base0C}";
          white = "#${config.colorScheme.colors.base07}";
        };
      };

    };
  };
}
