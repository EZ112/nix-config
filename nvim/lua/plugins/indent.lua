return {
  'nvimdev/indentmini.nvim',
  config = function()
    require('indentmini').setup()
    vim.cmd.highlight('link IndentLine Whitespace')
    vim.cmd.highlight('link IndentLineCurrent Normal')
  end,
}
