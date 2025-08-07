{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = false;

      formatters_by_ft = {
        c = [ "clang_format_8" ];
        cpp = [ "clang_format_8" ];
        ino = [ "clang_format_8" ]; # Treat .ino files like C++
        python = [ "black" ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        markdown = [ "mdformat" ];
      };

      formatters = {
        clang_format_8 = {
          command = "clang-format";
          args = [ "--style={BasedOnStyle: LLVM, IndentWidth: 8, TabWidth: 8, UseTab: Never}" ];
        };
      };
    };
  };
}
