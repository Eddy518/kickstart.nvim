return {
  -- amongst your other plugins
  -- { 'akinsho/toggleterm.nvim', version = '*', config = true },
  -- or
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      --[[ things you want to change go here]]
      open_mapping = [[<c-\>]],
      direction = 'float',
      float_opts = {
        height = 40,
        width = 160,
      },
    },
  },
}
