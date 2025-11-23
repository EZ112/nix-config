return {
  'stevearc/conform.nvim',
  config = function()
    local prettier_ft = {
      'json',
      'jsonc',
      'toml',
      'yaml',
      'css',
      'html',
      'markdown',
    }
    local js_ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    }

    local formatters_by_ft = {}
    for _, ft in ipairs(prettier_ft) do
      formatters_by_ft[ft] = { 'prettierd' }
    end
    for _, ft in ipairs(js_ft) do
      formatters_by_ft[ft] = { 'eslint_d', 'prettierd' }
    end
    formatters_by_ft['lua'] = { 'stylua' }

    require('conform').setup({
      formatters_by_ft = formatters_by_ft,
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },
    })
  end,
}
