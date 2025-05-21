return {
  {
    'Civitasv/cmake-tools.nvim',
    ft = { 'c', 'cpp', 'cmake' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('cmake-tools').setup {
        cmake_command = 'cmake',
        ctest_command = 'ctest',
        cmake_build_directory = 'build',
        cmake_generate_options = {},
        cmake_build_options = {},
        cmake_soft_link_compile_commands = true, -- links compile_commands.json
        cmake_compile_commands_from_lsp = false,
        cmake_kits_path = nil,
        cmake_variants_message = {
          short = { show = true },
          long = { show = true, max_length = 40 }
        },
        cmake_dap_configuration = { -- dap configuration
          name = 'cpp',
          type = 'codelldb',
          request = 'launch',
        },
      }
      -- Keymaps for common CMake actions
      vim.keymap.set('n', '<leader>cg', "<cmd>CMakeGenerate<CR>", { desc = 'CMake: Generate (configure)' })
      vim.keymap.set('n', '<leader>cb', "<cmd>CMakeBuild<CR>", { desc = 'CMake: Build' })
      vim.keymap.set('n', '<leader>cc', "<cmd>CMakeClean<CR>", { desc = 'CMake: Clean' })
      vim.keymap.set('n', '<leader>ct', "<cmd>CMakeTest<CR>", { desc = 'CMake: Test' })
      vim.keymap.set('n', '<leader>cx', "<cmd>CMakeRun<CR>", { desc = 'CMake: Run target' })
      vim.keymap.set('n', '<leader>cs', "<cmd>CMakeSelectBuildType<CR>", { desc = 'CMake: Select Build Type' })
    end,
  },
}
