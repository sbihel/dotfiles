local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'ellisonleao/gruvbox.nvim',
    opts = function()
      return {
        contrast = "hard",
      }
    end
  },

  { 'folke/zen-mode.nvim', cmd = 'ZenMode' },
  { 'folke/twilight.nvim', cmd = 'ZenMode' },
  { 'junegunn/gv.vim', cmd = 'GV' },
  {
    'jiangmiao/auto-pairs',
    event = "BufReadPre"
  },
  { 'tpope/vim-fugitive', cmd = 'Git' },
  'tpope/vim-surround',
  {
    'tpope/vim-sleuth',  -- detect indentation
    event = "BufReadPre"
  },
  {
    'tpope/vim-eunuch',  -- helpers for UNIX
    cmd = {"Remove", "Delete", "Move", "Mkdir", "SudoWrite"}
  },
  'tpope/vim-repeat',  -- . for supported plugin maps
  'tpope/vim-vinegar',
  'tpope/vim-apathy',
  'tpope/vim-rhubarb',
  'tpope/vim-commentary',
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          icons_enabled = false,
          theme = 'gruvbox',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
        },
        sections = {
          lualine_a = {
            { 'mode', fmt = function(str) return str:sub(1,1) end } },
          lualine_b = {},
          lualine_c = {{'filename', path = 1,}},
          lualine_x = {'filetype',},
          lualine_y = {'encoding', 'fileformat'},
          lualine_z = {'location', 'diagnostics'}
        }
      }
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      return {
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '◢' },
          topdelete    = { text = '◥' },
          changedelete = { text = '◢' },
          untracked    = { text = '┆' },
        },
      }
    end
  },
  { 'sjl/gundo.vim', cmd = 'GundoToggle' },  -- undo tree
  'mhinz/vim-startify',  -- pretty starting screen
  { 'rbgrouleff/bclose.vim', cmd = 'Bclose' },  -- :bd but not closing window/pane
  {
    'thirtythreeforty/lessspace.vim',  -- strip trailing whitespaces for edited lines
    event = "InsertEnter"
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
  },
  'ray-x/lsp_signature.nvim',
  {
    'stevearc/dressing.nvim',
    event = "VeryLazy"
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    opts = function()
      local cmp = require("cmp")
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end
      return {
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'nvim_lsp_signature_help' },
            { name = 'vsnip' },
          }, {
            { name = 'path' },
            { name = 'buffer' },
            { name = 'crates' },
          }),
        mapping = {
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            -- behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
              feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
              cmp.complete()
            else
              fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              feedkey("<Plug>(vsnip-jump-prev)", "")
            end
          end, { "i", "s" }),
        },
      }
    end,
  },

  'simrat39/rust-tools.nvim',
  {
    'j-hui/fidget.nvim',
    event = "VeryLazy",
    opts = function()
      return {}
    end
  },
  'AndrewRadev/splitjoin.vim',
  'AndrewRadev/tagalong.vim',
  {
    'alvan/vim-closetag',
    event = "InsertEnter"
  },
  {
    'benmills/vimux',
    cmd = "VimuxRunCommand"
  },
  'sk1418/Join',
  'sickill/vim-pasta',
  {
    'nvim-lua/plenary.nvim',
    lazy = true
  },
  'jose-elias-alvarez/null-ls.nvim',
  {
    'Saecki/crates.nvim',
    ft = "toml"
  },
  'nvim-lua/plenary.nvim',
  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    opts = function()
      return {
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = "move_selection_previous",
              ["<C-j>"] = "move_selection_next",
              ["<Esc>"] = "close"
            }
          }
        }
      }
    end
  },

  {
    'jvirtanen/vim-hcl',
    ft = {"hcl", "tf"}
  },
})

vim.cmd([[
set nocompatible  " not compatible with vi

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8

set autoread " detect when a file is changed
" faster redrawing set ttyfast
set lazyredraw

" TAB control, indentation
set expandtab  " insert spaces instead of tabs for <Tab>
set smarttab   " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4
set shiftwidth=4
set autoindent
set copyindent  " copy the previous indentation on autoindenting
set smartindent

" search
set ignorecase
set smartcase  " ignore case if search pattern is all lowercase
set hlsearch  " highlight search terms
set incsearch  " show search matches as you type
" nnoremap <silent><Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <silent><leader>q :nohlsearch<CR>
  " cancel search with escape

" code folding settings
set foldmethod=expr
" set foldnestmax=10
" set foldlevel=0 " number of fold opened by default
set foldenable

set scrolloff=3 " lines of text around cursor

set norelativenumber  " show relative lines number
set nonumber  " show lines number
set showmatch  " show matching parenthesis
if has('nvim')
  set clipboard=unnamedplus  " allow copy/paste from nvim to other app
else
  set clipboard=unnamed  " allow copy/paste from vim to other app
endif
set title  " change the terminal's title
set hidden  " current buffer can be put into background

" write when forgot to launch nvim with sudo
cmap w!! w !sudo tee % >/dev/null

set undofile  " persistent undo
set undodir=~/.config/nvim/undodir,~/.tmp,~/tmp,/var/tmp,/tmp
set undolevels=5000  " How many undos

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

set textwidth=120
set colorcolumn=120
set wrap "turn on visual line wrapping
set linebreak " set wrapping
set showbreak=… " show ellipsis at breaking
set breakindent

" show tabs
"set list
"set listchars=tab:!·
" toggle invisible characters
set invlist
set listchars=tab:\|\ ,trail:⋅,extends:❯,precedes:❮,nbsp:␣ ",eol:¬
"highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

if has('nvim')
  set inccommand=split " or nosplit
endif

set mouse=a

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

set nrformats+=alpha

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader      = ' '
let maplocalleader = '\'
" nnoremap ; :

" <F6> | paste toggle
set pastetoggle=<F6>

nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>
vnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>
" circular windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" switch between current and last buffer
nnoremap <leader>. <c-^>

nnoremap <leader>l :bnext<CR>
nnoremap        ]b :bnext<cr>
nnoremap <leader>h :bprevious<CR>
nnoremap        [b :bprev<cr>

nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" jk | Escaping!
inoremap jk <Esc>
"xnoremap jk <Esc>
"cnoremap jk <C-c>

" row by row
" nnoremap j gj
" nnoremap k gk
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
vnoremap <expr> j v:count ? 'j' : 'gj'
vnoremap <expr> k v:count ? 'k' : 'gk'

" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>
" Quit
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" Completion
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" write read-only files
cmap w!! w !sudo tee % >/dev/null

set spelllang=en_gb

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE SPECIFICS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c setlocal tw=80 cc=80
autocmd FileType cpp setlocal tw=80 cc=80
autocmd BufReadPre README* setlocal tw=80 cc=80
"autocmd FileType cpp setlocal tw=80 cc=80
autocmd FileType ocaml setlocal ts=2 sts=2 sw=2 tw=80 cc=80
autocmd FileType org setlocal tw=80 cc=80 nocin spell fo+=n
autocmd FileType calendar setlocal tw=0 cc=0

let g:tex_flavor = "latex"
function! LatexFormatExpr(start, end)
    silent execute a:start.','.a:end.'s/[.!?%]\zs /\r/g'
endfunction
autocmd FileType tex setlocal tw=0 cc=0 spell formatexpr=LatexFormatExpr(v:lnum,v:lnum+v:count-1) " fo+=a
autocmd FileType latex setlocal tw=0 cc=0 spell formatexpr=LatexFormatExpr(v:lnum,v:lnum+v:count-1) " fo+=a

autocmd FileType python setlocal cc=120 tw=120
autocmd FileType git setlocal tw=0 cc=0 nofoldenable nowrap
autocmd FileType gitcommit setlocal tw=72 cc=72 spell
autocmd FileType vim setlocal tw=78 cc=78

autocmd BufRead,BufNewFile *.wiki set filetype=vimwiki
autocmd FileType vimwiki setlocal nowrap spell tw=0 cc=0

autocmd FileType coq setlocal tw=80 cc=80
autocmd FileType go setlocal tw=80 cc=80 noexpandtab

autocmd BufRead,BufNewFile /*/git/config set filetype=gitconfig

autocmd BufRead,BufNewFile /*/neomutt* set filetype=mail
augroup mail_filetype
  autocmd FileType mail
    \ autocmd VimEnter *
      \ :0,'}s/\s\+$//e
      \ | :execute 'normal gg}'
      \ | :put! =\"\n\"
      \ | :execute 'normal j'
      \ | :execute 'startinsert'
augroup END
autocmd FileType mail setlocal tw=78 cc=78 spell fo+=aw

autocmd BufRead,BufNewFile *.jsonld set filetype=json
autocmd FileType json setlocal tw=0 cc=0 foldmethod=syntax
autocmd FileType bib setlocal tw=0 cc=0
autocmd FileType html setlocal tw=0 cc=0
autocmd FileType muttrc setlocal tw=0 cc=0
autocmd FileType markdown setlocal spell tw=80 cc=80

autocmd FileType qf setlocal tw=0 cc=0

autocmd BufRead,BufNewFile /*/Jenkinsfile* set filetype=groovy
autocmd FileType groovy setlocal tw=0

autocmd FileType dockerfile setlocal tw=0 cc=0

autocmd BufRead,BufNewFile /*/*.yml.symlink set filetype=yaml
autocmd BufRead,BufNewFile *.eyaml set filetype=yaml

autocmd FileType jproperties setlocal tw=0 cc=0

autocmd FileType netrw setlocal tw=0 cc=0

autocmd BufRead,BufNewFile /*/*.csv set filetype=csv

autocmd BufRead,BufNewFile *.schema set filetype=json

autocmd BufRead,BufNewFile *.g set filetype=antlr3
autocmd BufRead,BufNewFile *.g4 set filetype=antlr4

autocmd BufRead,BufNewFile *.tera set filetype=html

autocmd FileType rust setlocal tw=0 cc=0

autocmd BufRead,BufNewFile *.nomad set filetype=hcl

autocmd FileType javascript setlocal tabstop=2

autocmd BufRead,BufNewFile *.typ set filetype=typst

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Gundo tree | <F5>
nnoremap <F5> :GundoToggle<CR>

" Startify
autocmd User Startified setlocal buftype=
let g:startify_change_to_vcs_root = 1

" Bclose
nnoremap <silent> <Leader>bd :Bclose<CR>

" Telescope
nnoremap <leader><leader> <cmd>Telescope find_files<cr>
nnoremap <leader>ag <cmd>Telescope live_grep<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>

" closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml"

" lessspace
let g:lessspace_blacklist = ['mail']

" vimux
nmap <Leader>vp :VimuxPromptCommand<CR>
nmap <Leader>vl :VimuxRunCommand "!!"<CR>
nmap <Leader>vi :VimuxInspectRunner<CR>
nmap <Leader>vz :VimuxZoomRunner<CR>

" autopairs
au FileType markdown,vimwiki let b:autopairs_loaded=1
au FileType org let g:AutoPairsMapSpace=0

ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"
]])

local lsp = require "lspconfig"
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function get_python_path(workspace)
  local util = require('lspconfig/util')
  local path = util.path
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end
  -- Find and use virtualenv via poetry in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
    return path.join(venv, 'bin', 'python')
  end
  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end


require('rust-tools').setup({
  server = {
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy"
        },
        procMacro = {
          enable = true
        }
      }
    }
  }
})

lsp.terraformls.setup({
  capabilities = capabilities
})
lsp.tflint.setup({
  capabilities = capabilities
})
lsp.tsserver.setup({
  capabilities = capabilities
})
lsp.pyright.setup({
  capabilities = capabilities,
  on_attach = function()
    require'lsp_signature'.on_attach {
      hint_enable = false,
    }
  end,
  on_init = function(client)
    client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
  end
})
lsp.gopls.setup({
  capabilities = capabilities
})
lsp.sourcekit.setup({
  capabilities = capabilities
})
lsp.jdtls.setup({
  capabilities = capabilities
})
lsp.yamlls.setup({
  capabilities = capabilities
})
lsp.dockerls.setup({
  capabilities = capabilities
})
lsp.docker_compose_language_service.setup({
  capabilities = capabilities
})
lsp.dartls.setup({
  capabilities = capabilities
})
lsp.typst_lsp.setup({
  capabilities = capabilities
})
lsp.sourcekit.setup({
  capabilities = capabilities
})
require('null-ls').setup({
  capabilities = capabilities
})
require('crates').setup({
  text = {
    loading = "  Loading...",
    version = "",
    prerelease = "  %s",
    yanked = "  %s yanked",
    nomatch = "  Not found",
    upgrade = " ^%s",
    error = "  Error fetching crate",
  },
  popup = {
    text = {
      title = "# %s",
      pill_left = "",
      pill_right = "",
      created_label = "created        ",
      updated_label = "updated        ",
      downloads_label = "downloads      ",
      homepage_label = "homepage       ",
      repository_label = "repository     ",
      documentation_label = "documentation  ",
      crates_io_label = "crates.io      ",
    categories_label = "categories     ",
    keywords_label = "keywords       ",
    version = "%s",
    prerelease = "%s pre-release",
    yanked = "%s yanked",
    enabled = "* s",
    transitive = "~ s",
    normal_dependencies_title = "  Dependencies",
    build_dependencies_title = "  Build dependencies",
    dev_dependencies_title = "  Dev dependencies",
    optional = "? %s",
    loading = " ...",
    },
  },
  src = {
    text = {
      prerelease = " pre-release ",
      yanked = " yanked ",
    },
  },
  null_ls = {
    enabled = true,
  }
})

vim.cmd("colorscheme gruvbox")


vim.cmd([[
autocmd BufWritePre *.\(rs\|tf\|js\|ts\|py\|dart\|swift\) lua vim.lsp.buf.format()
nnoremap <silent> <leader>D  :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>d  :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>n  :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>r  :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>[  :lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>]  :lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>e  :lua vim.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <leader>k  :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>K  :lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>a  :lua vim.lsp.buf.code_action()<CR>

" fugitive
nnoremap <silent> <Leader>gs       :Git<CR>
nnoremap <silent> <Leader>gc       :Git commit<CR>
nnoremap <silent> <Leader>gp       :Git push<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "normal! " . a:thenOp
  endif
endfunction

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
]])
