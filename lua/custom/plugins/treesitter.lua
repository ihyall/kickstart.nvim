return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    local filetypes = {
      'bash',
      'zsh',
      'c',
      'diff',
      'markdown',
      'markdown_inline',
      'latex',
      'typst',
      'query',
      'python',
      'go',
      'gomod',
      'gosum',
      'vue',
      'html',
      'css',
      'javascript',
      'vim',
      'vimdoc',
      'lua',
      'luadoc',
      'kitty',
      'yaml',
      'toml',
      'json',
      'dockerfile',
      'gitignore',
      'qmljs',
      'qmldir',
    }
    require('nvim-treesitter').install(filetypes)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function() vim.treesitter.start() end,
    })
  end,
}
