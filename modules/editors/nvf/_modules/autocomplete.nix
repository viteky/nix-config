{lib, ...}: {
  vim.autocomplete.blink-cmp = {
    enable = true;
    friendly-snippets.enable = false;
    setupOpts = {
      snippets.preset = "luasnip";
      keymap.preset = "enter";
      sources.default = ["lsp" "path" "snippets" "buffer"];
      signature.enabled = true;
      completion = {
        keyword.range = "full";
        list.selection.preselect = false;
        documentation = {
          auto_show = true;
        };
        menu.draw = {
          align_to = "none";
          columns = lib.mkLuaInline ''
            {
              { "kind_icon", "label", "label_description", gap = 1 },
              { "kind" }
            }
          '';
        };
      };
    };
  };
}
