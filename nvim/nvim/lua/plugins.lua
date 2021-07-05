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
  use 'nvim-treesitter/nvim-treesitter'
  use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    config = function() require 'lunar' end,
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'kyazdani42/nvim-tree.lua'
  use 't9md/vim-choosewin'
  use 'airblade/vim-gitgutter'
  use 'easymotion/vim-easymotion'
  use 'scrooloose/nerdcommenter'

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
}

