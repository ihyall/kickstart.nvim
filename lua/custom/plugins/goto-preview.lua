return {
  'rmagatti/goto-preview',
  lazy = true,
  dependencies = { 'rmagatti/logger.nvim' },
  event = 'BufEnter',
  -- config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
  config = function()
    local preview = require 'goto-preview'
    preview.setup {}
    vim.keymap.set('n', 'gpd', preview.goto_preview_definition, { desc = '[p]review [d]efinition' })
    vim.keymap.set('n', 'gpt', preview.goto_preview_type_definition, { desc = '[p]review [t]ype definition' })
    vim.keymap.set('n', 'gpi', preview.goto_preview_implementation, { desc = '[p]review [i]mplementation' })
    vim.keymap.set('n', 'gpD', preview.goto_preview_declaration, { desc = '[p]review [D]eclaration' })
    vim.keymap.set('n', 'gP', preview.close_all_win, { desc = 'Close all [P]review windiows' })
    vim.keymap.set('n', 'gpr', preview.goto_preview_references, { desc = '[p]review [r]eferences' })
  end,
}
