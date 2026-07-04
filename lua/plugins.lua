return {
  -- LSP support
  {
      "mason-org/mason-lspconfig.nvim",
      opts = {
          ensure_installed = {'lua_ls', 'rust_analyzer', 'ts_ls', 'eslint', 'gopls', 'terraformls'}
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
    version = '*'
  },
  -- Fuzzy finding
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('telescope').setup({})
      require('telescope').load_extension('fzf')
    end,
  },
  -- Format with prettier on save, only in projects that use it
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        markdown = { 'prettier' },
      },
      formatters = {
        prettier = { require_cwd = true },
      },
      format_on_save = { timeout_ms = 500 },
    },
  },
  -- Git gutter signs & hunk actions
  { 'lewis6991/gitsigns.nvim', opts = {} },
  -- Highlight trailing whitespace
  {
    'nvim-mini/mini.trailspace',
    opts = {},
    config = function(_, opts)
      require('mini.trailspace').setup(opts)

      -- Alias the vim-better-whitespace command this replaced
      vim.api.nvim_create_user_command('StripWhitespace', function()
        MiniTrailspace.trim()
      end, { desc = 'Trim trailing whitespace' })
    end,
  },
  'nvim-lualine/lualine.nvim',
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        copilot_vim = true,
        fidget = true,
        mason = true,
      },
    },
  },
  'tpope/vim-fugitive',
  'jxnblk/vim-mdx-js',
  -- Copilot ghost text, matching copilot.vim's behaviour
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = { accept = '<Tab>' },
      },
    },
  },
}
