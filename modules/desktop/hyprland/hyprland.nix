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
        # settings = {
        #   config = {
        #
        #     input = {
        #       touchpad = {
        #         disable_while_typing = true;
        #         drag_lock = 1;
        #         natural_scroll = true;
        #       };
        #     };
        #
        #     binds = {
        #       hide_special_on_workspace_change = true;
        #     };
        #
        #     cursor = {
        #       default_monitor = "DP-2";
        #       inactive_timeout = 3;
        #     };
        #
        #     workspace = [
        #       "special:btop,on-created-empty:${userSettings.terminal} -e btop"
        #       "m[DP-1],layoutopt:orientation:top"
        #       "special:game,monitor:DP-2"
        #     ];
        #
        #     monitor = [
        #       "desc:ASUSTek COMPUTER INC VG279QM L9LMQS114293,highrr,auto-right,1"
        #       "desc:ASUSTek COMPUTER INC VG27A LBLMQS262134,highrr,auto-left,1,transform,1"
        #       "eDP-1,preferred,auto,1.25"
        #       ",preferred,auto,1"
        #     ];
        #
        #     windowrule = let
        #       floatCenterClasses = [
        #         "MainPicker"
        #         "file-roller"
        #         "org.gnome.Calculator"
        #         "org.gnome.FileRoller"
        #         "org.gnome.Nautilus"
        #         "org.pulseaudio.pavucontrol"
        #         "org.quickshell"
        #         "xdg-desktop-portal-gtk"
        #         "zoom"
        #       ];
        #       floatCenterRules = map (c: "float on, center on, match:class ^(${c})\$") floatCenterClasses;
        #     in
        #       [
        #         # "no_blur on, match:class ^()$, match:title ^()$"
        #         "workspace 1, match:class ^firefox|chromium-browser|.*qutebrowser.*$"
        #         "workspace 2, match:class ^code$"
        #         "workspace 3, match:class ^vesktop|Slack|.*telegram.*$"
        #         "workspace 4, match:class ^obsidian|libreoffice.*$"
        #         "workspace 5, match:class ^spotify$"
        #         "workspace 6, match:class ^([Ss]team*)$"
        #         "stay_focused on, match:class ^(pinentry-.*)$"
        #         "fullscreen on, immediate yes, match:class ^(steam_app.*|.*gamescope.*)$"
        #         "center on, match:class .*"
        #         "idle_inhibit fullscreen, match:class .*"
        #         "max_size (window_w*0.9) (window_h*0.9)-20), match:class .*"
        #         "workspace special:game, match:class ^(.*gamescope.*|steam_app_.*|cs2|.*RetroArch)$"
        #       ]
        #       ++ floatCenterRules;
        #
        #     bind =
        #       [
        #         "$mod,g,togglespecialworkspace,game"
        #         "$mod, t, togglefloating"
        #         "$mod,ESCAPE,togglespecialworkspace,btop"
        #       ];

        #
        #     bindl = [
        #       ",switch:on:Lid Switch, exec, hyprctl keyword monitor eDP-1,disable"
        #       ",switch:off:Lid Switch, exec, hyprctl keyword monitor eDP-1,preferred,auto,1.25"
        #     ];
        #
        #     exec-once = [
        #       "systemctl --user import-environment PATH && systemctl --user restart xdg-desktop-portal.service"
        #     ];
        #
        #   };
        # };
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
