{
  vim.session.nvim-session-manager = {
    enable = true;
    setupOpts = {
      autoload_mode = "CurrentDir";
      autosave_ignore_buftypes = ["terminal" "nofile"];
    };
  };
}
