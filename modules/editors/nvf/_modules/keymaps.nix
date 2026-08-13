{
  vim.keymaps = [
    #Buffers
    {
      action = "<cmd>lua Snacks.bufdelete()<CR>";
      key = "<leader>bdd";
      desc = "Delete Buffer";
      mode = ["n"];
    }
    {
      action = "<cmd>lua Snacks.bufdelete.all()<CR>";
      key = "<leader>bda";
      desc = "Delete All Buffers";
      mode = ["n"];
    }
    {
      action = "<cmd>lua Snacks.bufdelete.other()<CR>";
      key = "<leader>bdo";
      desc = "Delete Other Buffers";
      mode = ["n"];
    }

    # Explorer
    {
      action = "<cmd>Neotree reveal toggle<CR>";
      key = "<C-e>";
      desc = "Open Explorer";
      mode = ["n"];
    }
  ];
}
