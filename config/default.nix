{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Base settings
    ./keys.nix
    ./sets.nix

    # Colorschemes
    ./plugins/theme.nix

    # Completion and LSP
    ./plugins/completion/cmp.nix
    ./plugins/completion/lspkind.nix
    ./plugins/lsp/conform.nix
    ./plugins/lsp/lsp.nix
    ./plugins/lsp/lspsaga.nix
    ./plugins/lsp/none-ls.nix
    ./plugins/lsp/clangd-extensions.nix

    # Git integration
    ./plugins/git/lazygit.nix

    # Snippets
    ./plugins/snippets/luasnip.nix

    # Statusline
    ./plugins/statusline/lualine.nix

    # Treesitter
    ./plugins/treesitter/treesitter-context.nix
    ./plugins/treesitter/treesitter-textobjects.nix
    ./plugins/treesitter/treesitter.nix

    # UI Enhancements
    ./plugins/ui/web-devicons.nix
    ./plugins/ui/dressing.nix
    ./plugins/ui/smart-splits.nix
    ./plugins/ui/alpha.nix
    ./plugins/ui/noice.nix
    ./plugins/ui/nvim-notify.nix
    ./plugins/ui/telescope.nix
    ./plugins/ui/zen-mode.nix
    ./plugins/ui/project.nix

    # Utility Plugins
    ./plugins/utils/comment.nix
    ./plugins/utils/comment-box.nix
    ./plugins/utils/flash.nix
    ./plugins/utils/trouble.nix
    ./plugins/utils/clipboard-image.nix
    ./plugins/utils/goyo.nix
    ./plugins/utils/illuminate.nix
    ./plugins/utils/colorizer.nix
    ./plugins/utils/nvim-autopairs.nix
    ./plugins/utils/oil.nix
    ./plugins/utils/undotree.nix
    ./plugins/utils/markdown-preview.nix
    ./plugins/utils/whichkey.nix
  ];
}
