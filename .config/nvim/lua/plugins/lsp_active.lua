return function(use)
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "Afourcat/treesitter-terraform-doc.nvim",
    "lvimuser/lsp-inlayhints.nvim",
  }

  require("mason").setup()
  local mason_lspconfig = require("mason-lspconfig")

  mason_lspconfig.setup({
    ensure_installed = {
      "eslint",
      "gopls", -- WARNING: This could be an issue with goenv switching.
      "marksman",
      "rust_analyzer",
      "sumneko_lua",
      "terraformls",
      "tflint",
      "tsserver",
      "yamlls",
    }
  })

  mason_lspconfig.setup_handlers({
    function(server_name)
      require("lspconfig")[server_name].setup({
        on_attach = function(client, bufnr)
          require("settings/shared").on_attach(client, bufnr)
          require("illuminate").on_attach(client)

          if server_name == "terraformls" then
            require("treesitter-terraform-doc").setup()
          end
        end
      })
    end
  })

  use { "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup({
        -- autofold_depth = 1, -- h: close, l: open, W: close all, E: open all
        auto_close = false,
        highlight_hovered_item = true,
        position = "left",
        width = 15,
        symbols = {
          File = { icon = "", hl = "GruvboxAqua" }, -- TSURI
          Module = { icon = "", hl = "GruvboxBlue" }, -- TSNamespace
          Namespace = { icon = "", hl = "GruvboxBlue" }, -- TSNamespace
          Package = { icon = "", hl = "GruvboxBlue" }, -- TSNamespace
          Class = { icon = "𝓒", hl = "GruvboxGreen" }, -- TSType
          Method = { icon = "ƒ", hl = "GruvboxOrange" }, -- TSMethod
          Property = { icon = "", hl = "GruvboxOrange" }, -- TSMethod
          Field = { icon = "", hl = "GruvboxRed" }, -- TSField
          Constructor = { icon = "", hl = "TSConstructor" },
          Enum = { icon = "ℰ", hl = "GruvboxGreen" }, -- TSType
          Interface = { icon = "ﰮ", hl = "GruvboxGreen" }, -- TSType
          Function = { icon = "", hl = "GruvboxYellow" }, -- TSFunction
          Variable = { icon = "", hl = "GruvboxPurple" }, -- TSConstant
          Constant = { icon = "", hl = "GruvboxPurple" }, -- TSConstant
          String = { icon = "𝓐", hl = "GruvboxGray" }, -- TSString
          Number = { icon = "#", hl = "TSNumber" },
          Boolean = { icon = "⊨", hl = "TSBoolean" },
          Array = { icon = "", hl = "GruvboxPurple" }, -- TSConstant
          Object = { icon = "⦿", hl = "GruvboxGreen" }, -- TSType
          Key = { icon = "🔐", hl = "GruvboxGreen" }, -- TSType
          Null = { icon = "NULL", hl = "GruvboxGreen" }, -- TSType
          EnumMember = { icon = "", hl = "GruvboxRed" }, -- TSField
          Struct = { icon = "𝓢", hl = "GruvboxGreen" }, -- TSType
          Event = { icon = "🗲", hl = "GruvboxGreen" }, -- TSType
          Operator = { icon = "+", hl = "TSOperator" },
          TypeParameter = { icon = "𝙏", hl = "GruvboxRed" } --TTSParameter
        },
      })
    end
  }
  --[[
    NOTE: I currently manually attach my shared mappings for each LSP server.
    But, we can set a generic one using lspconfig:

    require("lspconfig").util.default_config.on_attach = function()
  --]]

  local function org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end

  use { "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        go = { "golangcilint" }, -- ~/.golangci.yml
      }
      -- see ./lsp.lua for calls to this plugin's try_lint() function.
    end
  }

  local lspconfig = require("lspconfig")

  lspconfig.gopls.setup({
    on_attach = function(client, bufnr)
      require("settings/shared").on_attach(client, bufnr)
      require("lsp-inlayhints").setup({
        inlay_hints = {
          type_hints = {
            prefix = "=> "
          },
        },
      })
      require("lsp-inlayhints").on_attach(client, bufnr)
      require("illuminate").on_attach(client)

      -- autocommands can overlap and consequently not run
      -- for example, a generic "*" wildcard pattern will override another autocmd even if it has a more specific pattern
      local id = vim.api.nvim_create_augroup("GoLint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        group = id,
        pattern = "*.go",
        callback = function()
          -- NOTE: ../../settings/shared.lua has a broader wildcard executing formatting.
          org_imports(1000)
          require("lint").try_lint() -- golangci-lint configuration via ./nvim-lint.lua
        end,
      })

      vim.keymap.set(
        "n", "<leader><leader>lv",
        "<Cmd>cex system('revive -exclude vendor/... ./...') | cwindow<CR>",
        {
          noremap = true,
          silent = true,
          buffer = bufnr,
          desc = "lint project code"
        }
      )
    end,
    settings = {
      gopls = {
        analyses = {
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true,
        },
        experimentalPostfixCompletions = true,
        gofumpt = true,
        staticcheck = true,
        usePlaceholders = true,
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        }
      },
    },
  })
end
