return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    picker = {
      name = 'telescope.nvim',
    },
    workspaces = {
      {
        name = 'personal',
        path = '~/Obsidian-Notes',
      },
    },
    ui = {
      enable = false,
    },
  },
}
