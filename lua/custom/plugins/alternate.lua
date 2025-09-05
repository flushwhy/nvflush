-- alternate.lua
return {
  {
    'rgroli/other.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>o', '<cmd>Other<CR>', desc = '[O]ther file (alternate C/C++ header/source)' },
      { '<leader>os', '<cmd>OtherSplit<CR>', desc = '[O]ther file in [S]plit' },
      { '<leader>ov', '<cmd>OtherVSplit<CR>', desc = '[O]ther file in [V]ertical Split' },
    },
    config = function()
      require('other-nvim').setup {
        -- Define custom paths for your project structure
        paths = {
          { 'private', 'public' },
          { 'src', 'include' },
          { 'source', 'include' },
          { 'src', 'inc' },
          { 'source', 'inc' },
          { 'src', 'headers' },
          { 'source', 'headers' },
          { 'lib', 'include' },
          { 'app', 'include' },
          { 'test', 'include' },
          { 'tests', 'include' },
          { 'test', 'src' }, 
        },
      }
    end,
  },
}
