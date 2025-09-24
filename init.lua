-- Load lazy.nvim
require("config.lazy")

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
vim.cmd.colorscheme('catppuccin-mocha')

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

-- Steal these bindings from vscodevim
vim.keymap.set('n', '<C-k>', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<C-j>', vim.diagnostic.goto_next)

-- Emulate ctrlp with telescope
vim.keymap.set('n', '<c-p>', '<cmd>Telescope find_files<cr>')

-- Enable LSP autocompletion
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
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
