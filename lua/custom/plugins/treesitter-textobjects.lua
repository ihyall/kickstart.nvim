return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true

    -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
  end,
  config = function()
    -- put your config here
    require('nvim-treesitter-textobjects').setup {
      select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V', -- linewise
          -- ['@class.outer'] = '<c-v>', -- blockwise
        },
        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true of false
        include_surrounding_whitespace = false,
      },
      move = {
        set_jumps = true,
      },
    }

    -- keymaps
    -- You can use the capture groups defined in `textobjects.scm`
    -- INFO: Selection section
    vim.keymap.set({ 'x', 'o' }, 'am', function() require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'im', function() require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ac', function() require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ic', function() require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects') end)
    -- You can also use captures from other query groups like `locals.scm`
    vim.keymap.set({ 'x', 'o' }, 'as', function() require('nvim-treesitter-textobjects.select').select_textobject('@local.scope', 'locals') end)

    -- INFO: Jumps section
    -- INFO: Functions & methods
    vim.keymap.set(
      { 'n', 'x', 'o' },
      ']m',
      function() require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects') end,
      { desc = 'Jump to next [m]ethod start' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      '[m',
      function() require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects') end,
      { desc = 'Jump to previous [m]ethod start' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      ']M',
      function() require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects') end,
      { desc = 'Jump to next [m]ethod end' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      '[M',
      function() require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects') end,
      { desc = 'Jump to previous [m]ethod end' }
    )

    -- INFO: Classes
    vim.keymap.set(
      { 'n', 'x', 'o' },
      ']c',
      function() require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects') end,
      { desc = 'Jump to next [c]lass start' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      '[c',
      function() require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects') end,
      { desc = 'Jump to previous [c]lass start' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      ']C',
      function() require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects') end,
      { desc = 'Jump to next [c]lass end' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      '[C',
      function() require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects') end,
      { desc = 'Jump to previous [c]lass end' }
    )

    -- INFO: Code blocks (loops + conditional statements)
    vim.keymap.set(
      { 'n', 'x', 'o' },
      ']b',
      function() require('nvim-treesitter-textobjects.move').goto_next_start({ '@conditional.outer', '@loop.outer' }, 'textobjects') end,
      { desc = 'Jump to next [b]lock start' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      ']B',
      function() require('nvim-treesitter-textobjects.move').goto_next_end({ '@conditional.outer', '@loop.outer' }, 'textobjects') end,
      { desc = 'Jump to next [b]lock end' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      '[b',
      function() require('nvim-treesitter-textobjects.move').goto_previous_start({ '@conditional.outer', '@loop.outer' }, 'textobjects') end,
      { desc = 'Jump to previous [b]lock start' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      '[B',
      function() require('nvim-treesitter-textobjects.move').goto_previous_end({ '@conditional.outer', '@loop.outer' }, 'textobjects') end,
      { desc = 'Jump to previous [b]lock end' }
    )

    -- INFO: Loops
    vim.keymap.set(
      { 'n', 'x', 'o' },
      ']l',
      function() require('nvim-treesitter-textobjects.move').goto_next_start('@loop.outer', 'textobjects') end,
      { desc = 'Jump to next [l]oop start' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      '[l',
      function() require('nvim-treesitter-textobjects.move').goto_previous_start('@loop.outer', 'textobjects') end,
      { desc = 'Jump to previous [l]oop start' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      ']L',
      function() require('nvim-treesitter-textobjects.move').goto_next_end('@loop.outer', 'textobjects') end,
      { desc = 'Jump to next [l]oop end' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      '[L',
      function() require('nvim-treesitter-textobjects.move').goto_previous_end('@loop.outer', 'textobjects') end,
      { desc = 'Jump to previous [l]oop end' }
    )

    vim.keymap.set(
      { 'n', 'x', 'o' },
      ']i',
      function() require('nvim-treesitter-textobjects.move').goto_next_start('@conditional.outer', 'textobjects') end,
      { desc = 'Jump to next [i]f statement start' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      '[i',
      function() require('nvim-treesitter-textobjects.move').goto_previous_start('@conditional.outer', 'textobjects') end,
      { desc = 'Jump to previous [i]f statement start' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      ']I',
      function() require('nvim-treesitter-textobjects.move').goto_next_end('@conditional.outer', 'textobjects') end,
      { desc = 'Jump to next [i]f statement end' }
    )
    vim.keymap.set(
      { 'n', 'x', 'o' },
      '[I',
      function() require('nvim-treesitter-textobjects.move').goto_previous_end('@conditional.outer', 'textobjects') end,
      { desc = 'Jump to previous [i]f statement end' }
    )

    -- INFO: Allow repeating jumps via ; and ,
    -- vim way: ; and , goes to the direction you were moving.
    local ts_repeat_move = require 'nvim-treesitter-textobjects.repeatable_move'
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}
