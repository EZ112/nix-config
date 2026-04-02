return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.config('*', {})
    vim.lsp.config('basedpyright', {
      settings = {
        basedpyright = {
          analysis = {
            autoImportCompletions = true,
            autoSearchPaths = true,
            diagnosticMode = 'openFilesOnly',
            useLibraryCodeForTypes = true,
          },
        },
      },
      on_init = function(client)
        local venv = os.getenv('UV_PROJECT_ENVIRONMENT')
        if venv then
          client.config.settings.python = { pythonPath = venv .. '/bin/python' }
          client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
        end
      end,
    })
    vim.lsp.config('ruff', {
      on_attach = function(client)
        client.server_capabilities.hoverProvider = false
      end,
    })
  end,
}
