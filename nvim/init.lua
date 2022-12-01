vim.g.mapleader = ";"
require('plugins')
HOME = os.getenv("HOME")
vim.cmd[[
"source ~/.config/nvim/local_customizations.vim
syntax on

set nocompatible
set ttyfast
set mouse=a
set clipboard=unnamedplus
set background=dark
set tabstop=4
set hlsearch
set incsearch
set expandtab
set number
set cpt=.,w,b,u,t
set softtabstop=4
set shiftwidth=4
set autoindent
set number
set backupdir=~/.cache/nvim
set ignorecase
set smartcase
set timeoutlen=400
set fo-=c
set fo-=o
set fo-=r
set fo+=t

nnoremap <leader><leader> :w<cr>
]]


