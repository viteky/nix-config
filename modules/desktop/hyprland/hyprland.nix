{
  den.aspects.desktop = {
    nixos = {pkgs, ...}: {
      programs.hyprland = {
        enable = true;
        withUWSM = true;
      };

      xdg.portal.extraPortals = with pkgs; [xdg-desktop-portal-gtk];
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

        systemd = {
          variables = ["--all"];
          enableXdgAutostart = true;
          enable = false;
        };

        extraConfig = ''
          require("extra")
        '';
      };

      xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
      xdg.configFile."hypr/extra.lua".source =
        config.lib.file.mkOutOfStoreSymlink "/home/jaydenv/Projects/my-nix/modules/desktop/hyprland/hyprland.lua";

      home.packages = with pkgs; [
        wl-clipboard
      ];
    };
  };
}
