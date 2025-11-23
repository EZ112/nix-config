return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'lua', 'regex', 'bash' },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
    })
  end,
}
