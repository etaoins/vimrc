return {
  -- LSP support
  {
      "mason-org/mason-lspconfig.nvim",
      opts = {
          ensure_installed = {'lua_ls', 'rust_analyzer', 'ts_ls'}
      },
      dependencies = {
          { "mason-org/mason.nvim", opts = {} },
          "neovim/nvim-lspconfig",
      }
  },
  -- Editing NeoVim config files
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  -- Progress support
  {
    'j-hui/fidget.nvim',
    tag = 'v1.6.1'
  },
  -- Fuzzy finding
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'airblade/vim-gitgutter',
  'nvim-lualine/lualine.nvim',
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  'chr4/nginx.vim',
  'ntpeters/vim-better-whitespace',
  'tpope/vim-fugitive',
  'rust-lang/rust.vim',
  'fatih/vim-go',
  'rhysd/vim-llvm',
  'hashivim/vim-terraform',
  'jparise/vim-graphql',
  'HerringtonDarkholme/yats.vim',
  'jxnblk/vim-mdx-js',
  'github/copilot.vim',
}
