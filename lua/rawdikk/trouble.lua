local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["gp"] = trouble.open_with_trouble },
      n = { ["gp"] = trouble.open_with_trouble },
    },
  },
}
