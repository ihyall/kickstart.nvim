-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  require 'custom.plugins.treesitter',
  -- require 'custom.plugins.treesitter-manager',
  require 'custom.plugins.treesitter-context',
  require 'custom.plugins.treesitter-textobjects',

  require 'custom.plugins.multilayout',
  require 'custom.plugins.mini',

  require 'custom.plugins.lualine',
  require 'custom.plugins.transparent',
  require 'custom.plugins.gruvbox-material',

  require 'custom.plugins.render-markdown',
  require 'custom.plugins.render-latex',
  -- require 'custom.plugins.markview',

  require 'custom.plugins.neo-tree',
  require 'custom.plugins.oil',

  require 'custom.plugins.outline',
  require 'custom.plugins.wayfinder',

  require 'custom.plugins.nvim-ufo',
  require 'custom.plugins.multicursor',
  require 'custom.plugins.indent-blankline',
  require 'custom.plugins.which-key',
  require 'custom.plugins.goto-preview',

  require 'custom.plugins.neogit',
  require 'custom.plugins.gitsigns',

  require 'custom.plugins.leetcode',
  require 'custom.plugins.obsidian',
}
