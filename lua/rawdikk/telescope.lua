require('telescope')
  .setup{
  pickers = {
    buffers = { sort_lastused = true },
    find_files = { hidden = false }
  },
  defaults = { 
    mappings = {
       i = {
        ['<c-d>'] = require('telescope.actions').delete_buffer,
      },
    },
    file_ignore_patterns = {"node_modules", "__generated__"}, 
    layout_config = {
      preview_width = 0.5,
      vertical = {
        preview_height = 0.5,
        prompt_position = 'bottom',
      },
      width = 0.9,
      height = 0.9,
    },
  },
}




vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    -- vim.keymap.set('n', 'gu', require('telescope.builtin').lsp_references, { })
    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, { })
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { })
    vim.keymap.set('n', 'gu', function()
      require('telescope.builtin').lsp_references({
          context = { includeDeclaration = false } -- Do not include declaration in the references
        })
    end, { silent = true })
  end,
})
