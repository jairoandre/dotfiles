call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'


call plug#end()

set exrc
set guicursor=
set nohlsearch
set hidden
set noerrorbells
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
set colorcolumn=80

" More space to displaying messages.
set cmdheight=2

" Have long updatetime leads to poor experience
set updatetime=50

set shortmess+=c

set background=dark
colorscheme gruvbox
" highlight Normal guibg=none

let mapleader = " "
" Common commands
nnoremap <leader>ww :w<CR>
nnoremap <leader>wl :bn<CR>
nnoremap <leader>wj :bp<CR>

" Telescope stuff
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>

fun! TrimWhiteSpace()
let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup JAIRO
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
