call plug#begin('~/.config/nvim/plugged')

Plug 'ellisonleao/gruvbox.nvim'

" Plug 'junegunn/fzf',                             { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim',                        { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim',                   { 'on': 'Goyo' }
Plug 'junegunn/gv.vim',                          { 'on': 'GV' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive', { 'on': 'Git' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'  " detect indentation
Plug 'tpope/vim-eunuch'  " helpers for UNIX
Plug 'tpope/vim-repeat'  " . for supported plugin maps
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sjl/gundo.vim',                            { 'on': 'GundoToggle' }  " undo tree
Plug 'mhinz/vim-startify'  " pretty starting screen
Plug 'rbgrouleff/bclose.vim',                    { 'on': 'Bclose' }  " :bd but not closing window/pane
Plug 'thirtythreeforty/lessspace.vim'  " strip trailing whitespaces for edited lines
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'simrat39/rust-tools.nvim'
Plug 'j-hui/fidget.nvim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'alvan/vim-closetag'
Plug 'tweekmonster/startuptime.vim',             { 'on': 'StartupTime' }
Plug 'benmills/vimux'
Plug 'sk1418/Join'
Plug 'sickill/vim-pasta'
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'Saecki/crates.nvim'
Plug 'wsdjeg/vim-fetch'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'jvirtanen/vim-hcl'

call plug#end()
