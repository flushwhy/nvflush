return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' }, -- Load on buffer read or new file
  config = function()
    require('gitsigns').setup({
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

        -- Actions (New <leader>g mappings)
        map('n', '<leader>gS', gs.stage_hunk, { desc = 'Gitsigns: Stage Hunk' })
        map('n', '<leader>gR', gs.reset_hunk, { desc = 'Gitsigns: Reset Hunk' })
        map('v', '<leader>gS', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = 'Gitsigns: Stage Selected Hunks' })
        map('v', '<leader>gR', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, { desc = 'Gitsigns: Reset Selected Hunks' })

        map('n', '<leader>gSB', gs.stage_buffer, { desc = 'Gitsigns: Stage Buffer' })
        map('n', '<leader>gU', gs.undo_stage_hunk, { desc = 'Gitsigns: Undo Stage Hunk' })
        map('n', '<leader>gRB', gs.reset_buffer, { desc = 'Gitsigns: Reset Buffer' })
        map('n', '<leader>gP', gs.preview_hunk, { desc = 'Gitsigns: Preview Hunk' })
        map('n', '<leader>gB', gs.blame_line, { desc = 'Gitsigns: Blame Line' })
        map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = 'Gitsigns: Toggle Current Line Blame' })
        map('n', '<leader>gD', gs.diffthis, { desc = 'Gitsigns: Diff This Hunk' })
        map('n', '<leader>gtd', gs.toggle_deleted, { desc = 'Gitsigns: Toggle Deleted View' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Gitsigns: Select Inner Hunk' })
        map({ 'o', 'x' }, 'ah', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Gitsigns: Select Around Hunk (same as inner)' })
      end,
    })
    print("Custom Gitsigns keymaps configured!") -- Optional: for confirmation
  end,
}
