{
  vim.formatter.conform-nvim = {
    enable = true;
    presets = {
      stylua.enable = true;
    };
    setupOpts = {
      formatters_by_ft = {
        blade = "blade-formatter";
      };
    };
  };
}
