-- Load plugins
require('plugins')

-- The default tabstop of 8 is pretty intense
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Don't persist search highlights after search
vim.opt.hlsearch = false

-- This seems more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Use relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Don't cause Git churn with correcting newlines
vim.opt.fixendofline = false

-- Highlight the current cursor line
vim.opt.cursorline = true

-- Write swap files & update Git gutters more frequently
vim.opt.updatetime = 250

-- Some plugins don't like fish
vim.opt.shell = 'bash'

-- Set our colour scheme
vim.cmd.colorscheme('jellybeans')

-- Format Rust files on save
vim.g.rustfmt_autosave = 1
vim.g.rustfmt_command = 'rustfmt'
vim.g.rustfmt_fail_silently = 1

-- Nobody wants ex mode
vim.keymap.set('', 'Q', '<Nop>')

-- u is "undo" in normal mode but "lowercase selection" in visual mode
-- This is easy to fat finger so disable it and its uppercase counterpart
vim.keymap.set('x', 'u', '<Nop>')
vim.keymap.set('x', 'U', '<Nop>')

-- Emulate ctrlp with telescope
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files<cr>')

-- Load Mason
require("mason").setup()

-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<C-k>', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<C-j>', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
  expand = function(args)
	vim.fn["vsnip#anonymous"](args.body)
  end,
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = false }),
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' },
}, {
  { name = 'buffer' },
})
})

-- Set up lualine
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'material',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_b = {
      {'branch', icons_enabled = true, icon = 'ᚠ'},
      'diff',
      'diagnostics'
    },
  }
}

-- Set up fidget
require'fidget'.setup{}
