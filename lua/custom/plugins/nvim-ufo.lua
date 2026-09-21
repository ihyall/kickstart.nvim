return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  lazy = false,
  config = function()
    vim.o.foldcolumn = 'auto:4' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.foldminlines = 3
    local hover_definition_with_border = function()
      vim.lsp.buf.hover {
        border = 'rounded',
        max_height = 25,
        max_width = 120,
      }
    end

    -- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    -- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    vim.keymap.set('n', 'K', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then hover_definition_with_border() end
    end)

    -- INFO: IDK why it was written in "minimal configuration"
    -- maybe other plugins setup are doing the job done
    --
    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    -- capabilities.textDocument.foldingRange = {
    --   dynamicRegistration = false,
    --   lineFoldingOnly = true,
    -- }
    -- local language_servers = vim.lsp.get_clients()
    -- for _, ls in ipairs(language_servers) do
    --   require('lspconfig')[ls].setup {
    --     capabilities = capabilities,
    --   }
    -- end

    require('ufo').setup {
      preview = {
        max_height = 30,
        winblend = 0,
        mappings = {
          switch = 'K',
        },
      },
    }
  end,
}
