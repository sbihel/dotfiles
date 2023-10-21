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

  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    dependencies = {
      'folke/twilight.nvim'
    }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    -- init = function()
    --   vim.o.timeout = true
    --   vim.o.timeoutlen = 300
    -- end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   ---@type Flash.Config
  --   opts = {},
  --   -- stylua: ignore
  --   keys = {
  --     { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
  --     { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  --     { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  --     { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --     { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  --   },
  -- },
  { 'junegunn/gv.vim', cmd = 'GV' },
  { 'tpope/vim-fugitive', cmd = {'Git', 'GBrowse'} },
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
  {
    'numToStr/Comment.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      return {}
    end
  },
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
          lualine_x = {'filetype'},
          lualine_y = {'diagnostics'},
          lualine_z = {'location'}
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
    dependencies = {
      "lukas-reineke/lsp-format.nvim",
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        event = "VeryLazy",
        opts = function()
          return {}
        end
      },
      {
        'lvimuser/lsp-inlayhints.nvim',
        opts = function()
          return {}
        end
      }
    }
  },
  {
    'stevearc/dressing.nvim',
    event = "VeryLazy",
    opts = function()
      return {
        input = {
          default_prompt = nil,
          border = "none",
          win_options = {
            winblend = 0
          },
        },
        select = {
          telescope = require("telescope.themes").get_cursor(),
        },
      }
    end
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
      'hrsh7th/cmp-cmdline',
      {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = function()
          return {
            check_ts = true
          }
        end
      },
    },
    opts = function()
      local cmp = require("cmp")
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          })
      })

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
          ['<C-k>'] = cmp.mapping.scroll_docs(-1),
          ['<C-j>'] = cmp.mapping.scroll_docs(1),
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
  {
    'Wansmer/treesj',
    cmd = 'TSJToggle',
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,
        max_join_length = 1200
      })
    end,
  },
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
    'NeogitOrg/neogit',
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
    },
    cmd = "Neogit",
    -- event = "VeryLazy",
    config = true,
    opts = function()
      return {
        -- kind = "split_above",
        -- log_view = {
        --   kind = "replace",
        -- },
        disable_signs = true,
        use_telescope = true,
        integrations = {
          diffview = true
        }
      }
    end
  },
  {
    'sindrets/diffview.nvim'
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = "0.1.3",
    cmd = "Telescope",
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      }
    },
    opts = function()
      local tlscp = require('telescope')
      tlscp.load_extension('fzf')
      return {
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = "move_selection_previous",
              ["<C-j>"] = "move_selection_next",
              ["<Esc>"] = "close"
            }
          },
          border = false,
        },
        pickers = {
          find_files = {
            hidden = true
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
          }
        },
      }
    end
  },
  {
    'kevinhwang91/nvim-bqf',
    event = "VeryLazy",
    opts = function()
      return {}
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    -- tag = 'v0.9.1',
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        -- {
        --   'andymass/vim-matchup',
        --   tag = 'v0.7.2',
        --   event = "VeryLazy",
        --   opts = function()
        --     return {}
        --   end
        -- },
      }
    },
    opts = function()
      local configs = require 'nvim-treesitter.configs'
      configs.setup {
        ensure_installed = {
          'hcl', 'terraform', 'lua', 'rust', 'kdl', 'html', 'css', 'sql', 'dockerfile', 'json', 'python', 'swift'
        },
        indent = {
          enable = true
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        textobjects = {
          select = {
            enable = true,
            -- lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
            -- selection_modes = {
            --   ['@parameter.outer'] = 'v', -- charwise
            --   ['@function.outer'] = 'V', -- linewise
            --   ['@class.outer'] = '<c-v>', -- blockwise
            -- },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = { query = "@class.outer", desc = "Next class start" },
              -- --
              -- -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
              -- ["]o"] = "@loop.*",
              -- -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
              -- --
              -- -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
              -- -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
              -- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
              -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
          },
        },
        -- matchup = {
        --   enable = true,
        -- },
      }
    end
  },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   opts = {}
  -- }
  {
    'levouh/tint.nvim',
    opts = function()
      return {
        tint = -60,
        saturation = 0.6,
        -- tint_background_colors = true,
        highlight_ignore_patterns = { "WinSeparator", "Status.*" },
      }
    end
  },
  {
    'nvim-pack/nvim-spectre',
    cmd = 'Spectre',
    opts = function()
      return {}
    end
  },
},
{
  ui = {
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      keys = "",
      plugin = "",
      runtime = "",
      source = "",
      start = "",
      task = "",
      lazy = "",
    },
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
set clipboard=unnamedplus  " allow copy/paste from nvim to other app
set title  " change the terminal's title
set hidden  " current buffer can be put into background

set cmdheight=0

" write when forgot to launch nvim with sudo
cmap w!! w !sudo tee % >/dev/null

set undofile  " persistent undo
set undodir=~/.config/nvim/undodir,~/.tmp,~/tmp,/var/tmp,/tmp
set undolevels=5000  " How many undos

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

set textwidth=120
" set colorcolumn=120
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

set inccommand=split " or nosplit

set mouse=a

set formatoptions+=j

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

nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>
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

" quickfix
nnoremap <leader>co :copen<cr>
nnoremap <leader>cc :cclose<cr>
nnoremap <leader>cn :cnext<cr>
nnoremap <leader>cp :cprev<cr>

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

nnoremap <leader>w :update<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" Completion
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" write read-only files
cmap w!! w !sudo tee % >/dev/null

set spell
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

autocmd FileType python setlocal cc=88 tw=88
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

" tagalong
let g:tagalong_additional_filetypes = ['rs']

" lessspace
let g:lessspace_blacklist = ['mail']

" vimux
nmap <Leader>vp :VimuxPromptCommand<CR>
nmap <Leader>vl :VimuxRunCommand "!!"<CR>
nmap <Leader>vi :VimuxInspectRunner<CR>
nmap <Leader>vz :VimuxZoomRunner<CR>

ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

" fugitive
nnoremap <silent> <Leader>gs       :Git<CR>
nnoremap <silent> <Leader>gc       :Git commit<CR>
nnoremap <silent> <Leader>gp       :Git push<CR>
nnoremap <silent> <Leader>gr       :.GBrowse!<CR>

nnoremap <silent> <Leader>gn       :Neogit<CR>

" treesj
nnoremap <silent> <Leader>s       :TSJToggle<CR>
]])

local lsp = require('lspconfig')
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

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
    require("lsp-format").on_attach(client)
  end,
})

lsp.rust_analyzer.setup{
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      check = {
        command = "clippy"
      },
      diagnostics = {
        disabled = {
          "unresolved-proc-macro"
        }
      },
      procMacro = {
        enable = true,
        ignored = {
          leptos_macro = {
            "server",
            "component",
          },
        },
      }
    }
  }
}
lsp.terraformls.setup({
  capabilities = capabilities
})
lsp.tflint.setup({
  capabilities = capabilities
})
lsp.nomad_lsp.setup({
  capabilities = capabilities
})
lsp.tsserver.setup({
  capabilities = capabilities
})
lsp.pyright.setup({
  capabilities = capabilities,
  -- on_attach = function()
  --   require'lsp_signature'.on_attach {
  --     hint_enable = false,
  --   }
  -- end,
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
-- lsp.docker_compose_language_service.setup({
--   capabilities = capabilities
-- })
lsp.dartls.setup({
  capabilities = capabilities
})
lsp.typst_lsp.setup({
  capabilities = capabilities
})
lsp.sourcekit.setup({
  capabilities = capabilities
})
lsp.taplo.setup({
  capabilities = capabilities
})
lsp.efm.setup({
  init_options = {
    documentFormatting = true
  },
  settings = {
    rootMarkers = {".git/"},
    languages = {
      rust = {
        {
          formatCommand = "leptosfmt --quiet --stdin",
          formatStdin = true,
          requireMarker = true,
          rootMarkers = {
            "leptosfmt.toml"
          }
        }
      }
    }
  }
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
lsp.tailwindcss.setup {
  capabilities = capabilities,
  filetypes = {
    "css",
    "scss",
    "sass",
    "postcss",
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "svelte",
    "vue",
    "rust",
  },
  init_options = {
    userLanguages = {
      rust = "html",
    },
  },
  root_dir = lsp.util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js',
    'postcss.config.ts', 'windi.config.ts', '*/tailwind.config.js'),
}

vim.cmd("colorscheme gruvbox")

vim.diagnostic.config({
  severity_sort = true
})

vim.keymap.set('n', '<leader>D', vim.lsp.buf.declaration)
vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>n', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>rn', function()
  vim.lsp.buf.rename()
  -- save all buffers after rename
  vim.cmd('silent! wa')
end)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

vim.cmd([[
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
