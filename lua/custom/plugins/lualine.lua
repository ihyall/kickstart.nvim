return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- local theme = require('gruvbox-material.lualine').theme 'medium'

    -- some theme customization to your liking, for instance:
    -- local g_colors = require("gruvbox-material.colors")
    -- local colors = g_colors.get(vim.o.background, "medium")
    -- theme.normal["x"] = { fg = colors.bg_statusline1, bg = colors.purple }

    require('lualine').setup {
      options = { theme = 'gruvbox-material' },
    }
  end,
}
