return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim', -- Recommended for better diff viewing
    -- 'nvim-telescope/telescope.nvim', -- Optional, for telescope integration
  },
  config = function()
    local neogit = require('neogit')
    neogit.setup({
      -- integrations = { -- Neogit integrates with diffview.nvim by default
      --   diffview = true
      -- },
      -- You can configure Neogit further here if needed
      -- For example, to disable certain signs or change default behaviors
      -- See :help neogit-configuration
    })

    -- Keymap to open Neogit status window
    vim.keymap.set('n', '<leader>gs', neogit.open, { desc = 'Neogit: Open Git status' })
    -- You could add more specific keymaps here if desired, for example:
    -- vim.keymap.set('n', '<leader>gc', function() neogit.open({ 'commit' }) end, { desc = 'Neogit: Commit' })
    -- vim.keymap.set('n', '<leader>gl', function() neogit.open({ 'log' }) end, { desc = 'Neogit: Log' })

    print("Neogit plugin configured!") -- Optional: for confirmation
  end,
}
