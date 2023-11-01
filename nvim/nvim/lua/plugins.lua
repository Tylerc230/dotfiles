-- This file can be loaded by calling `lua require('plugins')` from your init.vim
require("lazy").setup({
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-sleuth',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      { "nvim-telescope/telescope-live-grep-args.nvim" }
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end

  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
  },
  {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup {
        start_in_insert = false,
      }
    end
  },

  'christianchiarulli/nvcode-color-schemes.vim',
  'mhartington/oceanic-next',
  'tomasiser/vim-code-dark',
  'marko-cerovac/material.nvim',
  'sainnhe/sonokai',
  'EdenEast/nightfox.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons', opt = true},
  },
  {
    'lewis6991/gitsigns.nvim', --gutter signs
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  },
  't9md/vim-choosewin',
  'scrooloose/nerdcommenter',
  "Pocco81/auto-save.nvim",
  --use {"hrsh7th/nvim-compe"} --auto complete
   'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
   {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path"
    }
  },
  {
  --for jest
   'David-Kunz/jester',
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = "nvim-lua/plenary.nvim",
  },
  -- PlantUML
  'aklt/plantuml-syntax',
  'tyru/open-browser.vim',
  'weirongxu/plantuml-previewer.vim',

  {
    'abecodes/tabout.nvim',
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        enable_backwards = true, -- well ...
        completion = false, -- if the tabkey is used in a completion pum
        tabouts = {
          {open = "'", close = "'"},
          {open = '"', close = '"'},
          {open = '`', close = '`'},
          {open = '(', close = ')'},
          {open = '[', close = ']'},
          {open = '{', close = '}'}
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    dependencies = {'nvim-treesitter'}, -- or require if not used so far
    --after = {'nvim-compe'} -- if a completion plugin is using tabs load it before
  },
  {
    'phaazon/hop.nvim',
    name = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup ({
        --multi_windows = true -- doesn't work
      })
    end
  },
  {"windwp/nvim-autopairs"},
  --LSP
  {"tami5/lspsaga.nvim"},
  "jose-elias-alvarez/null-ls.nvim",
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
  "folke/trouble.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("trouble").setup {
    }
  end
},
  --DAP
  'mfussenegger/nvim-dap',
  {'nvim-telescope/telescope-dap.nvim'},
  {'Pocco81/DAPInstall.nvim'},
  {'theHamsta/nvim-dap-virtual-text'},
  {'rcarriga/nvim-dap-ui'},
  'jbyuki/one-small-step-for-vimkind',
  require('experimental_plugins')
})

require("coverage").setup({
  lang = {
    javascript = {
      coverage_file = "build/brazil-documentation/coverage/lcov.info"
    }
  }
})
require('nvim-autopairs').setup()
require'lualine'.setup {
  options = {
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        sources={'nvim_lsp'},
        diagnostics_color = {
          --error = {fg = "LspDiagnosticsDefaultError"},
          --warn = { fg = 'LspDiagnosticsDefaultWarning' },
          --info = { fg = 'LspDiagnosticsDefaultInformation' },
          --hint = { fg = 'LspDiagnosticsDefaultHint' },
          --error = {fg = "ErrorText"},
          --warn = { fg = 'WarningText' },
          --info = { fg = 'InfoText' },
          --hint = { fg = 'HintText' },
          error = {fg = "#fc5d7c"},
          warn = { fg = '#e7c664' },
          info = { fg = '#76cce0' },
          hint = { fg = '#9ed072' },

        },
        always_visible = true,
      }
    },
    lualine_c = {
      {
        'filename',
        path = 1
      }
    },
    lualine_x = {
      {
        -- Lsp server name .
        function()
          local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ' LSP:',
        color = { fg = '#ffffff', gui = 'bold' },
      }
    },
    --lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {
    "nvim-tree", "fugitive", "toggleterm", {sections = {}, filetypes = {}}
  },
}

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<BS>',  api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'N',     api.fs.create,                         opts('Create'))
  vim.keymap.set('n', '.',     api.tree.toggle_hidden_filter,         opts('Toggle Filter: Dotfiles'))
  vim.keymap.set('n', 'v',     api.node.open.vertical,                opts('Open: Vertical Split'))
  vim.keymap.set('n', 'cd',    api.tree.change_root_to_node,                  opts('CD'))
end
require'nvim-tree'.setup({
  on_attach = my_on_attach,
  update_cwd = true,
  diagnostics = {
    enable = true
  },
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
    enable      = true,
  },
})
local transform_mod = require('telescope.actions.mt').transform_mod
local git_browser_actions = transform_mod({
  logs_for_branch = function(opts)
    local selection = require ("telescope.actions.state").get_selected_entry()
    require('telescope').extensions.git_browser.run_logs_for_branch({
      branch = selection.value
    })
  end
})

require('telescope').load_extension("live_grep_args")
require('telescope').setup {
  extensions = {
    frecency = {
      default_workspace = 'CWD',
      show_unindexed = false
    },
  },
  pickers = {
    git_branches = {
      mappings = {
        n = {
          ["l"] = git_browser_actions.logs_for_branch
        }
      }
    },
    buffers = {
      mappings = {
        n = {
          ["D"] = require("telescope.actions").delete_buffer
        }
      }
    }
  }
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { 'haskell' },
  highlight = {
    enable = true,              -- false will disable the whole extension
    --additional_vim_regex_highlighting = {'org'}
  },
  --ensure_installed = {'org'},
  indent = {
    enable = true
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--parser_config.objc = {
  --install_info = {
    --url = "/Users/cstyle/tools/tree-sitter-objc", -- local path or git repo
    --files = {"src/parser.c"}
  --},
  --filetype = "objc" -- if filetype does not agrees with parser name
--}
require('gitsigns').setup {
}

local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  -- You can set mappings if you want
  completion = {
    autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
    completeopt = "menu,menuone,noselect",
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    })
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = "neorg" },
    {name = "nvim_lsp"},
    { name = 'buffer' },
    {name = "path"}
  },
}

--_G.load = function(file)
    --require("plenary.reload").reload_module(file, true)
    --return require(file)
--end

require("auto-save").setup()
