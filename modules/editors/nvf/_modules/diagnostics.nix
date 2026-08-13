{lib, ...}: {
  vim.diagnostics = {
    enable = true;
    nvim-lint.enable = true;
    config = {
      signs.text =
        lib.generators.mkLuaInline
        #lua
        ''
          {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '󰌵',
          }
        '';
      virtual_text = true;
      underline = false;
      update_in_insert = false;
    };
  };
}
