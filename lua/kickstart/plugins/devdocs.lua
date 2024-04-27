return {
  'luckasRanarison/nvim-devdocs',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    previewer_cmd = 'glow',
    cmd_args = { '-s', 'dark' },
    float_win = {
      width = 130,
      height = 40,
    },
    wrap = true,
  },
  cmd = {
    'DevdocsFetch',
    'DevdocsInstall',
    'DevdocsUninstall',
    'DevdocsOpen',
    'DevdocsOpenFloat',
    'DevdocsOpenCurrentFloat',
    'DevdocsToggle',
    'DevdocsUpdate',
    'DevdocsUpdateAll',
  },
  keys = {
    { '<leader>mt', '<cmd>DevdocsToggle<cr>', mode = { 'n', 'v' }, desc = ' Toggle Docs' },
    { '<leader>ma', '<cmd>DevdocsOpenFloat<cr>', mode = { 'n', 'v' }, desc = ' Open Docs' },
    { '<leader>mn', '<cmd>DevdocsOpenFloat<cr>', mode = { 'n', 'v' }, desc = ' Open Docs (Current File)' },
    { '<leader>m<leader>a', '<cmd>DevdocsFetch<cr>', mode = { 'n', 'v' }, desc = ' DevdocsFetch' },
    { '<leader>m<leader>i', '<cmd>DevdocsInstall<cr>', mode = { 'n', 'v' }, desc = ' DevdocsInstall' },
    { '<leader>m<leader>n', '<cmd>DevdocsUninstall<cr>', mode = { 'n', 'v' }, desc = ' DevdocsUninstall' },
    { '<leader>m<leader>e', '<cmd>DevdocsUpdateAll<cr>', mode = { 'n', 'v' }, desc = ' DevdocsUpdateAll' },
  },
}
