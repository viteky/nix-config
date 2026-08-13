{
  den.aspects.desktop = {
    nixos = {
      programs.hyprland = {
        enable = true;
        withUWSM = true;
      };
    };

    homeManager = {
      pkgs,
      config,
      ...
    }: {
      wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        portalPackage = null;
        configType = "lua";
        systemd.variables = ["--all"];
        systemd.enableXdgAutostart = true;
        systemd.enable = false;
        extraLuaFiles = {
          "config.lua" = {
            content = ./config.lua;
            autoLoad = true;
          };
        };
      };

      xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";

      xdg.portal = {
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-wlr
        ];
        # config.common.default = "*";
      };

      home.packages = with pkgs; [
        wl-clipboard
      ];
    };
  };
}
