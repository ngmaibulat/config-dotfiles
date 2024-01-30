
call plug#begin('~/.vim/plugged')

Plug 'https://github.com/nvim-telescope/telescope.nvim.git'
Plug 'https://github.com/nvim-telescope/telescope-fzf-native.nvim.git'

call plug#end()


" Telescope Search
nnoremap ,ff <cmd>Telescope find_files<cr>
nnoremap ,fg <cmd>Telescope live_grep<cr>

" Telescope fzf plugin
lua << EOF
require('telescope').load_extension('fzf')
EOF

