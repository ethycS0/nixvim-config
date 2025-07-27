{ lib, ... }:
{
  plugins.lf = {
    enable = true;
    settings = {
      border = "rounded";
      default_action = "drop";
      default_actions = {
        "<C-o>" = "tab drop";
        "<C-t>" = "tabedit";
        "<C-v>" = "vsplit";
        "<C-x>" = "split";
      };
      default_file_manager = true;
      dir = "";
      direction = "float";
      disable_netrw_warning = true;
      escape_quit = true;
      focus_on_open = true;
      height = lib.nixvim.mkRaw "vim.fn.float2nr(vim.fn.round(0.75 * vim.o.lines))";
      tmux = false;
      width = lib.nixvim.mkRaw "vim.fn.float2nr(vim.fn.round(0.75 * vim.o.columns))";
      winblend = 10;
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>e";
      action = ":Lf<CR>";
      options = {
        silent = true;
        desc = "Files";
      };
    }
  ];
}
