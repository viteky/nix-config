{lib, ...}: {
  vim.filetree.neo-tree = {
    enable = true;
    setupOpts = {
      enable_cursor_hijack = true;
      close_if_last_window = true;
      auto_clean_after_session_restore = true;
      git_status_async = true;
      filesystem = {
        filtered_items.visible = true;
        use_libuv_file_watcher = true;
        follow_current_file = {
          enabled = true;
          leave_dirs_open = false;
        };
      };
      event_handlers = [
        {
          event = "neo_tree_buffer_enter";
          handler = lib.generators.mkLuaInline ''
            function()
              vim.cmd "highlight! Cursor blend=100"
            end
          '';
        }
        {
          event = "neo_tree_buffer_leave";
          handler = lib.generators.mkLuaInline ''
            function()
              vim.cmd "highlight! Cursor blend=0"
            end
          '';
        }
      ];
    };
  };
}
