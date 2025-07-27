{
  plugins = {
    lsp-format = {
      enable = true;
    };
    lsp = {
      enable = true;
      servers = {
        lua_ls = {
          enable = true;
        };
        nil_ls = {
          enable = true;
        };
        asm_lsp = {
          enable = true;
        };
        arduino_language_server = {
          enable = true;
          autostart = false;
          cmd = [
            "arduino-language-server"
            "--cli"
            "/home/arjun/.local/bin/arduino-cli"
            "--cli-config"
            "/home/arjun/.arduino15/arduino-cli.yaml"
            "--clangd"
            "/usr/bin/clangd-14"
            "--fqbn"
            "esp32:esp32:esp32"
          ];
        };
        clangd = {
          enable = true;
          cmd = [
            "clangd"
            "--clang-tidy"
            "--clang-tidy-checks=*"
            "--all-scopes-completion"
            "--cross-file-rename"
            "--completion-style=detailed"
            "--header-insertion-decorators"
            "--header-insertion=iwyu"
            "--pch-storage=memory"
          ];
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()  -- For completion support (assumes nvim-cmp is installed)

      -- Define a shared on_attach function
    local function custom_on_attach(client, bufnr)
        print("LSP attached: " .. client.name .. " to buffer " .. bufnr)  -- Debug print to confirm attachment
        -- Example keymap: Go to definition with <leader>gd
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
        -- Enable formatting on save (optional)
        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end,
          })
        end
      end

      -- Apply to arduino_language_server (and others if desired)
    lspconfig.arduino_language_server.setup({
        on_attach = custom_on_attach,
        capabilities = capabilities,
      })
  '';
}
