return {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      -- Remap Codeium accept to <C-g>
      vim.g.codeium_no_map_tab = true
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    end,
  },
}
