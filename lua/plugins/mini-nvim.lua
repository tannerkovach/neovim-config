return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.pick').setup {}
    require('mini.surround').setup {
      mappings = {
        add = 'tsa', -- Add surrounding in Normal and Visual modes
        delete = 'tsd', -- Delete surrounding
        find = 'tsf', -- Find surrounding (to the right)
        find_left = 'tsF', -- Find surrounding (to the left)
        highlight = 'tsh', -- Highlight surrounding
        replace = 'tsr', -- Replace surrounding
        update_n_lines = 'tsn', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method 
      }
    }
    require('mini.move').setup {}
    -- require('mini.tabline').setup()
    -- require('mini.pairs').setup {
    --   modes = { insert = true, command = false, terminal = false },
    --
    --   -- Global mappings. Each right hand side should be a pair information, a
    --   -- table with at least these fields (see more in |MiniPairs.map|):
    --   -- - <action> - one of 'open', 'close', 'closeopen'.
    --   -- - <pair> - two character string for pair to be used.
    --   -- By default pair is not inserted after `\`, quotes are not recognized by
    --   -- `<CR>`, `'` does not insert pair after a letter.
    --   -- Only parts of tables can be tweaked (others will use these defaults).
    --   mappings = {
    --     ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
    --     ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
    --     ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
    --
    --     [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
    --     [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
    --     ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
    --
    --     ['%'] = { action = 'closeopen', pair = '%%', neigh_pattern = '[^\\].', register = { cr = false } },
    --
    --     ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
    --     ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
    --     ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
    --   },
    -- }

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
