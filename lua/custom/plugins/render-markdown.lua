return {
  'MeanderingProgrammer/render-markdown.nvim',
  -- dependencies = { 'romus204/tree-sitter-manager.nvim', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite (INFO customized after nvim-treesitter was archived)
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  lazy = false,
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    latex = {
      enabled = false, -- Потому что у меня нет конвертеров
      render_modes = false,
      converter = { 'utftex', 'latex2text' },
      highlight = 'RenderMarkdownMath',
      position = 'center',
      top_pad = 0,
      bottom_pad = 0,
    },
  },
}
