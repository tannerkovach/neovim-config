-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    require('nvim-autopairs').setup {}
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    local Rule = require 'nvim-autopairs.rule'
    local npairs = require 'nvim-autopairs'
    local cond = require 'nvim-autopairs.conds'

    -- Add rule for Liquid template tags
    npairs.add_rules {
      Rule('{%', '%', 'liquid')
        -- only add the pair if the next character is not a percentage sign or a closing brace
        :with_pair(cond.not_after_regex '%%|}')
        -- only add the pair if the previous character is not a curly brace or a percentage sign
        :with_pair(cond.not_before_regex '{|%%')
        -- don't move right when repeat character
        :with_move(cond.none())
        -- don't delete if the next character is a percentage or a closing brace
        :with_del(cond.not_after_regex '%%|}')
        -- disable adding a newline when you press <cr>
        :with_cr(cond.none()),
    }
  end,
}
