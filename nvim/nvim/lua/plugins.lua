-- This file can be loaded by calling `lua require('plugins')` from your init.vim


require('packer').startup({function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-sleuth'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      { "nvim-telescope/telescope-live-grep-args.nvim" }
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end

  }

  use { 'ThePrimeagen/harpoon', requires = 'nvim-lua/plenary.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require"telescope".load_extension("frecency")
    end,
    requires = {"tami5/sqlite.lua"}
  }
  use {"akinsho/toggleterm.nvim",
    tag = 'v1.*',
    config = function()
      require("toggleterm").setup {
        start_in_insert = false,
        --open_mapping = [[<leader>n]],
      }
    end
  }

  use {
    "https://git.sr.ht/~havi/telescope-toggleterm.nvim",
    event = "TermOpen",
    requires = {
      "akinsho/toggleterm.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension "toggleterm"
    end,
  }
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'mhartington/oceanic-next'
  use 'tomasiser/vim-code-dark'
  use 'marko-cerovac/material.nvim'
  use 'sainnhe/sonokai'
  use 'EdenEast/nightfox.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  use {
    'lewis6991/gitsigns.nvim', --gutter signs
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {
    'kyazdani42/nvim-tree.lua', --left file browser
    requires = "kyazdani42/nvim-web-devicons",
  }
  use 't9md/vim-choosewin'
  use 'scrooloose/nerdcommenter'
  use "Pocco81/AutoSave.nvim"
  --use {"hrsh7th/nvim-compe"} --auto complete
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path"
    }
  }
  --for jest
  use 'David-Kunz/jester'
  use({
    "andythigpen/nvim-coverage",
    requires = "nvim-lua/plenary.nvim",
  })
  -- PlantUML
  use 'aklt/plantuml-syntax'
  use 'tyru/open-browser.vim'
  use 'weirongxu/plantuml-previewer.vim'

  use {
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
    wants = {'nvim-treesitter'}, -- or require if not used so far
    --after = {'nvim-compe'} -- if a completion plugin is using tabs load it before
  }
  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup ({
        --multi_windows = true -- doesn't work
      })
    end
  }
  use {"windwp/nvim-autopairs"}
  --LSP
  use {"tami5/lspsaga.nvim"}
  use "jose-elias-alvarez/null-ls.nvim"
  use {
    "williamboman/nvim-lsp-installer",
    {
      "neovim/nvim-lspconfig",
    }
  }
  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
    }
  end
}
  --DAP
  use 'mfussenegger/nvim-dap'
  use {'nvim-telescope/telescope-dap.nvim'}
  use {'Pocco81/DAPInstall.nvim'}
  use {'theHamsta/nvim-dap-virtual-text'}
  use {'rcarriga/nvim-dap-ui'}
  use 'jbyuki/one-small-step-for-vimkind'

  --use {'nvim-orgmode/orgmode', config = function()
    --require('orgmode').setup{
      --org_agenda_files = {'~/Documents/norg/work/*'},
      --org_default_notes_file = '~/Documents/norg/refile.org',
      --org_capture_templates = {
        --t = { description = 'Tasks', template = '* TODO %?\n  %u' },
        --l = 'Work Log',
        --ln = { description = 'New day', template = '* %u\n - %?', target = '~/Documents/norg/work/worklog.org'},
        --la = { description = 'Add item', template = ' - %?', target = '~/Documents/norg/work/worklog.org'},
      --}
    --}
  --end
--}
--use {
    --"nvim-neorg/neorg",
    --run = ":Neorg sync-parsers",
    --config = function()
        --require('neorg').setup {
        --load = {
          --["core.defaults"] = {},
          --["core.norg.dirman"] = {
            --config = {
              --workspaces = {
                --work = "~/Documents/neorg/work",
              --}
            --}
          --},
          --["core.norg.completion"] = {
            --config = {
              --engine = 'nvim-cmp'
            --}
          --},
          --["core.integrations.nvim-cmp"] = {},
          --["core.norg.concealer"] = {}
        --}
      --}
    --end,
    --requires = "nvim-lua/plenary.nvim"
--}

end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})
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
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup({
  update_cwd = true,
  diagnostics = {
    enable = true
  },
  filters = {
    dotfiles = true,
  },
  --follow = true,
  update_focused_file = {
    -- enables the feature
    enable      = true,
    --update_cwd = true
  },
  view = {
    mappings = {
      list = {
        { key = {"cd"}, cb = tree_cb("cd") },
        { key = "<BS>", cb = tree_cb("dir_up") },
        { key = "s", cb = tree_cb("split") },
        { key = "v", cb = tree_cb("vsplit") },
        { key = "N", cb = tree_cb("create") },
        { key = ".", cb = tree_cb("toggle_dotfiles") },
      }
    }
  }

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
--require("nvim-autopairs.completion.compe").setup({
  --map_cr = true, --  map <CR> on insert mode
  --map_complete = true -- it will auto insert `(` after select function or method item
--})


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
parser_config.objc = {
  install_info = {
    url = "/Users/cstyle/tools/tree-sitter-objc", -- local path or git repo
    files = {"src/parser.c"}
  },
  filetype = "objc" -- if filetype does not agrees with parser name
}
require('gitsigns').setup {
  keymaps = {
    noremap = false,
    ['n <leader>gB'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
  }
}
--require('orgmode').setup_ts_grammar()
local cmp = require('cmp')
cmp.setup {
  sources = {
    --{name = 'orgmode'},
    --{name = 'neorg'}
  },
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
    {name = "nvim_lsp"},
    { name = 'buffer' },
    {name = "path"}
  },
}

local neogit = require('neogit')
neogit.setup {
integrations = {
    diffview = true
  },
}
--require("telescope-toggleterm").setup {
   --telescope_mappings = {
      --["D"] = require("telescope-toggleterm").actions.exit_terminal,
   --},
--}
--vim.o.completeopt = "menuone,noselect"
--require'compe'.setup {
  --enabled = true;
  --autocomplete = true;
  --debug = false;
  --min_length = 1;
  --preselect = 'always';
  --throttle_time = 80;
  --source_timeout = 200;
  --resolve_timeout = 800;
  --incomplete_delay = 400;
  --max_abbr_width = 100;
  --max_kind_width = 100;
  --max_menu_width = 100;
  --documentation = {
    --border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    --winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    --max_width = 120,
    --min_width = 60,
    --max_height = math.floor(vim.o.lines * 0.3),
    --min_height = 1,
  --};

--  source = {
--    path = true;
 --   buffer = true;
  --  calc = true;
   -- nvim_lsp = true;
    --nvim_lua = true;
 -- };
--}

_G.load = function(file)
    require("plenary.reload").reload_module(file, true)
    return require(file)
end

require("autosave").setup()
