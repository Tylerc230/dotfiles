#!/usr/bin/env python3
# Automatically change neovim's working directory via
# the built in terminal.
# 
# Full neovim configuration:
# https://github.com/DrSpeedy/nvimrc
#
# Original issue thread:
# https://github.com/neovim/neovim/issues/3294

import neovim
import os

nvim = neovim.attach('socket', path=os.environ['NVIM_LISTEN_ADDRESS'])
nvim.vars['__autocd_cwd'] = os.getcwd()
nvim.command('execute "cd" fnameescape(g:__autocd_cwd)')
del nvim.vars['__autocd_cwd']
