{
  plugins = {
    clangd-extensions = {
      enable = true;
      enableOffsetEncodingWorkaround = true;
      settings = {
        inlay_hints.highlight = "comment";
        ast = {
          role_icons = {
            type = "";
            declaration = "";
            expression = "";
            specifier = "";
            statement = "";
            templateArgument = "";
          };
          kind_icons = {
            compound = "";
            recovery = "";
            translationUnit = "";
            packExpansion = "";
            templateTypeParm = "";
            templateTemplateParm = "";
            templateParamObject = "";
          };
        };
      };
    };
  };
}
