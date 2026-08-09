{
  imports = [
    ./noice.nix
    ./ufo.nix
  ];

  vim.ui = {
    breadcrumbs.enable = true;
    colorizer.enable = true;
    borders.enable = false;
    fastaction.enable = true;
    smartcolumn.enable = true;
  };
}
