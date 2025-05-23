return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' }, -- Harpoon requires plenary
  config = function()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')

    vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Harpoon: Add current file' })
    vim.keymap.set('n', '<leader>hm', ui.toggle_quick_menu, { desc = 'Harpoon: Toggle quick menu' })

    vim.keymap.set('n', '<leader>h1', function() ui.nav_file(1) end, { desc = 'Harpoon: Navigate to file 1' })
    vim.keymap.set('n', '<leader>h2', function() ui.nav_file(2) end, { desc = 'Harpoon: Navigate to file 2' })
    vim.keymap.set('n', '<leader>h3', function() ui.nav_file(3) end, { desc = 'Harpoon: Navigate to file 3' })
    vim.keymap.set('n', '<leader>h4', function() ui.nav_file(4) end, { desc = 'Harpoon: Navigate to file 4' })

    -- You can also use a more compact way to navigate if you prefer, e.g., using <C-h>, <C-t>, etc.
    -- vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end, { desc = 'Harpoon: Navigate to file 1' })
    -- vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end, { desc = 'Harpoon: Navigate to file 2' })
    -- vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end, { desc = 'Harpoon: Navigate to file 3' })
    -- vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end, { desc = 'Harpoon: Navigate to file 4' })

    print("Harpoon plugin configured!") -- Optional: for confirmation
  end,
}
