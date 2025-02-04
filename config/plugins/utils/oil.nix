{
  plugins.oil = {
    enable = true;
    settings = {
      useDefaultKeymaps = true;
      deleteToTrash = true;
      float = {
        padding = 2;
        maxWidth = 0;
        maxHeight = 0;
        border = "rounded";
        winOptions = {
          winblend = 0;
        };
      };
      preview = {
        border = "rounded";
      };
      keymaps = {
        "g?" = "actions.show_help";
        "<CR>" = "actions.select";
        "<C-\\>" = "actions.select_vsplit";
        "<C-enter>" = "actions.select_split";
        "<C-t>" = "actions.select_tab";
        "<C-v>" = "actions.preview";
        "<C-c>" = "actions.close";
        "<C-r>" = "actions.refresh";
        "-" = "actions.parent";
        "_" = "actions.open_cwd";
        "`" = "actions.cd";
        "~" = "actions.tcd";
        "gs" = "actions.change_sort";
        "gx" = "actions.open_external";
        "g." = "actions.toggle_hidden";
        "q" = "actions.close";
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "-";
      action = ":Oil<CR>";
      options = {
        desc = "Open parent directory";
        silent = true;
      };
    }
  ];
}
