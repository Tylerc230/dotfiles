-- This file can be loaded by calling `lua require('plugins')` from your init.vim


require('packer').startup({function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-sleuth'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'kassio/neoterm'

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
  --'glepnir/galaxyline.nvim',
    'eruizc-dev/galaxyline.nvim', --fork
    branch = 'main',
    config = function() require 'lunar' end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
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
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path"
    }
  }
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
      require'hop'.setup ()
    end
  }
  use {"windwp/nvim-autopairs"}
  use {"neovim/nvim-lspconfig"}
  use {"glepnir/lspsaga.nvim",
    requires = {{'neovim/nvim-lspconfig'}} --floating lsp windows
  }
  use {"kabouzeid/nvim-lspinstall"}

--DAP
  use 'mfussenegger/nvim-dap'
  use {'nvim-telescope/telescope-dap.nvim'}
  use {'Pocco81/DAPInstall.nvim'}
  use {'theHamsta/nvim-dap-virtual-text'}
  use {'rcarriga/nvim-dap-ui'}
  use 'jbyuki/one-small-step-for-vimkind'

  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})

require('nvim-autopairs').setup()
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


require('telescope').setup {
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
    enable = true              -- false will disable the whole extension
  },
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
local cmp = require('cmp')
cmp.setup {
  -- You can set mappings if you want
  completion = {
    autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
    completeopt = "menu,menuone,noselect",
  },
  documentation = {
    border = "rounded",
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
      select = true,
    })
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'buffer' },
    {name = "nvim_lsp"},
    {name = "path"}
  },
}
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
