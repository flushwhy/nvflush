return {
  'andweeb/presence.nvim',
  lazy = false,
  config = function()
    require('presence').setup {
      -- General options
      auto_update = true,
      neovim_image_text = 'NeoVim with flushwhy/custom settings', -- Text displayed when hovered over the Neovim image
      main_image = 'neovim',
    }
  end,
}
