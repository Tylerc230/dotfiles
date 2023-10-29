local execute = vim.api.nvim_command
local fn = vim.fn

--local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

--if fn.empty(fn.glob(install_path)) > 0 then
  --fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
--end

--vim.cmd [[packadd packer.nvim]]
--vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


vim.cmd('source ~/dotfiles/nvim/nvim/basic.vim')
require('plugins')
--require('keymappings')
--require('lsp')
--require('dbg')
