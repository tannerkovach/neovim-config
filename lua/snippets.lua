local ls = require 'luasnip'
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require('luasnip.extras').lambda
local rep = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
local m = require('luasnip.extras').match
local n = require('luasnip.extras').nonempty
local dl = require('luasnip.extras').dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local types = require 'luasnip.util.types'
local conds = require 'luasnip.extras.conditions'
local conds_expand = require 'luasnip.extras.conditions.expand'

-- If you're reading this file for the first time, best skip to around line 190
-- where the actual snippet-definitions start.

-- Every unspecified option will be set to the default.
ls.setup {
  keep_roots = true,
  link_roots = true,
  link_children = true,

  -- Update more often, :h events for more info.
  update_events = 'TextChanged,TextChangedI',
  -- Snippets aren't automatically removed if their text is deleted.
  -- `delete_check_events` determines on which events (:h events) a check for
  -- deleted snippets is performed.
  -- This can be especially useful when `history` is enabled.
  delete_check_events = 'TextChanged',
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { 'choiceNode', 'Comment' } },
      },
    },
  },
  -- treesitter-hl has 100, use something higher (default is 200).
  ext_base_prio = 300,
  -- minimal increase in priority.
  ext_prio_increase = 1,
  enable_autosnippets = true,
  -- mapping for cutting selected text so it's usable as SELECT_DEDENT,
  -- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
  store_selection_keys = '<Tab>',
  -- luasnip uses this function to get the currently active filetype. This
  -- is the (rather uninteresting) default, but it's possible to use
  -- eg. treesitter for getting the current filetype by setting ft_func to
  -- require("luasnip.extras.filetype_functions").from_cursor (requires
  -- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
  -- the current filetype in eg. a markdown-code block or `vim.cmd()`.
  ft_func = function()
    return vim.split(vim.bo.filetype, '.', true)
  end,
}

ls.add_snippets('all', {
  s('ternary', {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    i(1, 'cond'),
    t ' ? ',
    i(2, 'then'),
    t ' : ',
    i(3, 'else'),
  }),
})

ls.add_snippets('liquid', {
  s('ife', {
    t '{% if ',
    i(1, 'cond'),
    t { ' %}', '' },
    i(2, 'then'),
    t { '', '{% endif %}' },
  }),

  s('un', {
    t '{% unless ',
    i(1, 'cond'),
    t { ' %}', '' },
    i(2, 'then'),
    t { '', '{% endunless %}' },
  }),

  s('if', {
    t '{% if ',
    i(1, 'cond'),
    t { ' %}' },
  }),

  s('el', {
    t '{% else %}',
  }),

  s('els', {
    t '{% elsif ',
    i(1, 'cond'),
    t ' %}',
  }),

  s('rend', {
    t "{% render '",
    i(1, 'file'),
    t "' ",
    i(2, 'attr'),
    t ' %}',
  }),

  s('end', {
    t '{% endif %}',
  }),
})
