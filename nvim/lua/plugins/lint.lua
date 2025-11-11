return {
  'mfussenegger/nvim-lint',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  config = function()
    local lint = require('lint')
    local eslint_ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    }
    local linters_by_ft = {}
    for _, ft in ipairs(eslint_ft) do
      linters_by_ft[ft] = { 'eslint_d' }
    end
    lint.linters_by_ft = linters_by_ft

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'insertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
