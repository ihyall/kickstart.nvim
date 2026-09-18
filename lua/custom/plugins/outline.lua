return {
  'hedyhli/outline.nvim',
  config = function()
    vim.keymap.set('n', '\\o', '<cmd>OutlineOpen<CR>', { desc = 'Show Outline' })

    require('outline').setup {
      outline_window = {
        relative_width = true,
        width = 15,
        auto_width = {
          enabled = true,
          max_width = 25,
          include_symbol_details = false,
        },
        show_relative_numbers = true,
      },
      outline_items = {
        show_symbol_details = true,
        show_symbol_lineno = false,
      },
      preview_window = {
        auto_preview = true,
      },
    }
  end,
}
