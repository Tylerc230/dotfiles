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
  use {"glepnir/lspsaga.nvim"} --floating lsp windows
  use {"kabouzeid/nvim-lspinstall"}
  use {"hrsh7th/nvim-compe"} --auto complete
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
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
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})

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

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()
local lsp_config = require'lspconfig'
local util = require'lspconfig'.util
lsp_config.sourcekit.setup {
  cmd = { "xcrun", "sourcekit-lsp" },
  root_dir = util.root_pattern("Package.swift", ".git"),
  --filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp", "objc" }
  filetypes = { "swift" }
}

lsp_config.clangd.setup {
  --cmd = { "/usr/local/Cellar/llvm/12.0.1/bin/clangd", "-log=verbose" },
  --cmd = { "xcrun", "clangd", "-log=verbose" },
  cmd = { "xcrun", "clangd" },
  root_dir = util.root_pattern("compile_commands.json", ".git"),
  filetypes = { "c", "cpp", "objective-c", "objective-cpp", "objc" }
}
lsp_config.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})
-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = true;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
}

local saga = require 'lspsaga'
saga.init_lsp_saga {
 code_action_prompt = {
   enable = false,
   sign = false,
 }
}
_G.load = function(file)
    require("plenary.reload").reload_module(file, true)
    return require(file)
end

require("autosave").setup()
