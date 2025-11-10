vim.lsp.enable({
  'lua_ls',
  'eslint',
})

local diagnostic = vim.diagnostic
diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = true,
  },
  signs = {
    text = {
      [diagnostic.severity.ERROR] = '󰅚 ',
      [diagnostic.severity.WARN] = '󰀪 ',
      [diagnostic.severity.INFO] = '󰋽 ',
      [diagnostic.severity.HINT] = '󰌶 ',
    },
    numhl = {
      [diagnostic.severity.ERROR] = 'ErrorMsg',
      [diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
})
