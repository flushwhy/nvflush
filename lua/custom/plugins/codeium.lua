return {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    init = function()
      vim.g.codeium_no_map_tab = 1
    end,
    config = function()
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    end,
  },
}
