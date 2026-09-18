return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'gruvbox-material'
    vim.g.gruvbox_material_enable_italic = false
    vim.g.gruvbox_material_enable_bold = true
    -- vim.g.gruvbox_material_transparent_background = 1
    vim.g.gruvbox_material_float_style = 'blend'

    -- NOTE: If I want, I can change some group colors like that
    -- vim.cmd 'highlight! link LspFloatWinBorder NormalFloat'
    -- vim.cmd 'highlight! link FloatBorder NormalFloat'
    -- vim.cmd 'highlight! link WayfinderNormal Normal'
    -- vim.cmd 'highlight! link WayfinderPreviewTarget TelescopeSelection'
  end,
}
