return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open parent directory' }),
  opts = {
    float = {
      max_width = 110,
      max_height = 30,
    },
    delete_to_trash = true,
  },
}
