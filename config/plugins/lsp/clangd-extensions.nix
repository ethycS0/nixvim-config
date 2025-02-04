{
  plugins = {
    clangd-extensions = {
      enable = true;
      enableOffsetEncodingWorkaround = true;
      settings = {
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
