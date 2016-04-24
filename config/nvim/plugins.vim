filetype off

call plug#begin('~/.config/nvim/plugged')


" colorschemes
" Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'


" utilities
Plug 'vim-scripts/utl.vim' " opens url links
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'  " detect indentation
Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'xuyuanp/nerdtree-git-plugin'
" Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'
Plug 'janko-m/vim-test'
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpen' }
Plug 'edkolev/tmuxline.vim'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-speeddating'
Plug 'wellle/targets.vim'  " Additional text objects
Plug 'sjl/gundo.vim'  " undo tree
Plug 'mhinz/vim-startify'  " pretty starting screen
Plug 'rbgrouleff/bclose.vim'  " :bd but not closing window/pane


" language-specific plugins
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'dag/vim2hs', { 'for': 'haskell' }
Plug 'def-lkb/ocp-indent-vim', { 'for': 'ocaml' } " indentation tool for OCaml
Plug 'klen/python-mode', { 'for': 'python' }
" Plug 'vim-scripts/TeX-9', { 'for': 'latex' }
Plug 'lervag/vimtex', { 'for': 'latex' }
Plug 'vim-scripts/LanguageTool', { 'for': 'latex' }
Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'elzr/vim-json', { 'for': 'json' }


call plug#end()
filetype plugin indent on
