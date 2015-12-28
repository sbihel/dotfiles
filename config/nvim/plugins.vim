filetype off

call plug#begin('~/.config/nvim/plugged')


Plug 'jceb/vim-orgmode'
Plug 'vim-scripts/utl.vim'
Plug 'vim-scripts/TeX-9'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'def-lkb/ocp-indent-vim' " indentation tool for OCaml
Plug 'klen/python-mode'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'edkolev/tmuxline.vim'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'derekwyatt/vim-scala'
Plug 'dag/vim2hs'

call plug#end()
filetype plugin indent on
