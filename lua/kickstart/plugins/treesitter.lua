return {
  -- Highlight, edit, and navigate code using a fast incremental parser
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    -- A list of parser names, or "all"
    ensure_installed = { 'bash', 'c', 'cpp', 'go', 'html', 'lua', 'luadoc', 'markdown', 'python', 'vim', 'vimdoc' },

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}