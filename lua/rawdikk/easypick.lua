
local easypick = require("easypick")

local base_branch = "dev"

easypick.setup({
	pickers = {
		-- add your custom pickers here
		-- below you can find some examples of what those can look like
		-- diff current branch with base_branch and show files that changed with respective diffs in preview
		{
			name = "changed_files",
			command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
			previewer = easypick.previewers.branch_diff({base_branch = base_branch})
		},

		-- list files inside current folder with default previewer
		{
			-- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
			name = "ls",
			-- the command to execute, output has to be a list of plain text entries
			command = "ls",
			-- specify your custom previwer, or use one of the easypick.previewers
			previewer = easypick.previewers.default()
		},


		-- list files that have conflicts with diffs in preview
		{
			name = "conflicts",
			command = "git diff --name-only --diff-filter=U --relative",
			previewer = easypick.previewers.file_diff()
		},
	}
})

vim.api.nvim_set_keymap('n', '<space>kk', ':Easypick<cr>', {noremap = true, silent = true})
