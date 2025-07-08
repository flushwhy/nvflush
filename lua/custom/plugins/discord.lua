return {
  'andweeb/presence.nvim',
  lazy = false,
  config = function()
    require(presence).setup {
      neovim_image_text = 'NeoVim with flushwhy/custom settings',
    }
  end,
}
