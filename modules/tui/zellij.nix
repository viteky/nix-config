{
  den.aspects.tui.homeManager = {
    programs.zellij = {
      enable = true;
      settings = {
        pane_frames = false;
        show_startup_tips = false;
        ui.pane_frames.hide_session_name = true;
        on_force_close = "detach";
        copy_on_select = false;
        pane_viewport_serialization = true;
        post_command_discovery_hook = "echo \"$RESURRECT_COMMAND\" | sed 's| --cmd .*-vim-pack-dir||g; s|/etc/profiles/per-user/$USER/bin/||g; s|/nix/store/.*/bin/||g'";
      };
    };
  };
}
