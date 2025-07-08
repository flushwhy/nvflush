return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy', -- Use VeryLazy to defer loading and avoid potential race conditions
  config = function()
    require('gitsigns').setup({
      debug_mode = true, -- Enable for more verbose logging to help diagnose issues
      watch_gitdir = {
        enabled = false,
      },
      -- Current line blame (toggle with <leader>gtb)
      current_line_blame = false, -- Default is false, enable if you want it on by default
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',

      -- Attach keymaps
      on_attach = function(bufnr)
        local gs = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation (these are defaults, kept for clarity or if you wish to change them later)
        map('n', ']h', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Gitsigns: Next Hunk' })

        map('n', '[h', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Gitsigns: Previous Hunk' })

        -- Actions: a more consistent mapping scheme
        -- Use lowercase for hunk/line actions, uppercase for buffer-wide actions
        map('n', '<leader>gh', gs.stage_hunk, { desc = 'Gitsigns: Stage [H]unk' })
        map('v', '<leader>gh', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = 'Gitsigns: Stage Selected Hunks' })
        map('n', '<leader>gH', gs.stage_buffer, { desc = 'Gitsigns: Stage Buffer' })

        map('n', '<leader>gr', gs.reset_hunk, { desc = 'Gitsigns: [R]eset Hunk' })
        map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = 'Gitsigns: Reset Selected Hunks' })
        map('n', '<leader>gR', gs.reset_buffer, { desc = 'Gitsigns: Reset Buffer' })

        map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Gitsigns: [U]ndo Stage Hunk' })
        map('n', '<leader>gp', gs.preview_hunk, { desc = 'Gitsigns: [P]review Hunk' })
        map('n', '<leader>gb', gs.blame_line, { desc = 'Gitsigns: [B]lame Line' })
        map('n', '<leader>gB', gs.toggle_current_line_blame, { desc = 'Gitsigns: Toggle Current Line [B]lame' })
        map('n', '<leader>gd', gs.diffthis, { desc = 'Gitsigns: [D]iff This Hunk' })
        map('n', '<leader>gD', gs.toggle_deleted, { desc = 'Gitsigns: Toggle [D]eleted View' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Gitsigns: Select Inner Hunk' })
        -- The 'ah' text object is the same as 'ih' for gitsigns, so it's commented out to avoid redundancy.
        -- map({ 'o', 'x' }, 'ah', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Gitsigns: Select Around Hunk' })
      end,
    })
  end,
}
