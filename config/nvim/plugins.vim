call plug#begin('~/.config/nvim/plugged')

" function! Cond(cond, ...)
"   let opts = get(a:000, 0, {})
"   return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
" endfunction

" colorschemes
Plug 'morhetz/gruvbox'
" Plug 'tomasr/molokai', { 'on': 'Colors' }
" Plug 'chriskempson/vim-tomorrow-theme', { 'on': 'Colors' }
" Plug 'altercation/vim-colors-solarized', { 'on': 'Colors' }
" Plug 'sjl/badwolf', { 'on': 'Colors' }
" Plug 'trevordmiller/nova-vim', Cond(has('termguicolors'), { 'on': 'Colors' })
" Plug 'chriskempson/base16-vim', { 'on': 'Colors' }
" Plug 'nanotech/jellybeans.vim', { 'on': 'Colors' }
" Plug 'soft-aesthetic/soft-era-vim', { 'on': 'Colors' }
" Plug 'pgdouyon/vim-yin-yang', { 'on': 'Colors' }
" Plug 'junegunn/seoul256.vim'

" utilities
Plug 'junegunn/fzf',                             { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'yuki-ycino/fzf-preview.vim'
" Plug 'junegunn/vim-emoji'
" Plug 'junegunn/rainbow_parentheses.vim',         { 'on': 'RainbowParentheses' }
Plug 'junegunn/vim-easy-align',                  { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'junegunn/goyo.vim',                        { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim',                   { 'on': 'Goyo' }
" Plug 'junegunn/vim-slash'
Plug 'junegunn/gv.vim',                          { 'on': 'GV' }
" Plug 'junegunn/vim-peekaboo' TODO reuse
" Plug 'junegunn/vim-after-object'
" Plug 'vim-scripts/utl.vim' TODO reuse it probably " opens url links
Plug 'jiangmiao/auto-pairs'
"Plug 'ctrlpvim/ctrlp.vim'
" Plug 'rbong/vim-flog',                           { 'on': 'Flog' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Plug 'machakann/vim-sandwich' TODO reuse it
"Plug 'tpope/vim-commentary',                    { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-sleuth'  " detect indentation
Plug 'tpope/vim-obsession' ",                     { 'on': 'Obsess' }   save session
" Plug 'tpope/vim-tbone'  " helpers for tmux
Plug 'tpope/vim-eunuch'  " helpers for UNIX
Plug 'tpope/vim-repeat'  " . for supported plugin maps
" Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-abolish' TODO reuse it for coercion
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
" Plug 'radenling/vim-dispatch-neovim'
" Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/nerdtree',                      { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight',  { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'xuyuanp/nerdtree-git-plugin',              { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'scrooloose/syntastic'
" Plug 'benekastah/neomake' ",                      { 'on': 'Neomake' }
Plug 'janko-m/vim-test',                         { 'on': ['TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'] }
" Plug 'majutsushi/tagbar',                        { 'on': ['TagbarOpen', 'TagbarToggle'] }
Plug 'liuchengxu/vista.vim',                     { 'on': 'Vista' }
" Plug 'xolox/vim-easytags'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
" Plug 'shinchu/lightline-gruvbox.vim'
" Plug 'ap/vim-buftabline'
" Plug 'edkolev/tmuxline.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'wellle/targets.vim' TODO reuse  " Additional text objects
Plug 'sjl/gundo.vim',                            { 'on': 'GundoToggle' }  " undo tree
Plug 'mhinz/vim-startify'  " pretty starting screen
Plug 'rbgrouleff/bclose.vim',                    { 'on': 'Bclose' }  " :bd but not closing window/pane
Plug 'thirtythreeforty/lessspace.vim'  " strip trailing whitespaces for edited lines
" Plug 'evidanary/grepg.vim',                      { 'on': 'G' }
" Plug 'justinmk/vim-gtfo'
" Plug 'Valloric/YouCompleteMe', Cond(has('nvim'), { 'do': './install.py --clang-completer --gocode-completer --java-completer --rust-completer --ts-completer' })
" " rustup component add rust-src
" Plug 'rdnetto/YCM-Generator', Cond(has('nvim'),  { 'branch': 'stable'})
" " Plug 'Shougo/neocomplete.vim', Cond(!has('nvim'))  deprecated
" Plug 'Shougo/deoplete.nvim', Cond(!has('nvim'))
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neovim/nvim-lspconfig'
   " Plug 'ray-x/lsp_signature.nvim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'simrat39/rust-tools.nvim'
" Plug 'kabouzeid/nvim-lspinstall'
" Plug 'Shougo/echodoc.vim'
" Plug 'roxma/vim-hug-neovim-rpc', Cond(!has('nvim'))
" Plug 'roxma/nvim-yarp', Cond(!has('nvim'))
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Yggdroot/indentLine',                      { 'on': 'IndentLinesEnable' }
" Plug 'mptre/vim-printf',                         { 'on': 'Printf' }
" Plug 'gelguy/Cmd2.vim'
" Plug 'djmoch/vim-makejob', Cond(!has('nvim') && (v:version >= 800))
" Plug 'brooth/far.vim' TODO reuse it,                           { 'on': ['Far', 'Farp'] }
" Plug 'AndrewRadev/linediff.vim' TODO reuse it,                 { 'on': 'Linediff' }
" Plug 'AndrewRadev/dsf.vim'
" Plug 'AndrewRadev/deleft.vim'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'AndrewRadev/whitespaste.vim'
" Plug 'AndrewRadev/undoquit.vim' TODO reuse?
Plug 'AndrewRadev/tagalong.vim'
" Plug 'matze/vim-move'
" Plug 't9md/vim-textmanip' fun but I don't use it
" Plug 'mileszs/ack.vim'
" Plug 'AndrewRadev/multichange.vim' ",             { 'on': 'Multichange' }
" Plug 'haya14busa/vim-asterisk'
" Plug 'dietsche/vim-lastplace'
" Plug 'kopischke/vim-stay'
Plug 'alvan/vim-closetag'
" Plug 'Chiel92/vim-autoformat',                   { 'on': 'Autoformat' }
" Plug 'pseewald/vim-anyfold'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'arecarn/vim-fold-cycle' TODO reuse it
" Plug 'kana/vim-textobj-user' TODO ?
" Plug 'jceb/vim-textobj-uri' TODO ?
" Plug 'dodie/vim-disapprove-deep-indentation'
Plug 'tweekmonster/startuptime.vim',             { 'on': 'StartupTime' }
" Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'vim-scripts/VisIncr'
" Plug 'google/vim-searchindex'
" Plug 'blueyed/vim-qf_resize' TODO reuse
" Plug 'romainl/vim-qf' TODO reuse
" Plug 'lfilho/cosco.vim'
Plug 'benmills/vimux'
" Plug 'kana/vim-arpeggio'
" Plug 'embear/vim-localvimrc'
Plug 'sk1418/Join'
" Plug 'will133/vim-dirdiff',                      { 'on': 'DirDiff' }
" Plug 'Konfekt/FastFold'
" Plug 'justinmk/vim-dirvish', Cond(has('nvim'))
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
" Plug 'dhruvasagar/vim-zoom'
" Plug 'auwsmit/vim-active-numbers'
" Plug 'vim-scripts/MPage' TODO nice but too slow
" Plug 'bergercookie/vim-debugstring'
" Plug 'haya14busa/vim-edgemotion'
" Plug 'gorkunov/smartpairs.vim'
" Plug 'reedes/vim-litecorrect'
" Plug 'beloglazov/vim-online-thesaurus'
" Plug 'Ron89/thesaurus_query.vim'
" Plug 'thiagoalessio/rainbow_levels.vim'
" Plug 'Shougo/vimproc.vim',                       { 'do' : 'make'}
" Plug 'sodapopcan/vim-twiggy' TODO reuse it,                    { 'on': 'Twiggy' }
" Plug 'dbmrq/vim-redacted' TODO reuse it,                       { 'on': 'Redact' }
" Plug 'vim-vdebug/vdebug'
Plug 'sickill/vim-pasta'
" Plug 'blueyed/vim-diminactive'
" Plug 'euclio/gitignore.vim'
" Plug 'vim-scripts/gitignore'
" Plug 'octref/RootIgnore'
" Plug 'ervandew/supertab'
" Plug 'andymass/vim-matchup' TODO expensive but nice
Plug 'meain/vim-package-info', { 'do': 'npm install' }
Plug 'wsdjeg/vim-fetch'

" language-specific plugins
" Plug 'fatih/vim-go',                  { 'for': 'go', 'do': ':GoInstallBinaries' }
" Plug 'derekwyatt/vim-scala',          { 'for': 'scala' }
" Plug 'dag/vim2hs',                    { 'for': 'haskell' }
" Plug 'def-lkb/ocp-indent-vim', { 'for': 'ocaml' } " indentation tool for OCaml
" Plug 'python-mode/python-mode',       { 'for': 'python', 'branch': 'develop', 'do': 'git submodule update --init --recursive' }
" Plug 'davidhalter/jedi-vim',          { 'for': 'python' }
" Plug 'fisadev/vim-isort',             { 'for': 'python', 'on': 'Isort' }
" Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
" Plug 'vim-scripts/TeX-9', { 'for': 'latex' }
" Plug 'lervag/vimtex',                 { 'for': ['latex', 'tex'] }
" Plug 'brennier/quicktex',             { 'for': ['latex', 'tex'] }
" Plug 'reedes/vim-pencil',             { 'for': ['latex', 'tex'] }
" Plug 'rhysd/vim-grammarous',          { 'on': 'GrammarousCheck', 'for': ['latex', 'tex', 'org', 'markdown', 'html', 'vimwiki'] }
" Plug 'reedes/vim-wordy',              { 'for': ['latex', 'tex', 'org', 'vimwiki', 'markdown', 'html'] }
" Plug 'dbmrq/vim-ditto' TODO reuse it
" Plug 'jceb/vim-orgmode',              { 'for': 'org' }
" Plug 'mattn/calendar-vim',            { 'for': ['org', 'vimwiki'] }
" Plug 'itchyny/calendar.vim',          { 'on': 'Calendar' }
" Plug 'tpope/vim-speeddating',         { 'for': 'org' }  " Increment/Decrement timestamps
" Plug 'inkarkat/vim-SyntaxRange',      { 'for': 'org' }
" Plug 'vim-scripts/SyntaxRange',       { 'for': 'org' }
" Plug 'chrisbra/NrrwRgn',              { 'for': 'org' }
Plug 'vimwiki/vimwiki',               { 'branch': 'dev', 'for': 'vimwiki' }
" Plug 'blindFS/vim-taskwarrior',       { 'on': 'TW' }
" Plug 'tbabej/taskwiki',               { 'for': 'vimwiki' }  " has requirements `sudo pip install --upgrade git+git://github.com/tbabej/tasklib@develop`
" Plug 'Alok/notational-fzf-vim',       { 'for': 'vimwiki', 'on': 'NV' }
Plug 'elzr/vim-json',                 { 'for': 'json' }
Plug 'andreshazard/vim-logreview',    { 'for': 'logreview' }
" Plug 'gregsexton/MatchTag',           { 'for': 'html' } " match tags in html, similar to paren support
" Plug 'othree/html5.vim',              { 'for': 'html' } " html5 support
" Plug 'hail2u/vim-css3-syntax',        { 'for': 'css' }
" Plug 'gavocanov/vim-js-indent',       { 'for': 'javascript' } " JavaScript indent support
" Plug 'othree/yajs.vim',               { 'for': 'javascript' } " JavaScript syntax plugin
" Plug 'pangloss/vim-javascript',       { 'for': 'javascript' }
" Plug 'vim-scripts/Conque-GDB',        { 'for': ['c', 'cpp'] } " gdb integration
" Plug 'jeaye/color_coded',             { 'for': ['c', 'cpp', 'objc', 'objcpp'] }
" Plug 'arakashic/chromatica.nvim',     { 'for': ['c', 'cpp', 'objc', 'objcpp'] }
" Plug 'dylon/vim-antlr',               { 'for': ['antlr', 'antlr3', 'antlr4'] } " antlr
" Plug 'junegunn/vader.vim',            { 'on': 'Vader', 'for': 'vader' }
" Plug 'jalvesaq/Nvim-R',               { 'for': 'r' }
" Plug 'alcesleo/vim-uppercase-sql',    { 'for': 'sql' }
" Plug 'JuliaEditorSupport/julia-vim' ", { 'for': 'julia' }
" Plug 'vim-scripts/coq-syntax',        { 'for': 'coq' }
" Plug 'vim-scripts/coq-indent',        { 'for': 'coq' }
" Plug 'let-def/vimbufsync',            { 'for': 'coq' }
" Plug 'the-lambda-church/coquille',    { 'for': 'coq' }
Plug 'whonore/Coqtail',               { 'for': 'coq' }
" Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java'}
" Plug 'othree/xml.vim',                { 'for': 'xml' }
" Plug 'rust-lang/rust.vim',            { 'for': 'rust' }
" Plug 'rodjek/vim-puppet',             { 'for': 'puppet' }
" Plug 'b4b4r07/vim-hcl'
" Plug 'hashivim/vim-vagrant'
Plug 'hashivim/vim-consul'
" Plug 'hashivim/vim-nomadproject'
Plug 'hashivim/vim-terraform'
" Plug 'fatih/vim-hclfmt'
Plug 'jvirtanen/vim-hcl'
" Plug 'hwayne/tla.vim'
" Plug 'chrisbra/csv.vim',              { 'for': 'csv' }
Plug 'ekalinin/Dockerfile.vim'
Plug 'cespare/vim-toml',              { 'for': 'toml' }
" Plug 'tmux-plugins/vim-tmux'
" Plug 'dag/vim-fish'
" Plug 'tikhomirov/vim-glsl'
" Plug 'rnestler/michelson.vim'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'sheerun/vim-polyglot'
" Plug 'evanleck/vim-svelte',           {'branch': 'main'}
Plug 'leafgarland/typescript-vim',    { 'for': 'typescript' }

" Plug 'ryanoasis/vim-devicons'  " Need NerdFonts


call plug#end()
