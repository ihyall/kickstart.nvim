return {
  'OXY2DEV/markview.nvim',
  lazy = false,

  --- Configuration options for `markview.nvim`.
  ---@class markview.config
  ---
  ---@field experimental? markview.config.experimental
  ---@field html? markview.config.html
  ---@field latex? markview.config.latex
  ---@field markdown_inline? markview.config.markdown_inline
  ---@field preview? markview.config.preview
  ---@field renderers? table<string, function>
  ---@field typst? markview.config.typst
  ---@field yaml? markview.config.yaml
  ---@field markdown? markview.config.markdown
  opts = {
    -- restore_conceallevel = false,
    -- callbacks = {
    --   on_enable = function(_, win)
    --     vim.wo[win].conceallevel = 2
    --     -- vim.wo[win].concealcursor = 'nc'
    --   end,
    -- },
    latex = {
      enable = true,
      inline = {
        enable = true,
      },
      blocks = {
        enable = true,
      },
    },
    markdown = {
      enable = true,
      code_blocks = {},
      tables = {
        enable = true,
        strict = false,

        block_decorator = true,
        use_virt_lines = true,

        parts = {
          top = { '╭', '─', '╮', '┬' },
          header = { '│', '│', '│' },
          separator = { '├', '─', '┤', '┼' },
          row = { '│', '│', '│' },
          bottom = { '╰', '─', '╯', '┴' },

          overlap = { '┝', '━', '┥', '┿' },

          align_left = '╼',
          align_right = '╾',
          align_center = { '╴', '╶' },
        },

        hl = {
          top = { 'MarkviewTableHeader', 'MarkviewTableHeader', 'MarkviewTableHeader', 'MarkviewTableHeader' },
          header = { 'MarkviewTableHeader', 'MarkviewTableHeader', 'MarkviewTableHeader' },
          separator = { 'MarkviewTableHeader', 'MarkviewTableHeader', 'MarkviewTableHeader', 'MarkviewTableHeader' },
          row = { 'MarkviewTableBorder', 'MarkviewTableBorder', 'MarkviewTableBorder' },
          bottom = { 'MarkviewTableBorder', 'MarkviewTableBorder', 'MarkviewTableBorder', 'MarkviewTableBorder' },

          overlap = { 'MarkviewTableBorder', 'MarkviewTableBorder', 'MarkviewTableBorder', 'MarkviewTableBorder' },

          align_left = 'MarkviewTableAlignLeft',
          align_right = 'MarkviewTableAlignRight',
          align_center = { 'MarkviewTableAlignCenter', 'MarkviewTableAlignCenter' },
        },
      },
    },
    preview = {
      enable = true,
      map_gx = true,
      enable_hybrid_mode = true,
      linewise_hybrid_mode = true,
      modes = { 'n', 'no', 'c', 'i' },
      hybrid_modes = { 'i' },
    },
  },
}
