:set number
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set expandtab 
:set softtabstop=2
:set mouse=a
:set encoding=UTF-8
:set clipboard+=unnamedplus "copy to clipboard
let mapleader = "\<Space>"

" Install plugins
call plug#begin()

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'blueshirts/darcula' "Color schema
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'sindrets/diffview.nvim'
Plug 'dyng/ctrlsf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'kyazdani42/nvim-web-devicons' "For file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'vim-test/vim-test'
call plug#end()

:colorscheme darcula
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

"Set comment
nmap <leader>/ gcc
"File safe
nmap <leader>fs :w<CR> :echo "File saved"<CR>

let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:ctrlsf_ignore_dir = ['log', 'node_modules', 'build', '.vscode', 'tmp', '.idea']
" Coc
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

nmap <leader>ts :TagbarToggle <CR>
nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>

" set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
lua << EOF
require'nvim-tree'.setup {}
EOF

"Tests
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
