syntax on
set ignorecase
set smartcase
set noswapfile
set nobackup
set encoding=utf-8
set showmatch
set incsearch
set hlsearch
set magic
set autoindent
set tabstop=4 shiftwidth=4
set gdefault
set nojoinspaces
set splitbelow
set splitright
set autowrite
set autoread
set fileformats=unix,mac,dos
set showmode
set showcmd
set nu rnu
set mouse=a
set termguicolors

" Plugins here
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'numToStr/Comment.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/asyncrun.vim'
Plug 'rust-lang/rust.vim'
Plug 'zah/nim.vim'
call plug#end()

" open quickfix window automatically when AsyncRun is executed
" set the quickfix window 8 lines height.
let g:asyncrun_open = 8

" ring the bell to notify you job finished
let g:asyncrun_bell = 1

" F10 to toggle quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" Toggle comments
lua require('Comment').setup()

" Multi cursors
nmap   <C-RightMouse>         <Plug>(VM-Mouse-Cursor)
" nmap   <C-RightMouse>        <Plug>(VM-Mouse-Word)  
" nmap   <M-C-RightMouse>      <Plug>(VM-Mouse-Column)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Theme
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox

command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" Go commands
command! Go !go run .
command! GoFmt !go fmt .
command! GoBuild !go build .
