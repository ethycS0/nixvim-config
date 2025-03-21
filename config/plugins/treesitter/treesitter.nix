{ pkgs, ... }:
{

  plugins.treesitter = {
    enable = true;

    settings = {
      indent = {
        enable = true;
      };
    };

    folding = true;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };

}
