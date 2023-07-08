require('telescope')
  .setup{
  pickers = {
    find_files = {
      hidden = false
    }
  },
  defaults = { 
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

local actions = require('telescope.actions')require('telescope').setup{ 
  defaults = {
    mappings = {
       i = {
        ['<c-d>'] = require('telescope.actions').delete_buffer,
      },
    },
  },
  pickers = { buffers = { sort_lastused = true } 
} }
