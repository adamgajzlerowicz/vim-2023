require'nvim-treesitter.configs'.setup {
 ensure_installed = { 'typescript', 'lua'},
  highlight = {
    enable = false,
    custom_captures = { },
    additional_vim_regex_highlighting = false
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "grn",
      node_decremental = "grm",
      scope_incremental = "grc",
      node_toggle = "grt"
    }
  },
  indent = {
    enable = true
  }
}
