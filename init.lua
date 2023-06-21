local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

require('packer').startup(function()
  use 'mhinz/vim-startify'
  use 'gruvbox-community/gruvbox'
  use {'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use 'junegunn/fzf.vim'
  use 'tpope/vim-fugitive'
  use 'drmingdrmer/vim-toggle-quickfix'
  use 'airblade/vim-gitgutter'
  use 'editorconfig/editorconfig-vim'
  use 'mhinz/vim-janah'
  use 'dense-analysis/ale'
  use 'preservim/nerdtree'
  use 'prabirshrestha/vim-lsp'
  use 'mattn/vim-lsp-settings'
  use 'prabirshrestha/asyncomplete.vim'
  use 'prabirshrestha/asyncomplete-tscompletejob.vim'
  use 'prabirshrestha/asyncomplete-lsp.vim'
  use 'prabirshrestha/async.vim'
  use 'runoshun/tscompletejob'
  use 'ryanoasis/vim-devicons'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use {'fatih/vim-go', run = ':GoUpdateBinaries' }
  use 'jacoborus/tender.vim'
  use 'doums/darcula'
  use 'nvim-telescope/telescope-project.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'joshdick/onedark.vim'
  use 'sheerun/vim-polyglot'
  use 'liuchengxu/vista.vim'
  use 'tpope/vim-commentary'
  use 'sbdchd/neoformat'
  use 'jodosha/vim-godebug'
  use 'rose-pine/neovim'
  use {'ms-jpq/chadtree', run = 'python3 -m chadtree deps'}
  use 'junegunn/goyo.vim'
end)

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
]]

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', 'gd', ':LspDefinition <cr>', {noremap = true})
vim.api.nvim_set_keymap('n', 'gk', ':LspTypeDefinition <cr>', {noremap = true})
vim.api.nvim_set_keymap('i', '<c-space>', '<Plug>(asyncomplete_force_refresh)', {noremap = true})
vim.api.nvim_set_keymap('n', 'gk', ':LspHover <cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>u', ':LspReferences <cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>jj', ':Goyo <cr>', {noremap = true})


require('telescope')
  .setup{
    pickers = {
      find_files = {
        hidden = true
      }
    },
    defaults = { file_ignore_patterns = {"node_modules", "build"} },
    extensions = {
      project = {} }
  }

require'telescope'.load_extension('project')

local actions = require('telescope.actions')require('telescope').setup{ pickers = { buffers = { sort_lastused = true } } }

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {

    },
    additional_vim_regex_highlighting = false,
  },
}





-- let g:ale_fixers = {
--  \ 'typescript': ['eslint'],
--  \ 'javascript': ['eslint'],
--  \ 'typescriptreact': ['eslint'],
--  \ 'go': ['gofumpt', 'goimports', 'golines'],
--  \ }


-- let g:ale_linters = {
--  \ 'typescript': ['eslint'],
--  \ 'javascript': ['eslint'],
--  \ 'typescriptreact': ['eslint'],
--  \ 'go': ['gofumpt', 'goimports', 'golines', 'golangci-lint'],
--  \ }


vim.g.ale_sign_error = '>>'
vim.g.ale_sign_warning = '--'
vim.g.ale_fix_on_save = 1
vim.g.ale_javascript_eslint_executable = 'eslint_d'
vim.g.ale_javascript_eslint_use_global = 0
vim.g.ale_lint_on_save = 1
vim.g.ale_lint_on_text_changed = 0
vim.g.ale_lint_on_enter = 0
vim.cmd('highlight ALEError ctermbg=none gui=underline guisp=red')

-- set guifont
vim.opt.guifont = "DroidSansMono Nerd Font:h11"

-- mappings
vim.api.nvim_set_keymap('n', 'gf', '<cmd>Telescope find_files<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {})
vim.api.nvim_set_keymap('n', '<space>ko', '<cmd>Startify<cr>', {})
vim.api.nvim_set_keymap('n', '<Tab><Tab>', '<cmd>Telescope buffers<cr>', {})
vim.api.nvim_set_keymap('n', '<c-p>', '<cmd>Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<space>l', ':wall<cr>', {})
vim.api.nvim_set_keymap('n', '<C-n>', ':CHADopen<cr>', {})
vim.api.nvim_set_keymap('n', 'gs', '<plug>(lsp-workspace-symbol-search)', {})

-- global variables
vim.g.airline = {
  extensions = {
    tabline = {enabled = 1},
    ale = {enabled = 1},
  }
}

vim.g.go_highlight_structs = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_build_constraints = 1
vim.g.ale_go_golangci_lint_options = "-c ~/projects/cmp-main/.golangci.yml"
vim.g.ale_go_golangci_lint_package = 1

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

vim.g.neoformat_try_node_exe = 1

vim.api.nvim_exec([[
  autocmd BufWritePre *.js Neoformat
  autocmd BufWritePre *.ts Neoformat
  autocmd BufWritePre *.tsx Neoformat
]], false)

-- Neoformat
vim.g.neoformat_try_node_exe = 1
vim.cmd [[
  autocmd BufWritePre *.js Neoformat
  autocmd BufWritePre *.ts Neoformat
  autocmd BufWritePre *.tsx Neoformat
]]

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

vim.cmd('colorscheme gruvbox')

-- Keymaps for moving between windows
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})

vim.api.nvim_exec([[
  autocmd BufEnter * normal zz
]], false)

require("toggleterm").setup{
  open_mapping = [[<c-t>]],
  start_in_insert = true,
  insert_mappings = true,
  terminal_mappings = true,
  direction = "vertical",
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

