" #######################################################
" ##  filename: vimrc_min.vim                          ##
" ##  path:     ~/src/config/dotfiles/vim/             ##
" ##  symlink:  ~/.vimrc                               ##
" ##  purpose:  minimal settings with no plugins       ##
" ##  date:     05/10/2017                             ##
" ##  repo:     https://github.com/DevOpsEtc/dotfiles  ##
" #######################################################

" http://vim.wikia.com/wiki/Moving_lines_up_or_down
" map key combos to match my atom setup

" minimal sane settings
set ai
set ar
set bs=2
set et
set fo=cqrt
set hi=100
set hid
set is
set ic
set ls=2
set nohlsearch
set nocp
set noeb
set nosol
set nu
set ru
set scs
set shm=aItTs
set si
set sm
set so=3
set sw=2
set tf
set ts=2
set ww=b,s,h,l,<,>,[,]
set vb

" Make it pretty
highlight LineNr ctermfg=darkgrey
highlight CursorLine term=NONE cterm=NONE ctermfg=NONE ctermbg=235

" Netrw Settings
let g:netrw_liststyle = 3                       " force tree layout
let g:netrw_banner = 0                          " hide help banner
let g:netrw_browse_split = 0                    " open file in Netrw split
let g:netrw_list_hide= ".swp$"                  " file filter
let g:netrw_winsize = 50                        " window split 50%

" Key Mappings
let mapleader = "\<Space>"
map ; :
inoremap jj <Esc>
noremap <C-\> <C-w>v<C-w><Right>                " split buffer vertically
noremap <C--> <C-w>s<C-w><Down>                 " split buffer horizontally
nnoremap <C-h> <C-w>h                           "
nnoremap <C-j> <C-w>j                           "
nnoremap <C-k> <C-w>k                           "
nnoremap <C-l> <C-w>l                           "
nnoremap <C-Left> <C-w>h                        "
nnoremap <C-Down> <C-w>j                        "
nnoremap <C-Up> <C-w>k                          "
nnoremap <C-Right> <C-w>l                       "
nnoremap<space>v V                              "
nnoremap<tab>v <c-V>                            "
nnoremap<tab>u <c-r>                            "
nnoremap <leader>w :w<cr>                       " write to buffer
nnoremap <leader>s :wq<cr>                      " write to buffer then quit
cmap w!! w !sudo tee > /dev/null %              " force write; read-only perms
nnoremap <leader>q :q!<cr>                      " force quit; changes unwritten
map <silent> <tab>e :Sexplore<cr>               " open Netrw in upper split
map <silent> <tab>q :q<cr>                      " quit Netrw buffer
map<leader>[ ^                                  "
map<leader>] g_                                 "
nnoremap <cr> G                                 "
nnoremap <bs> gg                                "
