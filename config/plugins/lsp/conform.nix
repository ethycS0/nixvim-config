{
  plugins.conform-nvim = {
    enable = true;
    settings = {

      notify_on_error = false;

      formatters_by_ft = {
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
        python = [ "black" ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        markdown = [ "mdformat" ];
      };
    };
  };
}
