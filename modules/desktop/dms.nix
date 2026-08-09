{inputs, ...}: {
  flake-file.inputs = {
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankcalendar = {
      url = "github:AvengeMedia/dankcalendar";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.desktop.dms = {
    nixos = {pkgs, ...}: {
      imports = [inputs.dms.nixosModules.default];
      environment.systemPackages = [pkgs.bibata-cursors];
      programs.dsearch.enable = true;
      programs.dank-material-shell.enable = true;
      services.displayManager.dms-greeter = {
        enable = true;
        compositor.name = "hyprland";
        configHome = "/home/jaydenv";
        compositor.customConfig =
          #lua
          ''
            hl.env("DMS_RUN_GREETER", "1")
            hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
            hl.env("XCURSOR_SIZE", "20")

            hl.config({
              misc = {
                disable_hyprland_logo = true,
                disable_splash_rendering = true,
              },
            })
          '';
      };
    };
    homeManager = {
      imports = [
        inputs.dms.homeModules.default
        inputs.dankcalendar.homeModules.default
        inputs.dms-plugin-registry.homeModules.default
      ];

      programs.dank-material-shell = {
        enable = true;
        systemd.enable = true;
        managePluginSettings = true;

        settings = {
          use24HourClock = false;
          dankLauncherV2UnloadOnClose = true;
          controlCenterWidgets = [
            {
              id = "volumeSlider";
              enabled = true;
              width = 50;
            }
            {
              id = "brightnessSlider";
              enabled = true;
              width = 50;
            }
            {
              id = "wifi";
              enabled = true;
              width = 50;
            }
            {
              id = "builtin_vpn";
              enabled = true;
              width = 50;
            }
            {
              id = "audioOutput";
              enabled = true;
              width = 50;
            }
            {
              id = "audioInput";
              enabled = true;
              width = 50;
            }
            {
              id = "nightMode";
              enabled = true;
              width = 50;
            }
            {
              id = "darkMode";
              enabled = true;
              width = 50;
            }
            {
              id = "doNotDisturb";
              enabled = true;
              width = 50;
            }
            {
              id = "idleInhibitor";
              enabled = true;
              width = 50;
            }
            {
              id = "bluetooth";
              enabled = true;
              width = 50;
            }
          ];
          showWorkspaceIndex = true;
          workspaceScrolling = false;
          workspaceFollowFocus = true;
          focusedWindowCompactMode = true;
          runningAppsCompactMode = true;
          useAutoLocation = true;
          weatherEnabled = true;
          showDock = true;
          dockAutoHide = true;
          dockGroupByApp = true;
          dockOpenOnOverview = true;
          dockPosition = 1;
          dockSpacing = 4;
          dockBottomGap = 0;
          dockMargin = 0;
          dockIconSize = 40;
          dockIndicatorStyle = "line";
          dockIsolateDisplays = false;
          dockLauncherEnabled = true;
          dockShowOverflowBadge = true;
          lockScreenNotificationMode = 2;
          displayNameMode = "system";
          acMonitorTimeout = 600;
          acLockTimeout = 300;
          acSuspendTimeout = 3600;
          acSuspendBehavior = 0;
          acProfileName = "";
          batteryMonitorTimeout = 600;
          batteryLockTimeout = 300;
          batterySuspendTimeout = 900;
          batterySuspendBehavior = 2;
          batteryProfileName = "0";
          batteryChargeLimit = 100;
          lockBeforeSuspend = true;
          barConfigs = [
            {
              id = "default";
              name = "Main Bar";
              enabled = true;
              position = 0;
              screenPreferences = [
                {
                  name = "DP-2";
                  model = "VG279QM";
                }
                {name = "eDP-1";}
              ];
              showOnLastDisplay = true;
              leftWidgets = [
                "launcherButton"
                "workspaceSwitcher"
                "focusedWindow"
              ];
              centerWidgets = [
                "music"
                "clock"
                "weather"
              ];
              rightWidgets = [
                "systemTray"
                "clipboard"
                {
                  id = "cpuUsage";
                  enabled = true;
                  minimumWidth = true;
                }
                {
                  id = "memUsage";
                  enabled = true;
                  minimumWidth = true;
                  showSwap = false;
                }
                "notificationButton"
                "battery"
                {
                  id = "controlCenterButton";
                  enabled = true;
                  showAudioIcon = true;
                  showAudioPercent = false;
                  showBrightnessIcon = false;
                  showBrightnessPercent = false;
                  showMicIcon = false;
                  showBatteryIcon = true;
                }
              ];
              spacing = 0;
              innerPadding = -8;
              squareCorners = true;
              scrollYBehavior = "none";
              scrollEnabled = false;
              cursorSettings = {
                theme = "Bibata-Modern-Ice";
                size = 20;
              };
            }
          ];
        };

        session = {
          nightModeAutoEnabled = true;
          nightModeAutoMode = "location";
          nightModeUseIPLocation = true;
          nightModeTemperature = 3000;
          nightModeHighTemperature = 6500;
          nvidiaGpuTempEnabled = true;
          nonNvidiaGpuTempEnabled = true;
        };

        plugins = {
          aiAssistant.enable = true;
          dankBatteryAlerts.enable = true;
          dankBitwarden.enable = true;
          dankLauncherKeys.enable = true;
          dankPomodoroTimer.enable = true;
          dankKDEConnect.enable = true;
        };
      };

      programs.dank-calendar.enable = true;
    };
  };
}