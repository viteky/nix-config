{
  vim.assistant = {
    copilot = {
      enable = true;
      cmp.enable = false;
      setupOpts = {
        settings = {
          suggestion = {
            auto_trigger = true;
          };
        };
      };
    };

    codecompanion-nvim.enable = true;
  };
}
