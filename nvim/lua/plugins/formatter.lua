return {
  'stevearc/conform.nvim',
  config = function()
    local prettier_ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'json',
      'jsonc',
      'toml',
      'yaml',
      'css',
      'html',
      'markdown',
    }
    local formatters_by_ft = {}
    for _, ft in ipairs(prettier_ft) do
      formatters_by_ft[ft] = { 'prettierd' }
    end
    formatters_by_ft['lua'] = { 'stylua' }

    require('conform').setup({
      formatters_by_ft = formatters_by_ft,
    })
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*',
      callback = function(args)
        require('conform').format({ bufnr = args.buf })
      end,
    })
  end,
}
