return {
  'akinsho/toggleterm.nvim',
  version = "*",
  lazy = false, -- Force immediate loading at startup
  config = function()
    local toggleterm = require('toggleterm')

    toggleterm.setup({
      size = 20,
      open_mapping = [[<C-j>]], -- Binds Ctrl + j to open/close the terminal
      hide_numbers = true,      -- Hides line numbers inside the terminal window
      shade_terminals = true,
      shading_factor = 2,       -- Slightly darkens the terminal background color
      direction = 'horizontal', -- Keeps it anchored horizontally at the bottom
      close_on_exit = true,     -- Automatically closes the window when the process exits
      shell = vim.o.shell,      -- Uses your system's default shell
    })

    -- Terminal Window Navigation & Mappings
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      -- Allows pressing Ctrl+j inside terminal mode to close it immediately
      vim.keymap.set('t', '<C-j>', [[<Cmd>ToggleTerm<CR>]], opts)
      
      -- Seamless navigation keys to jump back up to your code pane easily
      vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
      vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
      vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
    end

    -- Dynamically apply mappings when ToggleTerm opens
    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
  end
}

