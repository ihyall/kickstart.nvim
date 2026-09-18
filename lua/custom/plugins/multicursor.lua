return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  config = function()
    local mc = require 'multicursor-nvim'
    mc.setup()

    local set = vim.keymap.set

    -- Add or skip cursor above/below the main cursor.
    set({ 'n', 'x' }, '<C-M-k>', function() mc.lineAddCursor(-1) end, { desc = 'Multicursor: Add cursor above' })
    set({ 'n', 'x' }, '<C-M-up>', function() mc.lineAddCursor(-1) end, { desc = 'Multicursor: Add cursor above' })
    set({ 'n', 'x' }, '<C-M-j>', function() mc.lineAddCursor(1) end, { desc = 'Multicursor: Add cursor below' })
    set({ 'n', 'x' }, '<C-M-down>', function() mc.lineAddCursor(1) end, { desc = 'Multicursor: Add cursor below' })
    set({ 'n', 'x' }, '<leader>ck', function() mc.lineSkipCursor(-1) end, { desc = 'Multicursor: Move current cursor up' })
    set({ 'n', 'x' }, '<leader>c<up>', function() mc.lineSkipCursor(-1) end, { desc = 'Multicursor: Move current cursor up' })
    set({ 'n', 'x' }, '<leader>cj', function() mc.lineSkipCursor(1) end, { desc = 'Multicursor: Move current cursor down' })
    set({ 'n', 'x' }, '<leader>c<down>', function() mc.lineSkipCursor(1) end, { desc = 'Multicursor: Move current cursor down' })

    -- Add or skip adding a new cursor by matching word/selection
    set({ 'n', 'x' }, '<leader>cn', function() mc.matchAddCursor(1) end, { desc = 'Multicursor: Add cursor to next match' })
    set({ 'n', 'x' }, '<leader>cs', function() mc.matchSkipCursor(1) end, { desc = 'Multicursor: Move cursor to next match' })
    set({ 'n', 'x' }, '<leader>cN', function() mc.matchAddCursor(-1) end, { desc = 'Multicursor: Add cursor to previous match' })
    set({ 'n', 'x' }, '<leader>cS', function() mc.matchSkipCursor(-1) end, { desc = 'Multicursor: Move cursor to previous match' })
    set({ 'n', 'x' }, '<leader>cA', mc.matchAllAddCursors, { desc = 'Multicursor: Add cursors to all matches' })

    -- Add and remove cursors with control + left click.
    set('n', '<c-leftmouse>', mc.handleMouse)
    set('n', '<c-leftdrag>', mc.handleMouseDrag)
    set('n', '<c-leftrelease>', mc.handleMouseRelease)

    -- Disable and enable cursors.
    set({ 'n', 'x' }, '<c-q>', mc.toggleCursor, { desc = 'Multicursor: Toggle cursor' })

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ 'n', 'x' }, '<C-M-h>', mc.prevCursor, { desc = 'Multicursor: Make previous cursor main' })
      layerSet({ 'n', 'x' }, '<left>', mc.prevCursor, { desc = 'Multicursor: Make previous cursor main' })
      layerSet({ 'n', 'x' }, '<C-M-l>', mc.nextCursor, { desc = 'Multicursor: Make next cursor main' })
      layerSet({ 'n', 'x' }, '<right>', mc.nextCursor, { desc = 'Multicursor: Make next cursor main' })

      -- Delete the main cursor.
      layerSet({ 'n', 'x' }, '<leader>cx', mc.deleteCursor, { desc = 'Multicursor: Delete main cursor' })

      -- Enable and clear cursors using escape.
      layerSet('n', '<esc>', function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, 'MultiCursorCursor', { reverse = true })
    hl(0, 'MultiCursorVisual', { link = 'Visual' })
    hl(0, 'MultiCursorSign', { link = 'SignColumn' })
    hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
    hl(0, 'MultiCursorDisabledCursor', { reverse = true })
    hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
  end,
}
