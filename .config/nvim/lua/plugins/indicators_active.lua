return function(use)
  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require('nvim-treesitter.configs').setup {
        -- A list of parser names, or "all"
        ensure_installed = {
          "help",
          "yaml",
          "javascript",
          "typescript",
          "tsx",
          "json",
          "html",
          "css",
          "python",
          "lua",
          "fish",
          "go",
          "gomod",
          "gowork",
          "dockerfile",
          "markdown",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

        highlight = {
          -- `false` will disable the whole extension
          enable = true,
        },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      }
    end
  }
  -- word usage highlighter
  use { "RRethy/vim-illuminate",
    config = function()
      -- vim.cmd("highlight illuminatedWord guifg=red guibg=white")
      -- vim.api.nvim_command [[ highlight LspReferenceText guifg=red guibg=white ]]
      -- vim.api.nvim_command [[ highlight LspReferenceWrite guifg=red guibg=white ]]
      -- vim.api.nvim_command [[ highlight LspReferenceRead guifg=red guibg=white ]]
    end
  }

  -- jump to word indictors
  use { "jinh0/eyeliner.nvim",
    config = function()
      vim.api.nvim_set_hl(0, "EyelinerPrimary", { underline = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = {
          "*"
        },
        callback = function()
          vim.api.nvim_set_hl(0, "EyelinerPrimary", { underline = true })
        end
      })
    end
  }

  -- cursor movement highlighter
  use "DanilaMihailov/beacon.nvim"

  -- highlight yanked region
  use "machakann/vim-highlightedyank"

  -- suggest mappings
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }
end
