lua << EOF
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
  'ellisonleao/gruvbox.nvim',

  { 'junegunn/goyo.vim', cmd = 'Goyo' },
  { 'junegunn/limelight.vim', cmd = 'Goyo' },
  { 'junegunn/gv.vim', cmd = 'GV' },
  'jiangmiao/auto-pairs',
  { 'tpope/vim-fugitive', cmd = 'Git' },
  'tpope/vim-surround',
  'tpope/vim-sleuth',  -- detect indentation
  'tpope/vim-eunuch',  -- helpers for UNIX
  'tpope/vim-repeat',  -- . for supported plugin maps
  'tpope/vim-vinegar',
  'tpope/vim-apathy',
  'tpope/vim-rhubarb',
  'tpope/vim-commentary',
  'nvim-lualine/lualine.nvim',
  'lewis6991/gitsigns.nvim',
  { 'sjl/gundo.vim', cmd = 'GundoToggle' },  -- undo tree
  'mhinz/vim-startify',  -- pretty starting screen
  { 'rbgrouleff/bclose.vim', cmd = 'Bclose' },  -- :bd but not closing window/pane
  'thirtythreeforty/lessspace.vim',  -- strip trailing whitespaces for edited lines
  'neovim/nvim-lspconfig',
  'ray-x/lsp_signature.nvim',
  'stevearc/dressing.nvim',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/nvim-cmp',
  'simrat39/rust-tools.nvim',
  'j-hui/fidget.nvim',
  'AndrewRadev/splitjoin.vim',
  'AndrewRadev/tagalong.vim',
  'alvan/vim-closetag',
  { 'tweekmonster/startuptime.vim', cmd = 'StartupTime' },
  'benmills/vimux',
  'sk1418/Join',
  'sickill/vim-pasta',
  'nvim-lua/plenary.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'Saecki/crates.nvim',
  'wsdjeg/vim-fetch',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',

  'jvirtanen/vim-hcl',
})
EOF
