return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('dapui').setup()
    require('dap-go').setup()

    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = 'node',
        args = {
          vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js',
          '${port}',
        },
      },
    }

    for _, language in ipairs { 'typescript', 'javascript' } do
      dap.configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch Current File (pwa-node)',
          cwd = '${workspaceFolder}',
          args = { '${file}' },
          sourceMaps = true,
          protocol = 'inspector',
        },
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch Current File (Typescript)',
          cwd = '${workspaceFolder}',
          runtimeArgs = { '--loader=ts-node/esm' },
          program = '${file}',
          runtimeExecutable = 'node',
          sourceMaps = true,
          protocol = 'inspector',
          outFiles = { '${workspaceFolder}/**/**/*', '!**/node_modules/**' },
          skipFiles = { '<node_internals>/**', 'node_modules' },
          resolveSourceMapLocations = {
            '${workspaceFolder}',
            '!**/node_modules/**',
          },
        },
      }
    end

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, { desc = '[T]oggle a breakpoint' })
    vim.keymap.set('n', '<Leader>dc', dap.continue, { desc = '[C]ontinue debugging' })
    vim.keymap.set('n', '<Leader>do', dap.clear_breakpoints, { desc = 'Cl[O]se all breakpoints' })
    vim.keymap.set('n', '<F8>', dap.step_over, { desc = 'Step over' })
    vim.keymap.set('n', '<F9>', dap.step_into, { desc = 'Step into' })
    vim.keymap.set('n', '<F10>', dap.step_out, { desc = 'Step out' })
  end,
}
