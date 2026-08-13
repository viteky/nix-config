{
  den.aspects.desktop = {
    homeManager = {
      programs.kitty = {
        enable = true;
        settings = {
          confirm_os_window_close = 0;
          resize_in_steps = "yes";
          allow_remote_control = "yes";
          listen_on = "unix:/tmp/kitty";
          term = "xterm-256color";
          font_features = "MonaspiceNeNFM -calt +ss01 +ss02 +ss03 +ss04 +ss05 +ss06 +ss07 +ss08 +ss09 +ss10 +liga";
          disable_ligatures = "cursor";
        };
      };
    };
  };
}
