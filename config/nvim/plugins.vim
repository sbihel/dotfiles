call plug#begin('~/.config/nvim/plugged')


" colorschemes
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'


" utilities
Plug 'junegunn/fzf',                            { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/rainbow_parentheses.vim',        { 'on': 'RainbowParentheses' }
Plug 'junegunn/vim-easy-align',                 { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/goyo.vim',                       { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim',                  { 'on': 'Goyo' }
Plug 'junegunn/vim-slash'
Plug 'junegunn/gv.vim',                         { 'on': 'GV' }
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-after-object'
Plug 'vim-scripts/utl.vim' " opens url links
Plug 'jiangmiao/auto-pairs'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregsexton/gitv',                         { 'on': 'Gitv'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-commentary',                    { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-sleuth'  " detect indentation
Plug 'tpope/vim-obsession',                     { 'on': 'Obsess' }  " save session
Plug 'tpope/vim-tbone'  " helpers for tmux
Plug 'tpope/vim-eunuch'  " helpers for UNIX
Plug 'tpope/vim-repeat'  " . for supported plugin maps
"Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree',                     { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'xuyuanp/nerdtree-git-plugin',             { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake' ",                      { 'on': 'Neomake' }
Plug 'janko-m/vim-test',                        { 'on': ['TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'] }
Plug 'majutsushi/tagbar' ",                       { 'on': ['TagbarOpen', 'TagbarToggle'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'wellle/targets.vim'  " Additional text objects
Plug 'sjl/gundo.vim',                           { 'on': 'GundoToggle' }  " undo tree
Plug 'mhinz/vim-startify'  " pretty starting screen
Plug 'rbgrouleff/bclose.vim',                   { 'on': 'Bclose' }  " :bd but not closing window/pane
Plug 'thirtythreeforty/lessspace.vim'  " strip trailing whitespaces for edited lines
Plug 'evidanary/grepg.vim',                     { 'on': 'G' }
Plug 'justinmk/vim-gtfo'
if has('nvim')
  Plug 'Valloric/YouCompleteMe',                { 'do': './install.py' }
else
  Plug 'Shougo/neocomplete.vim'
endif
Plug 'Yggdroot/indentLine',                     { 'on': 'IndentLinesEnable' }
Plug 'mptre/vim-printf',                        { 'on': 'Printf' }
Plug 'gelguy/Cmd2.vim'
if !has('nvim') && (v:version >= 800)
  Plug 'djmoch/vim-makejob'
endif
Plug 'brooth/far.vim',                          { 'on': 'Far' }
Plug 'AndrewRadev/linediff.vim',                { 'on': 'Linediff' }
Plug 'AndrewRadev/dsf.vim'
Plug 'matze/vim-move'
Plug 't9md/vim-textmanip'


" language-specific plugins
Plug 'fatih/vim-go',               { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'derekwyatt/vim-scala',       { 'for': 'scala' }
Plug 'dag/vim2hs',                 { 'for': 'haskell' }
" Plug 'def-lkb/ocp-indent-vim', { 'for': 'ocaml' } " indentation tool for OCaml
Plug 'klen/python-mode',           { 'for': 'python' }
" Plug 'vim-scripts/TeX-9', { 'for': 'latex' }
Plug 'lervag/vimtex',              { 'for': ['latex', 'tex'] }
Plug 'reedes/vim-pencil',          { 'for': ['latex', 'tex'] }
Plug 'rhysd/vim-grammarous',       { 'on': 'GrammarousCheck', 'for': ['latex', 'tex'] }
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
Plug 'junegunn/vader.vim',         { 'on': 'Vader', 'for': 'vader' }
Plug 'vim-scripts/Vim-R-plugin',   { 'for': 'R' }
Plug 'alcesleo/vim-uppercase-sql', { 'for': 'sql' }
Plug 'vimwiki/vimwiki' ",            { 'for': 'vimwiki' }

Plug 'ryanoasis/vim-devicons'  " Need NerdFonts


call plug#end()
