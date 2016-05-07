" ###############################################
" ##  filename: .vimrc                         ##
" ##  path:     ~/                             ##
" ##  purpose:  vim settings                   ##
" ##  date:     10/31/2015                     ##
" ##  repo:     https://github.com/WebAppFlow  ##
" ###############################################

" # vim: set fdm=marker:                      # treat triple braces as folds

" Plugin Managment {{{
set nocompatible                          " !vi compatible; vundle dependency
filetype off                              " vundle dependency
                                          " ↓ vundle path; !inline commenting
set rtp+=~/.vim/bundle/Vundle.vim
                                          " ↓ plugins between vundle#begin/end
call vundle#begin()
                                          " ↓ vundle manages itself
Plugin 'VundleVim/Vundle.vim'
                                          " ↓ jacked up statusbar
Plugin 'bling/vim-airline'
                                          " ↓ color scheme
Plugin 'altercation/vim-colors-solarized'
                                          " ↓ git integration
Plugin 'tpope/vim-fugitive'
                                          " ↓ tab completion
Plugin 'ervandew/supertab'
                                          " ↓ tag navigation
Plugin 'majutsushi/tagbar'
                                          " ↓ easytags dependency
Plugin 'xolox/vim-misc'
                                          " ↓ auto tagging
Plugin 'xolox/vim-easytags'
                                          " ↓ fuzzy finder navigation
Plugin 'kien/ctrlp.vim'
                                          " ↓ delimiter emphasis
Plugin 'kien/rainbow_parentheses.vim'
                                          " ↓ show me where I fat-fingered
Plugin 'scrooloose/syntastic'
                                          " ↓ expand words/phrases/paragraphs
" Plugin 'SirVer/ultisnips'
                                          " ↓ multiple line selection
Plugin 'terryma/vim-multiple-cursors'
                                          " ↓ airline & tmux integration
Plugin 'edkolev/tmuxline.vim'
                                          " ↓ session start screen
Plugin 'mhinz/vim-startify'

call vundle#end()
filetype plugin indent on                 " enable specific filetype formats
" }}}
" Colors {{{
" set t_Co=256                            " enable 256 colors; ipad prompt app
syntax enable                             " enable syntax highlighting
set background=dark                       " set color scheme brightness
colorscheme solarized                     " load color scheme
" }}}
" Main Settings {{{
set autochdir                             " change pwd to active buffer
set autoindent                            " indent newline to match prior line
set autoread                              " sense when file edited externally
set backspace=indent,eol,start            " backspace @breaks/indents/insert
set backup                                " enable backups
set backupdir=~/.vim/tmp/backup/          " path to backup files
set breakindent                           " matched indenting of wrapped lines
set cursorline                            " highlight line having cursor
set directory=~/.vim/tmp/swap/            " path to swap files
set expandtab                             " convert tabs to spaces
" set foldcolumn=1                        " show plus/minus for mouse clicks
set foldenable                            " auto fold code
set foldlevel=10                          " how deep to fold
" set foldlevelstart=10                   " open most folds by default
set foldmethod=indent                     " fold based on indent
set foldnestmax=10                        " how deep to fold
                                          " ↓ auto open closed folders @
set foldopen=insert,jump,mark,search,tag,undo
set formatoptions=cqrt                    " insert comment @newline if prior
set hidden                                " allows leaving unsaved buffer
set history=1000                          " lines of history to remember
set hlsearch                              " highlight searches
set ignorecase                            " ignore case when searching
set incsearch                             " refine search results during typing
set laststatus=2                          " show status line; ctrl+g normal mode
set magic                                 " pattern match special characters
set matchtime=2                           " blink speed @matching delimiter
set modeline                              " last lines in document sets vim mode
set modelines=3                           " number lines checked for modelines
set mouse=a                               " enable mouse for all vim modes
set noerrorbells                          " kill error beeps
set noshowmode                            " hide current mode; showmode = enable
set nostartofline                         " no jump to first character @paging
set number                                " show line numbers
set ruler                                 " show cursor position
set scrolloff=3                           " 3 line cursor travel beforei scroll
                                          " ↓ viminfo save options
set sessionoptions=buffers,curdir,globals,folds,help,tabpages
set shiftwidth=2                          " numbers of spaces to (auto)indent
set shortmess=aItTs                       " abbrev message & kill welcome screen
set showcmd                               " display incomplete commands
set showmatch                             " show matching delimiter with cursor
set showtabline=2                         " always show tab bar
set smartcase                             " lowcase(case-insen)/upcase(case-sen)
set smartindent                           " smarter indenting @newline
set switchbuf=useopen                     " reuse buffer if already open
set t_vb=                                 " error flash setting
set tabstop=2                             " numbers of spaces of tab character
set timeoutlen=1000                       " mapping delays
set ttimeoutlen=10                        " keycode delays
set ttyfast                               " smoother changes
set undodir=~/.vim/tmp/undo/              " path to undo files
set undofile                              " save undo's after file closes
set undolevels=1000                       " max undos
set undoreload=10000                      " max undos line per buffer
set viewoptions=folds,options,cursor      " mkview options
                                          " ↓ auto save @quit
set viminfo='100,<500,!,s100,h,n~/.vim/viminfo
                                          " ↑ viminfo: '100 = marks saved
                                          " ↑ viminfo: <500 = max lines per file
                                          " ↑ viminfo: s100 = 100kb max size
                                          " ↑ viminfo: h = !search highlighting
                                          " ↑ viminfo: n = path to viminfo
set visualbell                            " show error flashes
set whichwrap=b,s,h,l,<,>,[,]             " move cursor freely between lines
set wildmenu                              " enable WiLd menu tab completion
set wildmode=list:longest,full            " longest complets in common; tab x2
set wrap                                  " wrap lines; nowrap to kill wrapping
set writebackup                           " create backup file before write
" }}}
" Plugin Settings {{{
" let g:UltiSnipsUsePythonVersion = 2
" Airline Settings {{{
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1                          " use glyphs
let g:airline_theme = 'solarized'                          " colors
let g:airline_symbols.space = "\ua0"
let spc = g:airline_symbols.space                          " space
                                                           " ↓ filepath
let g:airline_section_c = airline#section#create(['%<%F', spc, 'readonly'])
let g:airline_section_x = ''                               " clear section
                                                           " ↓ file type
let g:airline_section_y = airline#section#create_right(['filetype'])
let g:airline#extensions#tabline#enabled = 1               " enhanced tabline
let g:airline#extensions#tabline#show_tab_type = 1         " show tab type
let g:airline#extensions#tabline#show_buffers = 1          " show buffer in tab
let g:airline#extensions#tabline#formatter = 'default'     " buffer name format
" let g:airline#extensions#tabline#formatter = 'unique_tail' " expand name @dups
                                                           " ↓ hide common paths
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_idx_mode = 1       " buffer # key maps
let g:airline#extensions#tabline#buffer_nr_show = 0        " show buffer #
let g:airline#extensions#tabline#buffer_min_count = 0      " min# buffers
let g:airline#extensions#tabline#buffer_nr_format = '%s: ' " printf formatting
let g:airline#extensions#tabline#fnamemod = ':t'           " filename format
" let g:airline#extensions#tabline#fnamecollapse = 1       " fold parent names
" let g:airline#extensions#tabline#fnametruncate = 0       " truncate filename
                                                           " ↓ tab mode setting
let g:airline#extensions#tabline#show_tabs = 1             " show tab in tab
let g:airline#extensions#tabline#tab_nr_type = 0           " tab numbering
let g:airline#extensions#tabline#show_tab_nr = 1           " show tab #s
let g:airline#extensions#branch#enabled = 1                " integrate fugitive
let g:airline#extensions#syntastic#enabled = 1             " integrate syntastic
let g:airline#extensions#tagbar#enabled = 0                " kill statusline
"  let g:airline#extensions#tagbar#flags = 'f'             " default,f,s,p
let g:airline#extensions#ctrlp#color_template = 'insert'   " norm,vis,replace
let g:airline#extensions#tmuxline#enabled = 1              " integrate tmuxline
let airline#extensions#tmuxline#color_template = 'normal'  " tmux mode colors
" }}}
" Ctrlp Settings {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim        " ctrlp runtime path
" let g:ctrlp_show_hidden = 1                     " show hidden files
" let g:ctrlp_dotfiles = 1
let g:ctrlp_use_caching = 1                     " enable caching; <F5> re-index
let g:ctrlp_cache_dir = '~/.vim/tmp/ctrlp'      " cache location
let g:ctrlp_open_multiple_files = 'i'           " open in hidden buffers
let g:ctrlp_regexp = 1                          " non-fuzzy, <c-b> to cycle
let g:ctrlp_follow_symlinks = 1                 " index symlinks
let g:ctrlp_working_path_mode = 'c'             " starting directory
let g:ctrlp_max_files = 0                       " no limit to index #s
let g:ctrlp_clear_cache_on_exit = 0             " 1 clear cachce; <f5> manually
let g:ctrlp_switch_buffer = 'E'                 " reuse existing buffers
                                                "↓ search window format
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:100'
                                                "↓ enable extentions
let g:ctrlp_extensions = ['tag', 'buffertag', 'undo', 'line']
                                                "↓ faster index via find
let g:ctrlp_user_command = 'find -L %s -type d \( -name "\.*" -o
  \ -name Archive -o -name Desktop -o -name Documents -o -name Downloads -o
  \ -name Dropbox -o -name Library -o -name Mindmaps -o -name Movies -o
  \ -name Music -o -name Notes -o -name Pictures -o -name Public -o
  \ -name Trash -o -name VirtualBox\ VMs
  \ \) -prune -o -type f \(
  \ -name "\.*" -o -iname "*.backup" -o -iname "*.bak" -o -iname "*.bck" -o
  \ -iname "*.bz2" -o -iname "*.doc" -o -iname "*.docx" -o -iname "*.gif" -o
  \ -iname "*.gz" -o -iname "*.gzip" -o -iname "*.ico" -o -iname "*.idraw" -o
  \ -iname "*.jpg" -o -iname "*.key" -o -iname "*.mindnode" -o
  \ -iname "*.numbers" -o -iname "*.odt" -o -iname "*.ots" -o
  \ -iname "*.pages" -o -iname "*.pdf" -o -iname "*.png" -o -iname "*.ppt" -o
  \ -iname "*.pptx" -o -iname "*.psd" -o -iname "*.swo" -o -iname "*.swp" -o
  \ -iname "*.tar" -o -iname "*.tiff" -o -iname "*.webloc" -o -iname "*.url" -o
  \ -iname "*.xls" -o -iname "*.xlsx" -o -iname "*.zip"
  \ \) -prune -o -print'

" }}}
" Netrw Settings {{{
let g:netrw_liststyle = 3                 " tree layout
let g:netrw_banner = 0                    " hide banner
let g:netrw_browse_split = 4              " right pane file display
let g:netrw_winsize = -28                 " left pane size
let g:netrw_preview = 1                   " left pane tree expansion
                                          " file filter
let g:netrw_list_hide= '.swp$,.DS_Store,.Trash'
                                          " sort options
"  let g:netrw_altv=1                     " open files on right
" }}}
" Startify Settings {{{
let g:startify_session_dir = '~/.vim/sessions'             " session path
let g:startify_list_order = [['   Session Picker:'], 'sessions']
let g:startify_session_persistence = 1                     " auto save sessions
let g:startify_session_delete_buffers = 1                  " bd open buffers
                                                           " ↓ start #s at 1
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_custom_header = [
 \ ' __      __   _      _             ___ _                  ',
 \ ' \ \    / /__| |__  /_\  _ __ _ __| __| |_____ __ __ ○°⸰  ',
 \ '  \ \/\/ / -_) ''_ \/ _ \| ''_ \ ''_ \ _|| / _ \ V  V /   ',
 \ '   \_/\_/\___|_.__/_/ \_\ .__/ .__/_| |_\___/\_/\_/       ',
 \ '                        |_|  |_|                          ',
 \ '',
 \ ]
hi StartifyBracket ctermfg=244
hi StartifyFile    ctermfg=64
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=33
hi StartifyNumber  ctermfg=136
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=136
" }}}
" Tagbar Settings {{{
let g:tagbar_map_closeallfolds = '='            " close all folds with  =
let g:tagbar_map_togglefold = '-'               " open/close fold with -
let g:tagbar_autofocus = 1                      " cursor moves to right pane
let g:tagbar_compact = 1                        " tighter line spacing
let g:tagbar_width = 25                         " width of right pane
let g:tagbar_map_togglesort = "s"               " toggle sort between alphabetical & order
let g:tagbar_sort = 0                           " default sort set to order
"  let g:tagbar_iconchars = ['+', '-']          " folding symbols
"  let g:tagbar_autoclose = 1                   " auto close after selection
" }}}
  " Misc Plugins {{{
let g:easytags_file = '~/.vim/tags'
                                                " ↓ syntastic settings
let g:syntastic_ignore_files = ['\.txt$']       " disable syntax in text files
                                                " ↓ default on; off for text
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['c'], 'passive_filetypes': ['text'] }
                                                " ↓ rainbow parentheses settings
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
                                                " ↓ signify settings
let g:signify_vcs_list = [ 'git' ]              " use version control
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '',
      \'c'    : '',
      \'win'  : '#I:#W',
      \'cwin' : '#I:#W#F',
      \'x'    : '',
      \'y'    : '#(~/work/scripts/battery.sh)',
      \'z'    : '⧗ #(date -u +%%H:%%M) UTC │ #(date +"%H:%M %Z")'}
  " }}}
" }}}
" Functions {{{
" CommentToggle {{{
fun! CommentToggle()
  execute ':silent! s/\([^ ]\)/' . b:comment_leader . ' \1/'
  execute ':silent! s/^\( *\)' . b:comment_leader . ' \?' . b:comment_leader . ' \?/\1/'
  echo
endfun
" }}}
" FoldText {{{
" http://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! FoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=FoldText()
" }}}
" FoldToggle {{{
let g:Fold = 0
function! FoldToggle()
  if ( g:Fold == 0 )
      "  exec "normal! zM"
      call feedkeys("zM")
      let g:Fold = 1
  else
      "  exec "normal! zR"
      call feedkeys("zR")
      let g:Fold = 0
  endif
  echo
endfunction
"}}}
" WhiteSpace {{{
"  strip trailing whitespace & retain cursor position @write
function! <SID>WhiteSpace()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
"}}}
" SessLoad {{{
"  load the saved wip session
"  fun! SessLoad()
  "  was vim called w/out file argument(s)
  "  if argc() == 0
    " does wip session exist
    "  if filereadable(".vim/sessions/wip")
      "  exe 'source ~/.vim/sessions/wip'
    "  else
      "  echo "can't find wip session"
    "  endif
  "  endif
"  endfun
" }}}

"}}}
" Autocommands {{{
augroup config_group
  " clear autocommands
  autocmd!

  " comment formatting per filetype; au = autocmd
  au FileType php,javascript           let b:comment_leader = '//'
  au FileType apache,conf,cfg          let b:comment_leader = '#'
  au FileType dockerfile,fstab         let b:comment_leader = '#'
  au FileType gitconfig,gitcommit      let b:comment_leader = '#'
  au FileType nginx                    let b:comment_leader = '#'
  au FileType python,ruby,sh,sshconfig let b:comment_leader = '#'
  au FileType sshdconfig,yaml          let b:comment_leader = '#'
  au FileType vim                      let b:comment_leader = '"'
  au FileType dosini                   let b:comment_leader = ';'

  " kill line numbering on text files
  au BufNewFile,BufRead *.txt set nonumber

  " kill trailing white space @write if filetype ==
  au FileType apache,conf,cfg,dockerfile,fstab,javascript,nginx,php,python,ruby,sh,
    \sshconfig,sshdconfig,text,vim,yaml au BufWritePre <buffer> :call <SID>WhiteSpace()

  " autosave/autoload present state of folds
  " http://vim.wikia.com/wiki/Make_views_automatic
  au BufWinLeave * if expand("%") != "" | mkview | endif
  au BufWinEnter * if expand("%") != "" | loadview | endif

  " force php filetype on Drupal
  au BufRead,BufNewFile *.module  set filetype=php
  au BufRead,BufNewFile *.install set filetype=php
  au BufRead,BufNewFile *.test    set filetype=php
  au BufRead,BufNewFile *.inc     set filetype=php
  au BufRead,BufNewFile *.profile set filetype=php
  au BufRead,BufNewFile *.view    set filetype=php
  au BufRead,BufNewFile *.conf    set filetype=nginx

  " enable OmniCompletion for PHP
  au FileType php set omnifunc=phpcomplete#CompletePHP

  " autosave/autoload wip session
  " au VimLeavePre * if v:this_session != '' | exec "mks! " . v:this_session | endif
  " au VimEnter * nested call SessLoad()
augroup END
" }}}
" Key Mappings {{{
" alternative mapleader (default "\" still enabled)
map <space> <leader>
" alternative invoke command mode (default ":" still enabled)
map ; :
" alternative exit insert mode (default <esc> still enabled)
inoremap jj <Esc>
" force write via sudo, e.g. :w!!
cmap w!! w !sudo tee > /dev/null %
" invoke CtrlP fuzzy finder
nnoremap <leader>f :CtrlP ~/<cr>
" run vundle plugin installer
nnoremap <tab>pi :PluginInstall<cr>
" run vundle plugin updater
nnoremap <tab>pu :PluginUpdate<cr>
" save current buffers into session
" nnoremap <tab>ss :mks! ~/.vim/sessions/wip<cr>
" load saved session buffers
" nnoremap <tab>sl :source ~/.vim/sessions/wip<cr>
" save current buffers into session; waits for session name
" nnoremap <tab>s :mksession!<space>~/.vim/sessions/
" load saved session buffers; waits for session name
" nnoremap <tab>sl :source<space>~/.vim/sessions/
" invoke Startify start screen
nnoremap <tab>s :Startify<cr>
" load session
nnoremap <tab>Sl :SLoad<cr>
" save current buffers into session
nnoremap <tab>Ss :SSave<cr>
" delete session
nnoremap <tab>Sd :SDelete<cr>
" save & close current session, close listed buffs
nnoremap <tab>w :SClose<cr>
" save & close current session, close listed buffs, open Startify & detach tmux
nnoremap <tab>q :SClose<cr>:! tmux detach<cr>
" quit vim
nnoremap <tab>Q :quit<cr>
" close all the buffers
nnoremap <leader>bq :1,100 bd!<cr>:q<cr>
" cycle through open buffers - left
nnoremap <leader>h :bprevious<cr>
" cycle through open buffers - right
nnoremap <leader>l :bnext<cr>
" jump straight to open buffer
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" force cursor column alignment when moving over wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" new unnammed buffer
nnoremap <leader>e :enew<cr>
" new buffer; wait for name
nnoremap <leader>E :e<space>
" write buffer
nnoremap <leader>w :w<cr>
" quit buffer
nnoremap <leader>q :bd<cr>
" force quit buffer w/out write
nnoremap <tab>! :bd!<cr>
" list and choose register text
nnoremap <tab>r :registers<cr>: echo "Choose register to put..."<cr>:put<space>
" list and choose set marks
nnoremap <tab>m :marks<cr>: echo "Choose mark to jump..."<cr>:'
" list and choose open buffers
nnoremap <tab>b :buffers<cr>:echo "Choose buffer # to load..."<cr>:buffer<space>
" redisplay messages from current vim session
nnoremap <tab>? :messages<cr>
" clear out search highlighting
nnoremap <silent>, :nohlsearch<cr>
" toggle Tagbar
nnoremap <space>t :TagbarToggle<cr>
" toggle background color
nnoremap <silent> <F10> :let &background = ( &background == "dark"? "light" : "dark" ) \| AirlineRefresh<cr>
" toggle netrw explorer
map <silent> <tab>e :Lexplore<cr>
" toggle code commenting
map <leader>c :call CommentToggle()<cr>
" toggle paste/nopaste; resolves indent formatting issues
set pastetoggle=<F2>
" toggle display of line numbering
nnoremap <F3> :set invnumber<cr>
" toggle all folds
nnoremap = :call FoldToggle()<cr>
"  toggle single fold
nnoremap - za
" delete line via black hole register
" nnoremap dd "_dd
" detete selected via black hole register
" noremap d "_d
" delete selected via black hole register
noremap x "_x
" cut line to quoteplus register & system clipboard
nnoremap <leader>dd "+dd
" cut selected to quoteplus register & system clipboard
vnoremap <leader>d "+d
" yank selected to quoteplus register & system clipboard
noremap <leader>y "+y
" put from quoteplus register & system clipboard (behind cursor)
noremap <leader>p "+p
" put from quoteplus register & system clipboard (after cursor)
noremap <leader>P "+P
" invoke visual line mode
nnoremap<space>v V
" invoke visual block mode
nnoremap<tab>v <c-V>
" redo
nnoremap<tab>u <c-r>
" jump to buffer end via <enter>; shorten movement key combo, e.g. 10<cr>
nnoremap <cr> G
" jump to buffer start via <delete>
nnoremap <bs> gg
" go to line start after any whitespace, i.e. _
map<leader>[ ^
" go to line end before any whitespace, i.e. g_
map<leader>] g_
" reload ~/.vimrc; turn off search lighlighting; repaint airline
nnoremap <tab>R  :source $MYVIMRC \| nohl \| AirlineRefresh<cr>
" add vertical window split using same buffer :vsplit
noremap <leader><bar> <C-w>v<C-w><Right>
" add horizontal window split using same buffer :split
noremap <leader>_ <C-w>s<C-w><Down>
" move focus to left split
nnoremap <C-h> <C-w>h
" move focus to bottom split
nnoremap <C-j> <C-w>j
" move focus to top split
nnoremap <C-k> <C-w>k
" move focus to right split
nnoremap <C-l> <C-w>l
" go to next window
" map <tab>w <C-w>w
" close all panes, except current focus :only
" map <tab>o <C-w>o
" close window :close
map <tab>c <C-w>c
" }}}
