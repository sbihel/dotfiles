call plug#begin('~/.config/nvim/plugged')

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'sjl/badwolf'
Plug 'trevordmiller/nova-vim', Cond(has('termguicolors'))
Plug 'chriskempson/base16-vim'


" utilities
Plug 'junegunn/fzf',                             { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/rainbow_parentheses.vim',         { 'on': 'RainbowParentheses' }
Plug 'junegunn/vim-easy-align',                  { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/goyo.vim',                        { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim',                   { 'on': 'Goyo' }
Plug 'junegunn/vim-slash'
Plug 'junegunn/gv.vim',                          { 'on': 'GV' }
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-after-object'
Plug 'vim-scripts/utl.vim' " opens url links
Plug 'jiangmiao/auto-pairs'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregsexton/gitv',                          { 'on': 'Gitv'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
"Plug 'tpope/vim-commentary',                    { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-sleuth'  " detect indentation
Plug 'tpope/vim-obsession' ",                     { 'on': 'Obsess' }   save session
Plug 'tpope/vim-tbone'  " helpers for tmux
Plug 'tpope/vim-eunuch'  " helpers for UNIX
Plug 'tpope/vim-repeat'  " . for supported plugin maps
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'radenling/vim-dispatch-neovim'
"Plug 'Shougo/deoplete.nvim'
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree',                      { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight',  { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'xuyuanp/nerdtree-git-plugin',              { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake' ",                      { 'on': 'Neomake' }
Plug 'janko-m/vim-test',                         { 'on': ['TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'] }
Plug 'majutsushi/tagbar' ",                       { 'on': ['TagbarOpen', 'TagbarToggle'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'wellle/targets.vim'  " Additional text objects
Plug 'sjl/gundo.vim',                            { 'on': 'GundoToggle' }  " undo tree
Plug 'mhinz/vim-startify'  " pretty starting screen
Plug 'rbgrouleff/bclose.vim',                    { 'on': 'Bclose' }  " :bd but not closing window/pane
Plug 'thirtythreeforty/lessspace.vim'  " strip trailing whitespaces for edited lines
Plug 'evidanary/grepg.vim',                      { 'on': 'G' }
Plug 'justinmk/vim-gtfo'
Plug 'Valloric/YouCompleteMe', Cond(has('nvim'), { 'do': './install.py --clang-completer --gocode-completer' })
Plug 'rdnetto/YCM-Generator', Cond(has('nvim'),  { 'branch': 'stable'})
Plug 'Shougo/neocomplete.vim', Cond(!has('nvim'))
Plug 'Yggdroot/indentLine',                      { 'on': 'IndentLinesEnable' }
Plug 'mptre/vim-printf',                         { 'on': 'Printf' }
Plug 'gelguy/Cmd2.vim'
Plug 'djmoch/vim-makejob', Cond(!has('nvim') && (v:version >= 800))
Plug 'brooth/far.vim',                           { 'on': 'Far' }
Plug 'AndrewRadev/linediff.vim',                 { 'on': 'Linediff' }
Plug 'AndrewRadev/dsf.vim'
Plug 'matze/vim-move'
Plug 't9md/vim-textmanip'
Plug 'mileszs/ack.vim'
" Plug 'AndrewRadev/multichange.vim' ",             { 'on': 'Multichange' }
Plug 'haya14busa/vim-asterisk'
" Plug 'dietsche/vim-lastplace'
Plug 'kopischke/vim-stay'
Plug 'alvan/vim-closetag'
Plug 'Chiel92/vim-autoformat',                   { 'on': 'Autoformat' }
Plug 'pseewald/vim-anyfold'
Plug 'michaeljsmith/vim-indent-object'
Plug 'arecarn/vim-fold-cycle'
Plug 'kana/vim-textobj-user'
Plug 'jceb/vim-textobj-uri'
" Plug 'dodie/vim-disapprove-deep-indentation'
Plug 'tweekmonster/startuptime.vim',             { 'on': 'StartupTime' }
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'vim-scripts/VisIncr'
Plug 'google/vim-searchindex'
Plug 'blueyed/vim-qf_resize'
Plug 'romainl/vim-qf'
Plug 'lfilho/cosco.vim'
Plug 'benmills/vimux'
Plug 'kana/vim-arpeggio'
Plug 'octref/RootIgnore'
Plug 'embear/vim-localvimrc'
Plug 'AndrewRadev/deleft.vim'
Plug 'sk1418/Join'
Plug 'will133/vim-dirdiff',                      { 'on': 'DirDiff' }
Plug 'Konfekt/FastFold'
Plug 'justinmk/vim-dirvish', Cond(has('nvim'))
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'dhruvasagar/vim-zoom'


" language-specific plugins
Plug 'fatih/vim-go',               { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'derekwyatt/vim-scala',       { 'for': 'scala' }
Plug 'dag/vim2hs',                 { 'for': 'haskell' }
" Plug 'def-lkb/ocp-indent-vim', { 'for': 'ocaml' } " indentation tool for OCaml
Plug 'klen/python-mode',           { 'for': 'python' }
Plug 'fisadev/vim-isort',          { 'for': 'python', 'on': 'Isort' }
" Plug 'vim-scripts/TeX-9', { 'for': 'latex' }
Plug 'lervag/vimtex',              { 'for': ['latex', 'tex'] }
Plug 'reedes/vim-pencil',          { 'for': ['latex', 'tex'] }
Plug 'brennier/quicktex',          { 'for': ['latex', 'tex'] }
Plug 'rhysd/vim-grammarous',       { 'on': 'GrammarousCheck', 'for': ['latex', 'tex'] }
Plug 'jceb/vim-orgmode',           { 'for': 'org' }
Plug 'mattn/calendar-vim',         { 'for': ['org', 'vimwiki'] }
Plug 'itchyny/calendar.vim',       { 'on': 'Calendar' }
Plug 'tpope/vim-speeddating',      { 'for': 'org' }  " Increment/Decrement timestamps
Plug 'blindFS/vim-taskwarrior',    { 'on': 'TW' }
Plug 'tbabej/taskwiki',            { 'for': 'vimwiki' }  " has requirements `sudo pip install --upgrade git+git://github.com/tbabej/tasklib@develop`
Plug 'Alok/notational-fzf-vim',    { 'for': 'vimwiki', 'on': 'NV' }
Plug 'elzr/vim-json',              { 'for': 'json' }
Plug 'andreshazard/vim-logreview', { 'for': 'logreview' }
Plug 'gregsexton/MatchTag',        { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim',           { 'for': 'html' } " html5 support
Plug 'hail2u/vim-css3-syntax',     { 'for': 'css' }
Plug 'gavocanov/vim-js-indent',    { 'for': 'javascript' } " JavaScript indent support
Plug 'othree/yajs.vim',            { 'for': 'javascript' } " JavaScript syntax plugin
Plug 'pangloss/vim-javascript',    { 'for': 'javascript' }
Plug 'vim-scripts/Conque-GDB',     { 'for': ['c', 'cpp'] } " gdb integration
Plug 'jeaye/color_coded',          { 'for': ['c', 'cpp', 'objc', 'objcpp'] }
Plug 'arakashic/chromatica.nvim',  { 'for': ['c', 'cpp', 'objc', 'objcpp'] }
Plug 'dylon/vim-antlr',            { 'for': ['antlr', 'antlr3', 'antlr4'] } " antlr
Plug 'junegunn/vader.vim',         { 'on': 'Vader', 'for': 'vader' }
Plug 'jalvesaq/Nvim-R',            { 'for': 'r' }
Plug 'alcesleo/vim-uppercase-sql', { 'for': 'sql' }
Plug 'vimwiki/vimwiki',            { 'branch': 'dev' } " { 'for': 'vimwiki' }
Plug 'JuliaEditorSupport/julia-vim' ", { 'for': 'julia' }
Plug 'vim-scripts/coq-syntax',     { 'for': 'coq' }
Plug 'vim-scripts/coq-indent',     { 'for': 'coq' }
Plug 'let-def/vimbufsync',         { 'for': 'coq' }
Plug 'the-lambda-church/coquille', { 'for': 'coq' }

Plug 'ryanoasis/vim-devicons'  " Need NerdFonts


call plug#end()
