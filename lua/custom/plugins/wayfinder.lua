return {
  'error311/wayfinder.nvim',
  opts = {},
  config = function()
    require('wayfinder').setup {}
    vim.keymap.set('n', '<leader>wf', '<Plug>(WayfinderOpen)', { desc = 'Wayfinder' })
  end,
}
