{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = true;

      formatters_by_ft = {
        vhdl = [ "ghdl" ];
        c = [ "clang_format_8" ];
        cpp = [ "clang_format_8" ];
        ino = [ "clang_format_8" ];
        python = [ "black" ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        systemverilog = [ "verible_verilog_format" ];
        verilog = [ "verible_verilog_format" ];
        markdown = [ "mdformat" ];
      };

      formatters = {
        clang_format_8 = {
          command = "clang-format";
          args = [ "--style={BasedOnStyle: LLVM, IndentWidth: 8, TabWidth: 8, UseTab: Never}" ];
        };

        verible_verilog_format = {
          command = "verible-verilog-format";
          append_args = [
            "--append_newline_at_eof=false"
          ];
        };
      };
    };
  };
}
