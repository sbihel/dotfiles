filetype off

call plug#begin('~/.config/nvim/plugged')


" colorschemes
" Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'


" utilities
Plug 'junegunn/fzf',                            { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align',                 { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-scripts/utl.vim' " opens url links
Plug 'jiangmiao/auto-pairs'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'  " detect indentation
Plug 'tpope/vim-obsession'  " save session
Plug 'tpope/vim-tbone'
Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree',                     { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'xuyuanp/nerdtree-git-plugin'
" Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'
Plug 'janko-m/vim-test'
Plug 'majutsushi/tagbar',                       { 'on': 'TagbarOpen' }
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'wellle/targets.vim'  " Additional text objects
Plug 'sjl/gundo.vim'  " undo tree
Plug 'mhinz/vim-startify'  " pretty starting screen
Plug 'rbgrouleff/bclose.vim'  " :bd but not closing window/pane
Plug 'thirtythreeforty/lessspace.vim'  " strip trailing whitespaces for edited lines


" language-specific plugins
Plug 'fatih/vim-go',               { 'for': 'go' }
Plug 'derekwyatt/vim-scala',       { 'for': 'scala' }
Plug 'dag/vim2hs',                 { 'for': 'haskell' }
" Plug 'def-lkb/ocp-indent-vim', { 'for': 'ocaml' } " indentation tool for OCaml
Plug 'klen/python-mode',           { 'for': 'python' }
" Plug 'vim-scripts/TeX-9', { 'for': 'latex' }
Plug 'lervag/vimtex',              { 'for': 'latex' }
Plug 'vim-scripts/LanguageTool',   { 'for': 'latex' }
Plug 'jceb/vim-orgmode',           { 'for': 'org' }
Plug 'mattn/calendar-vim',         { 'for': 'org' }
Plug 'tpope/vim-speeddating',      { 'for': 'org' }  " Increment/Decrement timestamps
Plug 'elzr/vim-json',              { 'for': 'json' }
Plug 'andreshazard/vim-logreview', { 'for': 'logreview' }
Plug 'gregsexton/MatchTag',        { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim',           { 'for': 'html' } " html5 support
Plug 'gavocanov/vim-js-indent',    { 'for': 'javascript' } " JavaScript indent support
Plug 'othree/yajs.vim',            { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'vim-scripts/Conque-GDB',     { 'for': ['c', 'cpp'] } " gdb integration
Plug 'dylon/vim-antlr',            { 'for': ['antlr', 'antlr3', 'antlr4'] } " antlr

Plug 'ryanoasis/vim-devicons'  " Need NerdFonts


call plug#end()
filetype plugin indent on
