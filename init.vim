:set number
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set mouse=a
:set encoding=UTF-8
:set clipboard+=unnamedplus "copy to clipboard
"set completeopt-=preview " For No Previews

let mapleader = "\<Space>"

" Install plugins
call plug#begin()

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'blueshirts/darcula'
Plug 'akinsho/toggleterm.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'sindrets/diffview.nvim'
Plug 'dyng/ctrlsf.vim'
call plug#end()

:colorscheme darcula
" nertree shortcuts
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" telescope shortcuts
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>

lua << EOF
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
        "node_modules",
				".git",
				"tmp",
				"build"
    },
  }
}
EOF
nmap <leader>ts :TagbarToggle <CR>

let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
"NerdTree
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:NERDTreeIgnore = ['^build$']
autocmd VimEnter * NERDTree

let g:ctrlsf_ignore_dir = ['log', 'node_modules', 'build', '.vscode', 'tmp', '.idea']



"Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


