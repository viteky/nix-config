{
  vim.utility.snacks-nvim = {
    enable = true;
    setupOpts = {
      bigfile.enabled = true;
      image.enabled = true;
      bufdelete.enabled = true;
      rename.enabled = true;
      quickfile.enabled = true;
      statuscolumn = {
        enabled = true;
        left = ["mark" "sign"]; ## priority of signs on the left (high to low)
        right = ["fold" "git"]; ## priority of signs on the right (high to low)
        folds = {
          open = true; ## show open fold icons
          git_hl = true; ## use Git Signs hl for fold icons
        };
      };
    };
  };
}
