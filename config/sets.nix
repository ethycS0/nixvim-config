{ pkgs, ... }:
{

  config = {
    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        configs = true;
        plugins = true;
      };
    };
    diagnostic.settings = {
      update_in_insert = true;
      severity_sort = true;
      float = {
        border = "rounded";
      };
      jump = {
        severity.__raw = "vim.diagnostic.severity.WARN";
      };
    };
    opts = {
      autochdir = false;
      number = true;
      relativenumber = true;
      formatoptions = "jcroql";
      tabstop = 8;
      softtabstop = 8;
      autoindent = false;
      smartindent = false;
      showtabline = 8;
      expandtab = true;
      shiftwidth = 8;
      breakindent = false;
      hlsearch = true;
      incsearch = true;
      wrap = true;
      splitbelow = true;
      splitright = true;
      mouse = "a";
      ignorecase = true;
      smartcase = true; # Don't ignore case with capitals
      grepprg = "rg --vimgrep";
      grepformat = "%f:%l:%c:%m";
      updatetime = 50;
      completeopt = [
        "menuone"
        "noselect"
        "noinsert"
      ];
      swapfile = false;
      backup = false;
      undofile = true;
      termguicolors = true;
      # Enable the sign column to prevent the screen from jumping
      # signcolumn = "yes";
      cursorline = false; # Highlight the line where the cursor is located
      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
      scrolloff = 2;
      timeoutlen = 10;
      encoding = "utf-8";
      fileencoding = "utf-8";
      cmdheight = 0;
      showmode = false;
      clipboard = {
        providers = {
          wl-copy.enable = true;
          xclip.enable = true;
        };
      };
    };
  };
}
