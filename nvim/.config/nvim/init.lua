local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    {
      'ellisonleao/gruvbox.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        require("gruvbox").setup({ contrast = "hard" })
        vim.cmd.colorscheme "gruvbox"
      end,
    },
    {
      "folke/lazydev.nvim",
      version = "*",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    {
      'folke/zen-mode.nvim',
      version = "*",
      keys = {
        { "<leader>zm", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
      },
      dependencies = {
        'folke/twilight.nvim'
      }
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {}
    },
    {
      'junegunn/gv.vim',
      cmd = 'GV'
    },
    {
      'tpope/vim-fugitive',
      dependencies = {
        'tpope/vim-rhubarb',
      },
      keys = {
        { "<leader>gs", '<cmd>Git<cr>',                desc = "Git status" },
        { "<leader>gc", '<cmd>silent! Git commit<cr>', desc = "Git commit" },
        { "<leader>gp", '<cmd>Git push<cr>',           desc = "Git push" },
        { "<leader>gr", '<cmd>.GBrowse!<cr>',          desc = "Github link to line" },
      },
    },
    'tpope/vim-surround',
    {
      'tpope/vim-sleuth', -- detect indentation
      event = "BufReadPre"
    },
    {
      'tpope/vim-eunuch', -- helpers for UNIX
      cmd = { "Remove", "Delete", "Move", "Mkdir", "SudoWrite" }
    },
    'tpope/vim-repeat', -- . for supported plugin maps
    'tpope/vim-apathy',
    {
      'stevearc/oil.nvim',
      ---@module 'oil'
      ---@type oil.SetupOpts
      opts = {
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false
        },
        view_options = {
          show_hidden = true
        }
      },
      lazy = false,
      keys = {
        { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
      },
    },
    {
      'nvim-lualine/lualine.nvim',
      event = "VeryLazy",
      opts = {
        options = {
          icons_enabled = false,
          theme = 'gruvbox',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            { 'mode', fmt = function(str) return str:sub(1, 1) end } },
          lualine_b = {},
          lualine_c = { { 'filename', path = 1, } },
          lualine_x = { 'filetype' },
          lualine_y = { 'diagnostics' },
          lualine_z = { 'location' }
        }
      }
    },
    {
      'lewis6991/gitsigns.nvim',
      event = { "BufReadPre", "BufNewFile" },
      opts = {
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '◢' },
          topdelete    = { text = '◥' },
          changedelete = { text = '◢' },
          untracked    = { text = '┆' },
        },
      }
    },
    {
      'mhinz/vim-startify', -- pretty starting screen
      config = function()
        vim.g.startify_change_to_dir = 0
      end
    },
    {
      'thirtythreeforty/lessspace.vim', -- strip trailing whitespaces for edited lines
      event = "InsertEnter"
    },
    {
      "neovim/nvim-lspconfig",
      version = "*",
      dependencies = {
        "lukas-reineke/lsp-format.nvim",
        {
          'j-hui/fidget.nvim',
          version = '*',
          opts = {}
        },
      }
    },
    {
      "folke/snacks.nvim",
      event = "VeryLazy",
      ---@module 'snacks'
      ---@type snacks.Config
      opts = {
        input = {
          enabled = true,
          icon = ">"
        },
        picker = {
          enabled = true,
          prompt = "> ",
          layouts = {
            select = {
              layout = {
                relative = 'cursor',
                backdrop = false,
                box = "vertical",
                width = 80,
                height = 0.4,
                { win = "input", height = 1 },
                { win = "list" }
              },
            },
          },
          win = {
            input = {
              keys = {
                ["<Esc>"] = { "close", mode = { "i", "n" } },
              },
            },
          },
        },
        styles = {
          input = {
            border = false,
            relative = "cursor",
            row = -1,
            noautocmd = false,
          }
        }
      }
    },
    {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {
        check_ts = true
      }
    },
    {
      'windwp/nvim-ts-autotag',
      event = "InsertEnter",
      opts = {}
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
            {
              name = "lazydev",
              group_index = 0
            }
          }, {
            { name = 'path' },
            { name = 'buffer' },
            { name = 'crates' },
          }),
          mapping = {
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-k>'] = cmp.mapping.scroll_docs(-1),
            ['<C-j>'] = cmp.mapping.scroll_docs(1),
            ['<C-e>'] = cmp.mapping.close(),
            ["<Tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
              elseif has_words_before() then
                cmp.complete()
              else
                fallback() -- The fallback function sends an already mapped key. In this case, it's probably `<Tab>`.
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
      keys = {
        { "<leader>sl", '<cmd>TSJToggle<cr>', desc = "Split line" },
      },
      opts = {
        use_default_keymaps = false,
        max_join_length = 1200
      }
    },
    {
      'benmills/vimux',
      keys = {
        { "<leader>vl", '<cmd>VimuxRunCommand "!!"<cr>', desc = "Run last command in pane" },
      },
    },
    'sk1418/Join',
    {
      'Saecki/crates.nvim',
      version = "*",
      opts = {
        text = {
          loading = "  Loading...",
          version = "  %s",
          prerelease = "  %s",
          yanked = "  %s yanked",
          nomatch = "  Not found",
          upgrade = "  %s",
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
            lib_rs_label = "lib.rs         ",
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
        completion = {
          text = {
            prerelease = " pre-release ",
            yanked = " yanked ",
          },
        },
        lsp = {
          enabled = true,
          actions = true,
          completion = true,
          hover = true,
        },
      }
    },
    'nvim-lua/plenary.nvim',
    {
      'NeogitOrg/neogit',
      keys = {
        { "<leader>gn", '<cmd>Neogit<cr>', desc = "Neogit hub" },
      },
      opts = {
        disable_signs = true,
        use_telescope = true,
        integrations = {
          diffview = true
        }
      }
    },
    'sindrets/diffview.nvim',
    {
      'nvim-telescope/telescope.nvim',
      version = "*",
      dependencies = {
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          build = 'make'
        }
      },
      opts = function()
        local tlscp = require('telescope')
        tlscp.load_extension('fzf')
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope live grep' })
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
              fuzzy = true,                   -- false will only do exact matching
              override_generic_sorter = true, -- override the generic sorter
              override_file_sorter = true,    -- override the file sorter
            }
          },
        }
      end
    },
    {
      'kevinhwang91/nvim-bqf',
      event = "VeryLazy",
      opts = {}
    },
    {
      'nvim-treesitter/nvim-treesitter',
      version = '*',
      dependencies = {
        {
          'nvim-treesitter/nvim-treesitter-textobjects',
        }
      },
      build = ":TSUpdate",
      opts = function()
        local configs = require 'nvim-treesitter.configs'
        ---@diagnostic disable-next-line: missing-fields
        configs.setup {
          ensure_installed = {
            'hcl', 'terraform', 'lua', 'rust', 'kdl', 'html', 'css', 'sql', 'dockerfile', 'json', 'python', 'swift', 'toml', 'regex'
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
              keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
              },
            },
            move = {
              enable = true,
              set_jumps = true,
              goto_next_start = {
                ["]f"] = "@function.outer",
                ["]c"] = { query = "@class.outer", desc = "Next class start" },
              },
              goto_previous_start = {
                ["[f"] = "@function.outer",
                ["[c"] = "@class.outer",
              },
            },
          },
        }
      end
    },
    {
      'TaDaa/vimade',
      event = "VeryLazy",
      opts = {
        ncmode = "windows",
        enablefocusfading = true
      }
    },
    {
      'nvim-pack/nvim-spectre',
      cmd = 'Spectre',
      opts = {}
    },
    {
      'nullromo/go-up.nvim',
      opts = {
        ignoredFiletypes = { 'startify', 'gitcommit' },
      }
    },
    {
      "ethanholz/nvim-lastplace",
      opts = {}
    }
    ,
    {
      "bullets-vim/bullets.vim",
      event = "VeryLazy"
    }
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

-- Options

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.copyindent = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.keymap.set('n', '<localleader>q', vim.cmd.nohlsearch)

vim.opt.scrolloff = 3

vim.opt.showmatch = true
vim.opt.clipboard = "unnamedplus"

vim.opt.title = true

vim.opt.cmdheight = 0

vim.opt.undofile = true
vim.opt.undodir = "~/.config/nvim/undodir,~/.tmp,~/tmp,/var/tmp,/tmp"

vim.opt.linebreak = true
vim.opt.showbreak = '↪'
vim.opt.breakindent = true
vim.opt.listchars = {
  tab = '| ',
  trail = '⋅',
  extends = '❯',
  precedes = '❮',
  nbsp = '␣',
}
vim.opt.list = true

vim.opt.inccommand = 'split'

vim.opt.spell = true
vim.opt.spelllang = 'en_gb'

-- Mappings

local function toggle_line_start()
  local _, col1 = unpack(vim.api.nvim_win_get_cursor(0))
  vim.cmd.normal({ args = { '^' }, bang = true })
  local _, col2 = unpack(vim.api.nvim_win_get_cursor(0))
  if col1 == col2 then
    vim.cmd.normal({ args = { '0' }, bang = true })
  end
end
vim.keymap.set('n', '0', toggle_line_start,
  { silent = true, desc = 'Either go to first non-whitespace character or beginning of line' })
vim.keymap.set('v', '0', toggle_line_start,
  { silent = true, desc = 'Either go to first non-whitespace character or beginning of line' })

local function win_move(key)
  local cur = vim.fn.winnr()
  vim.cmd.wincmd(key)
  if cur == vim.fn.winnr() then
    if key == 'j' or key == 'k' then
      vim.cmd.wincmd('s')
    else
      vim.cmd.wincmd('v')
    end
    vim.cmd.wincmd(key)
  end
end
for _, k in ipairs({ 'h', 'j', 'k', 'l' }) do
  vim.keymap.set('n', '<C-' .. k .. '>', function() win_move(k) end,
    { silent = true, desc = 'Move to window ' .. k .. ' (split if needed)' })
end

vim.keymap.set('n', '<leader>i', function() vim.opt.cursorline = not vim.o.cursorline end)

vim.keymap.set('n', '<leader>l', vim.cmd.bnext)
vim.keymap.set('n', '<leader>h', vim.cmd.bprev)

vim.keymap.set('n', '<leader>co', vim.cmd.copen)
vim.keymap.set('n', '<leader>cc', vim.cmd.cclose)
vim.keymap.set('n', '<leader>cn', vim.cmd.cnext)
vim.keymap.set('n', '<leader>cp', vim.cmd.cprev)

vim.keymap.set('n', '<leader>w', vim.cmd.update)
vim.keymap.set('n', '<leader>q', vim.cmd.q)

vim.keymap.set('n', '<leader>D', vim.lsp.buf.declaration)
vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>n', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>rf', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>[', function() vim.diagnostic.jump({ count = -1, float = true }) end)
vim.keymap.set('n', '<leader>]', function() vim.diagnostic.jump({ count = 1, float = true }) end)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Filetypes

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.textwidth = 72
    vim.opt_local.colorcolumn = "72"
  end
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.jsonld",
  callback = function()
    vim.opt_local.filetype = "json"
  end
})

-- Lsp options

vim.diagnostic.config({
  severity_sort = true
})
vim.lsp.inlay_hint.enable(true)
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    require("lsp-format").on_attach(client, args.buf)
  end,
})

vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      check = {
        command = "clippy"
      },
    }
  }
})
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('terraformls')
vim.lsp.enable('tflint')
vim.lsp.config('pyright', {
  on_init = function(client)
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
    client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
  end
})
vim.lsp.enable('pyright')
vim.lsp.enable('gopls')
vim.lsp.enable('sourcekit')
vim.lsp.enable('jdtls')
vim.lsp.enable('yamlls')
vim.lsp.enable('dockerls')
vim.lsp.enable('dartls')
vim.lsp.enable('sourcekit')
vim.lsp.enable('taplo')
vim.lsp.enable('tailwindcss')
vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('harper_ls')
vim.lsp.enable('typos_lsp')
