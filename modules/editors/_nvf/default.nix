{
  imports = [
    ./assistant.nix
    ./comments.nix
    ./git.nix
    ./lsp.nix
    ./languages
    ./treesitter.nix
    ./filetree.nix
    ./statusline.nix
    ./ui
    ./binds.nix
    ./dashboard.nix
    ./visuals.nix
    ./telescope.nix
    ./autocomplete.nix
    ./tabline.nix
    ./terminal.nix
    ./session.nix
    ./debugger.nix
    ./notes.nix
    ./keymaps.nix
    ./mini.nix
    ./diagnostics.nix
    ./snacks.nix
  ];

  vim = {
    clipboard = {
      enable = true;
      registers = "unnamedplus";
      providers = {
        wl-copy.enable = true;
        xclip.enable = true;
      };
    };

    theme = {
      enable = true;
      name = "catppuccin";
      style = "macchiato";
    };

    lineNumberMode = "relNumber";
    searchCase = "smart";
    syntaxHighlighting = true;
    enableLuaLoader = true;
    options = {
      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
      scrolloff = 10;
      fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:";
      autoindent = true;
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      wrap = false;
    };

    autopairs.nvim-autopairs.enable = true;

    snippets.luasnip = {
      enable = true;
      setupOpts.enable_autosnippets = true;
    };
  };
}
