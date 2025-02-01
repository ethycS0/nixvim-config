{
  plugins.neo-tree = {
    enable = true;
  };

  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>e";
      action = ":Neotree<CR>";
      options = {
        silent = true;
        desc = "Tree";
      };
    }
  ];

}
