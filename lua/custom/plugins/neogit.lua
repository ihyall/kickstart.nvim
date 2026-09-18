return {
  'NeogitOrg/neogit',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim', -- required

    -- Only one of these is needed.
    -- 'sindrets/diffview.nvim', -- optional
    'esmuellert/codediff.nvim', -- optional

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
    -- 'ibhagwan/fzf-lua', -- optional
    -- 'nvim-mini/mini.pick', -- optional
    -- 'folke/snacks.nvim', -- optional
  },
  cmd = 'Neogit',
  config = function()
    local neogit = require 'neogit'
    local set = vim.keymap.set

    set({ 'n', 'x' }, '<leader>gg', function() neogit.open { kind = 'floating' } end, { desc = 'Show Neogit UI' })
    set({ 'n', 'x' }, '<leader>gl', function() neogit.open { 'log', branch = 'current', kind = 'floating' } end, { desc = 'Show Neogit log' })

    neogit.setup { graph_style = 'unicode' }
  end,
  -- keys = {
  --   { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Show Neogit UI' },
  -- },
}
