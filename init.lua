vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'

vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.hlsearch = true

vim.g.neovide_scale_factor = 1.0

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>k', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', ',', '@@')
vim.keymap.set('n', 'R', '<C-r>')

vim.keymap.set('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-S-Left>', 'z5h')
vim.keymap.set('n', '<C-S-Right>', 'z5l')

vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
vim.keymap.set('n', '<leader>sz', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
vim.keymap.set('n', '<leader>sq', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window

vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab

vim.keymap.set('n', 'SS', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'YY', ':%y<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'VV', 'ggVG', { noremap = true, silent = true })
vim.keymap.set('n', 'DD', 'ggVGd', { noremap = true, silent = true })

-- vim.keymap.set({ 'x', 'v', 'n' }, 'S', '', { desc = 'Remove default S functionality' }) -- split window vertically

vim.keymap.set({ 'x', 'v' }, 'p', '"_dP', { noremap = true, silent = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup 'plugins'

-- require("modus-themes").setup({
-- 	on_colors = function(colors)
-- 		colors.error = colors.red_faint -- Change error color to the "faint" variant
--     colors.bg_added = colors.none
--     colors.fg_added = colors.green
--     colors.bg_changed = colors.none
--     colors.fg_changed = colors.tinted_bg_changed_fringe
--     colors.bg_removed = colors.none
--     colors.fg_removed = colors.tinted_bg_removed_fringe
--     -- colors.fg_dim = '#343538'
--     -- colors.comment = '#343538'
-- 	end,
-- })

-- vim.cmd("colorscheme modus_vivendi")

-- local dracula = require("dracula")
-- dracula.setup({
--   -- customize dracula color palette
--   colors = {
--     bg = "#000000",
--     -- fg = "#F8F8F2",
--     -- selection = "#44475A",
--     -- comment = "#6272A4",
--     -- red = "#FF5555",
--     -- orange = "#FFB86C",
--     -- yellow = "#F1FA8C",
--     -- green = "#50fa7b",
--     -- purple = "#BD93F9",
--     -- cyan = "#8BE9FD",
--     -- pink = "#FF79C6",
--     -- bright_red = "#FF6E6E",
--     -- bright_green = "#69FF94",
--     -- bright_yellow = "#FFFFA5",
--     -- bright_blue = "#D6ACFF",
--     -- bright_magenta = "#FF92DF",
--     -- bright_cyan = "#A4FFFF",
--     -- bright_white = "#FFFFFF",
--     -- menu = "#21222C",
--     -- visual = "#3E4452",
--     -- gutter_fg = "#4B5263",
--     -- nontext = "#3B4048",
--     -- white = "#ABB2BF",
--     -- black = "#191A21",
--   },
--   show_end_of_buffer = true, -- default false
--   transparent_bg = false, -- default false
--   lualine_bg_color = "#44475a", -- default nil
--   italic_comment = true, -- default false
--   overrides = {},
-- })

vim.cmd("colorscheme catppuccin")
--
-- NOTE: How to change treesitter hl groups if I hate the chosen color
-- vim.api.nvim_set_hl(0, '@tag.attribute', {fg='#feacd0',})

local lspconfig = require('lspconfig')
lspconfig.emmet_language_server.setup({
  filetypes = { "liquid", "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
})
