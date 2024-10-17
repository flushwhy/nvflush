require 'scrollfontsize'
return {
  {
    'andweeb/presence.nvim',
  },
  {
    'theprimeagen/harpoon',
    config = function()
      require('harpoon').setup()
      require('telescope').load_extension 'harpoon'
    end,
  },
}
