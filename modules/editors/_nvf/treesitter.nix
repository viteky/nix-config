{pkgs, ...}: {
  vim.treesitter = {
    enable = true;
    autotagHtml = true;
    fold = false;
    grammars = with pkgs.vimPlugins.nvim-treesitter.grammarPlugins; [
      blade
    ];
  };
}
