return {
  {
    'andweeb/presence.nvim',
    lazy = false,
    config = function()
      require('presence').setup({
        -- General options
        auto_update = true, -- Update activity based on autocmd events (if `false`, map or custom activity
        neovim_image_text = 'NeoVim', -- Text displayed when hovered over the Neovim image
        main_image = 'file', -- Main image display (either 'neovim' or 'file')
      })
    end,
  },
  {
    'theprimeagen/harpoon',
    config = function()
      require('harpoon').setup()
      require('telescope').load_extension('harpoon')
    end,
  },
}

