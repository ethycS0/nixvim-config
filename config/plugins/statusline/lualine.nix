{ config, ... }:
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "codedark";
        globalstatus = true;
        disabled_filetypes = {
          statusline = [
            "dashboard"
            "alpha"
            "starter"
          ];
        };
      };
      inactive_sections = {
        lualine_x = [
          "filename"
          "filetype"
        ];
      };
    };
  };
}
