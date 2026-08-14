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
          font_features = "MonaspaceNeonNF-Regular +calt +liga";
          disable_ligatures = "cursor";
        };
      };
    };
  };
}
