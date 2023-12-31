local fn = vim.fn local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

require('packer').startup(function()
  use 'Mofiqul/vscode.nvim'
  use 'wbthomason/packer.nvim'
  use 'mhinz/vim-startify'
  use 'gruvbox-community/gruvbox'
  use 'airblade/vim-gitgutter'
  use 'editorconfig/editorconfig-vim'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'nvim-telescope/telescope-project.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'tpope/vim-commentary'
  use {'ms-jpq/chadtree', run = 'python3 -m chadtree deps'}
  use 'junegunn/goyo.vim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'sainnhe/everforest'
  use 'folke/trouble.nvim'
  use 'github/copilot.vim'
  use 'williamboman/mason.nvim'
  use 'NLKNguyen/papercolor-theme'
  use {'axkirillov/easypick.nvim', requires = 'nvim-telescope/telescope.nvim'}
  use "ibhagwan/fzf-lua"
  use {"neoclide/coc.nvim", run = "yarn install --frozen-lockfile"}
  use 'neoclide/coc-eslint'
  use 'rrethy/vim-illuminate'
  use 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git'
  use {
    'phaazon/hop.nvim',
    branch = 'v2', 
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
end)


require'hop'.setup()

local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    highlight = {
        -- 'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
}


require("mason").setup()

require('fzf-lua').setup {
  buffers = {
    sorter = function (a,b) 
      return a.time > b.time
    end
  }
}

vim.cmd [[
  set encoding=UTF-8
  syntax on
  set ignorecase
  set smartcase
  set hidden
  set number
  set nobackup
  set nospell
  set termguicolors
  set nowritebackup
  set smarttab
  set nocompatible
  set cindent
  set tabstop=2
  set softtabstop=2
  set noswapfile
  set shiftwidth=2
  set expandtab
  set cursorline
  au FocusLost * silent! wa
  set nowrap
  syntax enable
  set autowriteall
  set background=dark
  autocmd CursorHold * silent call CocActionAsync('highlight')
  let g:coc_default_semantic_highlight_groups = 1
]]


vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>jj', ':Goyo <cr>', {noremap = true})



-- mappings
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>Telescope live_grep<cr>', {})
vim.api.nvim_set_keymap('n', '<space>ko', '<cmd>Startify<cr>', {})
vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>FzfLua buffers<cr>', {})
vim.api.nvim_set_keymap('n', '<c-p>', '<cmd>Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', 'gs', '<plug>(lsp-workspace-symbol-search)', {})
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {})
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<space>y', '"+y', {})
vim.api.nvim_set_keymap('n', 'f', '<cmd>HopChar1<cr>', {})


-- autofix eslint
vim.cmd([[ autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx CocCommand eslint.executeAutofix ]])

function eslint_autofix()
  vim.cmd(':wall')
end
vim.api.nvim_set_keymap('n', '<space>l', ':lua eslint_autofix()<CR>', {})


-- global variables
vim.g.airline = {
  extensions = {
    tabline = {enabled = 1},
  }
}

vim.g.go_highlight_structs = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_build_constraints = 1

vim.g.startify_lists = {
  {type = 'sessions', header = {'   Sessions'}},
  {type = 'bookmarks', header = {'   Bookmarks'}},
  {type = 'commands', header = {'   Commands'}},
}

vim.g.startify_bookmarks = {
  {agilix = '~/projects/agilix'},
  {vim_config = '~/.config/nvim/init.lua'},
  {console = '~/projects/cmp-main'},
}

vim.g.startify_session_persistence = 1
vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_enable_special = 0
vim.g.startify_session_dir = '~/.config/nvim/session'

vim.cmd [[
function! Saving_scroll(cmd)
  let save_scroll = &scroll
  execute 'normal! ' . a:cmd
  let &scroll = save_scroll
  endfunction
]]
vim.api.nvim_set_keymap('n', '<C-J>', ':call Saving_scroll("1<C-V><C-D>")<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-J>', '<Esc>:call Saving_scroll("gv1<C-V><C-D>")<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-K>', ':call Saving_scroll("1<C-V><C-U>")<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-K>', '<Esc>:call Saving_scroll("gv1<C-V><C-U>")<CR>', {noremap = true})

-- vim.cmd('colorscheme everforest')
vim.cmd('colorscheme PaperColor')

-- Keymaps for moving between windows
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})



require("toggleterm").setup{
  open_mapping = [[<c-t>]],
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  direction = "float",
  size = function(term)
    if term.direction == "vertical" then
      return vim.o.columns * 0.5
    end
  end,
}

vim.api.nvim_set_keymap('n', '<C-t>', ':wa<CR>:ToggleTerm<CR>', {noremap = true, silent = true})


vim.cmd [[
  autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
]]

vim.cmd [[
  augroup AutoReload
  autocmd!
  autocmd BufWritePost ~/.config/nvim/init.lua silent source %
  augroup END
]]

vim.g.goyo_linenr = 1
vim.g.goyo_width = 150
vim.g.goyo_height = '100%'


vim.api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<ESC>', '<ESC>:cclose<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<ESC>', ':nohl<cr>', {noremap = true, silent = true})



require'lspconfig'.gopls.setup{
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = true
  end,
}


vim.cmd [[
  autocmd BufWritePre *.go :lua vim.lsp.buf_request(0, "textDocument/formatting", { textDocument = { uri = vim.uri_from_bufnr(0) } }, nil)
]]


require("rawdikk")



