-- alternate.lua
return {
  {
    'rgroli/other.nvim',
    ft = { 'c', 'cpp', 'h', 'hpp', 'cc', 'hh', 'cxx', 'hxx' }, -- Ensure loaded for these filetypes
    opts = {
      -- Define custom paths for your project structure
      paths = {
        { "private", "public" }, -- Changed "pub" to "public"
        -- Commonly used paths:
        { "src", "include" },
        { "source", "include" },
        { "src", "inc" },
        { "source", "inc" },
        { "src", "headers" },
        { "source", "headers" },
        { "src", "hdr" },
        { "source", "hdr" },
        { "lib", "include" },
        { "app", "include" },
        { "test", "include" },
        { "tests", "include" },
        { "test", "src" },     -- For tests that might be alongside src but use its headers or vice-versa
      },
    },
    config = function(_, opts)
      require('other-nvim').setup(opts) -- Call setup with options here

      local group = vim.api.nvim_create_augroup('UserAutoOpenAlternate', { clear = true })
      vim.api.nvim_create_autocmd('BufEnter', {
        group = group,
        pattern = { '*.c', '*.cpp', '*.h', '*.hpp', '*.cc', '*.hh', '*.cxx', '*.hxx' }, -- Triggers on C/C++ source or header
        callback = function()
          local success, other_nvim_api = pcall(require, 'other-nvim')
          if not success or not other_nvim_api or not other_nvim_api.getAlternateFile then
            return
          end

          local alternate_file = other_nvim_api.getAlternateFile() -- Finds .h for .cpp, or .cpp for .h

          if alternate_file then
            local is_alternate_already_open = false
            for _, bufinfo in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
              if bufinfo.name == alternate_file then
                is_alternate_already_open = true
                break
              end
            end

            if not is_alternate_already_open then
              other_nvim_api.openAlternateInVerticalSplit()
            end
          end
        end,
      })
    end,
  },
}
