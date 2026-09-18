return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    'antosha417/nvim-lsp-file-operations',
  },
  lazy = false,
  keys = {
    {
      '\\\\',
      function()
        require('neo-tree.command').execute {
          action = 'focus',
          -- reveal = true,
        }
      end,
      desc = 'NeoTree focus filesystem',
    },
    { '\\f', ':Neotree reveal<CR>', desc = 'NeoTree reveal current file', silent = true },
    {
      '\\g',
      function()
        require('neo-tree.command').execute {
          action = 'focus',
          source = 'git_status',
          reveal = true,
        }
      end,
      desc = 'NeoTree reveal git changes',
    },
    {
      '\\b',
      function()
        require('neo-tree.command').execute {
          action = 'focus',
          source = 'buffers',
          reveal = true,
        }
      end,
      desc = 'NeoTree browse buffers',
    },
    -- {
    --   '\\o',
    --   function()
    --     require('neo-tree.command').execute {
    --       toggle = true,
    --       source = 'document_symbols',
    --       position = 'float',
    --     }
    --   end,
    --   desc = 'NeoTree document symbols toggle',
    --   silent = true,
    -- },
  },
  opts = {
    default_component_configs = {
      indent = {
        with_expanders = true,
      },
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
    filesystem = {
      bind_to_cwd = true,
    },
    sources = {
      'filesystem',
      'buffers',
      'git_status',
      'document_symbols',
    },
    source_selector = {
      winbar = true,
      statusline = false,
      sources = {
        { source = 'filesystem', display_name = ' 󰉓 File ' },
        { source = 'git_status', display_name = ' 󰊢 Git ' },
        { source = 'buffers', display_name = ' 󰓩 Buf ' },
        { source = 'document_symbols', display_name = '  Sym ' },
      },
    },
    tabs_layout = 'equal',
    content_layout = 'center',
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          vim.opt_local.relativenumber = true
          vim.opt_local.numberwidth = 2
          vim.opt_local.signcolumn = 'no'
          vim.opt_local.foldcolumn = '1'
        end,
      },
    },
  },
}
