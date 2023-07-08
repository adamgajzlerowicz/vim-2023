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

