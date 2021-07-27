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
  'glepnir/galaxyline.nvim',
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
  use 'kyazdani42/nvim-tree.lua' --left file browser
  use 't9md/vim-choosewin'
  use 'scrooloose/nerdcommenter'

  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup ()
    end
  }
  use {"neovim/nvim-lspconfig"}
  use {"glepnir/lspsaga.nvim"} --floating lsp windows
  use {"kabouzeid/nvim-lspinstall"}
  use {"hrsh7th/nvim-compe"} --auto complete
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { 'haskell' },
  highlight = {
    enabled = true,              -- false will disable the whole extension
  },
  indent = {
    enable = true
  }
}

require('gitsigns').setup()

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()
local util = require'lspconfig'.util
require'lspconfig'.sourcekit.setup {
  cmd = { "xcrun", "sourcekit-lsp" },
  root_dir = util.root_pattern("Package.swift", ".git"),
  --filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp", "objc" }
  filetypes = { "swift" }
}

require'lspconfig'.clangd.setup {
  --cmd = { "/usr/local/Cellar/llvm/12.0.1/bin/clangd", "-log=verbose" },
  cmd = { "xcrun", "clangd", "-log=verbose" },
  root_dir = util.root_pattern("compile_commands.json", ".git"),
  filetypes = { "c", "cpp", "objective-c", "objective-cpp", "objc" }
}

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

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
saga.init_lsp_saga()
