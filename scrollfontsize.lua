Fontsize = 12

vim.opt.guifont = 'JetBrainsMono NF:h' .. Fontsize

function SetFontSize(fontsizeArg)
  if vim.g.neoivde then
    local factor = fontsizeArg / 12.0
    vim.g.neovide_scale_factor = factor
  else
    vim.g.guifont = 'JetBrainsMono NF:h' .. fontsizeArg
  end
end

function AdjustFontSize(amount)
  Fontsize = Fontsize + amount
  if Fontsize < 1 then
    Fontsize = 1
  end
  SetFontSize(Fontsize)
end

-- Keymaps
vim.keymap.set('n', 'C-Plus', function()
  AdjustFontSize(1)
end)
vim.keymap.set('n', 'C-kMinus', function()
  AdjustFontSize(-1)
end)
