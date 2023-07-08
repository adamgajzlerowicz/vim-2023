local fn = vim.fn local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

require('packer').startup(function()
  use 'mhinz/vim-startify'
  use 'gruvbox-community/gruvbox'
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'junegunn/fzf.vim'
  use 'drmingdrmer/vim-toggle-quickfix'
  use 'airblade/vim-gitgutter'
  use 'editorconfig/editorconfig-vim'
  use 'mhinz/vim-janah'
  use 'ryanoasis/vim-devicons'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use {'fatih/vim-go', run = ':GoUpdateBinaries' }
  use 'jacoborus/tender.vim'
  use 'nvim-telescope/telescope-project.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'joshdick/onedark.vim'
  use 'sheerun/vim-polyglot'
  use 'liuchengxu/vista.vim'
  use 'tpope/vim-commentary'
  use 'sbdchd/neoformat'
  use {'ms-jpq/chadtree', run = 'python3 -m chadtree deps'}
  use 'junegunn/goyo.vim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'sainnhe/everforest'
  use 'folke/trouble.nvim'
  use 'github/copilot.vim'
  use 'williamboman/mason.nvim'
  use 'NLKNguyen/papercolor-theme'
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommended if need floating window support
  use 'neovim/nvim-lspconfig'
  use 'nvim-treesitter/nvim-treesitter'
  use {'axkirillov/easypick.nvim', requires = 'nvim-telescope/telescope.nvim'}
end)

require("rawdikk")

require("mason").setup()

vim.cmd [[
  set encoding=UTF-8
  syntax on
  set ignorecase
  set smartcase
  set hidden
  set number
  set nobackup
  set nospell
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
  set background=light
]]


vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>jj', ':Goyo <cr>', {noremap = true})


require'lspconfig'.gopls.setup{}


require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = { },
    additional_vim_regex_highlighting = false,
  },
}


-- mappings
vim.api.nvim_set_keymap('n', '<space>ff', '<cmd>Telescope live_grep<cr>', {})
vim.api.nvim_set_keymap('n', '<space>ko', '<cmd>Startify<cr>', {})
vim.api.nvim_set_keymap('n', '<Tab><Tab>', '<cmd>Telescope buffers<cr>', {})
vim.api.nvim_set_keymap('n', '<c-p>', '<cmd>Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<space>l', ':wall<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', ':CHADopen --always-focus <cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gs', '<plug>(lsp-workspace-symbol-search)', {})
vim.api.nvim_set_keymap('v', '<space>y', '"+y', {})


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

-- Saving scroll
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


vim.cmd [[
  autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
]]

vim.cmd [[
  augroup AutoReload
  autocmd!
  autocmd BufWritePost ~/.config/nvim/init.lua source %
  augroup END
]]

vim.g.goyo_linenr = 1
vim.g.goyo_width = 150
vim.g.goyo_height = '100%'

vim.cmd('autocmd TermClose * Goyo')

       
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set('n', 'gu', require('telescope.builtin').lsp_references, { })
    vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, { })
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { })
  end,
})

vim.api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<ESC>', '<ESC>:cclose<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<ESC>', ':nohl<cr>', {noremap = true, silent = true})


-- Neoformat

vim.g.neoformat_try_node_exe = 1
vim.g.neoformat_run_all_formatters = 1


vim.cmd([[
  augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
  augroup END
]])

vim.g.neoformat_enabled_typescript = {'eslint_d'}

local chadtree_settings = { ["options.close_on_open"] = true }
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)






-- Go
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

require('go').setup()


