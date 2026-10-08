{
  den.aspects.desktop.noctalia = {
    nixos = {pkgs, ...}: {
      programs.noctalia = {
        enable = true;
        recommendedServices.enable = true;
      };

      services.displayManager.noctalia-greeter = {
        enable = true;
        passwordlessSyncUsers = ["jaydenv"];
        cursorTheme = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
        };
        settings = {
          output.name = "DP-2";
          idle.timeout = 300;
        };
      };
    };

    homeManager = {
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        settings = {
          bar = {
            default = {
              capsule = true;
              center = [
                "notifications"
                "clock"
                "weather"
              ];
              concave_edge_corners = false;
              end = [
                "media"
                "tray"
                "group:g1"
              ];
              margin_edge = 0;
              margin_ends = 0;
              radius = 0;
              start = [
                "launcher"
                "workspaces"
                "active_window"
                "nix-monitor"
              ];
              capsule_group = [
                {
                  accordion = false;
                  accordion_direction = "end";
                  enabled = true;
                  fill = "surface_variant";
                  id = "g1";
                  members = [
                    "network"
                    "bluetooth"
                    "volume"
                    "brightness"
                    "session"
                  ];
                  opacity = 1.0;
                  padding = 6.0;
                }
              ];
            };
          };
          calendar = {
            enabled = true;
            account = {
              personal_google = {
                type = "google";
              };
            };
          };
          config = {
          };
          control_center = {
            width = 800;
          };
          dock = {
            active_monitor_only = true;
            auto_hide = true;
            enabled = true;
            icon_size = 32;
            launcher_position = "start";
            pinned = [
              "firefox"
              "kitty"
              "code"
            ];
            reserve_space = false;
            show_dots = true;
          };
          idle = {
            behavior_order = [
              "lock"
              "screen-off"
              "lock-and-suspend"
            ];
            behavior = {
              lock = {
                action = "lock";
                enabled = true;
                timeout = 600.0;
              };
              lock-and-suspend = {
                action = "lock_and_suspend";
                enabled = true;
                timeout = 900.0;
              };
              screen-off = {
                action = "screen_off";
                enabled = true;
                timeout = 660.0;
              };
            };
          };
          location = {
            auto_locate = true;
          };
          nightlight = {
            enabled = true;
          };
          osd = {
            position = "bottom_center";
            kinds = {
              media = false;
            };
          };
          plugins = {
            enabled = [
              "noctalia/bitwarden"
              "kenn/keybind-cheatsheet"
              "icefish/phone-connect"
              "avivbintangaringga/nix-monitor"
            ];
          };
          shell = {
            launch_apps_as_systemd_services = true;
            launch_apps_custom_command = "uwsm app -- $CMD";
            polkit_agent = true;
            time_format = "{:%I:%M %p}";
            greeter_sync = {
              auto_sync = true;
            };
            launcher = {
              categories = false;
              compact = true;
              providers = {
                calculator = {
                  global = false;
                };
              };
            };
            panel = {
              open_near_click_session = true;
              session_position = "center";
            };
          };
          widget = {
            active_window = {
              interactive = false;
            };
            brightness = {
              show_label = false;
            };
            clock = {
              anchor = true;
              format = "{:%I:%M %p}";
            };
            media = {
              hide_when_no_media = true;
            };
            network = {
              show_label = false;
              show_vpn_label = true;
            };
            nix-monitor = {
              type = "avivbintangaringga/nix-monitor:nix-monitor";
            };
            taskbar = {
              group_single_icon_per_app = true;
              hide_empty_workspaces = true;
              show_all_outputs = true;
            };
            tray = {
              drawer = true;
            };
            volume = {
              show_label = false;
            };
            weather = {
              show_condition = false;
            };
            workspaces = {
              label_source = "name";
            };
          };
        };
      };
    };
  };
}
