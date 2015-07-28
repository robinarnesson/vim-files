" General
syntax on
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=~/.vim/backup//
set clipboard=unnamedplus
set colorcolumn=101
set cursorline
set directory=~/.vim/swap//
set encoding=utf8
set expandtab
set fileformats=unix,dos,mac
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=tab:>-,trail:~
set nocompatible
set nocursorcolumn
set noerrorbells
set noundofile
set novisualbell
set nowrap
set number
set ruler
set scrolloff=0
set shiftwidth=2
set showmatch
set smartindent
set smarttab
set statusline+=%-10.3n\
set tabstop=2
set undodir=~/.vim/undo//
set viminfo^=%
set wildignore+=.git\*,.hg\*,.svn\*
set wildignore=*.o,*~,*.pyc
set wildmenu
set wildmode=list:longest,full

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'mjbrownie/swapit'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'bling/vim-airline'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'powerline/powerline'
Plugin 'godlygeek/tabular'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
call vundle#end()
filetype plugin indent on

" vim-easytags
let g:easytags_events=['BufWritePost']
let g:easytags_include_members=1
let g:easytags_by_filetype="~/.vim/vimtags/"
let g:easytags_auto_highlight=0

" indentLine
let g:indentLine_char = '|'

" neocomplete.vim
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" vim-gitgutter
let g:gitgutter_map_keys=0
let g:gitgutter_realtime=0
let g:gitgutter_eager=0
let g:gitgutter_max_signs=2000

" tagbar
let g:tagbar_map_showproto = "<right>"

" nerdtree
let NERDTreeIgnore=['\.o$','\~$']

" tcomment_vim
call tcomment#DefineType('c','// %s')

" ultisnips
let g:UltiSnipsSnippetsDir='~/.vim/nibor-snippets/'
let g:UltiSnipsSnippetDirectories=['nibor-snippets']
let g:UltiSnipsExpandTrigger='<c-e>'
let g:UltiSnipsJumpForwardTrigger='<c-d>'
let g:UltiSnipsJumpBackwardTrigger='<c-c>'
let g:UltiSnipsEditSplit='vertical'

" ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode='w'

" vim-airline
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme = 'wombat'
let g:airline_left_sep=''
let g:airline_right_sep=''

" Set gui options
if has('gui_running')
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=L
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" Set colorscheme
try
  colorscheme phoenix
  PhoenixGreen
catch
endtry

" Transform gt("") to ""
let @m='$?gtxxds)'

" Transform /* comment */ to // comment
let @l='$?\/\*lr/$xxa g_ld$'

" Transform /* comment */ to // Comment
let @k='$?\/\*lr/llvU$xxa g_ld$'

" Replace word in block
let @w='"tyiw[{V%::s/\V\<t\>//gc€kl€kl€kl'

" Replace word in file
let @a='"tyiw:%s/\V\<t\>//gc€kl€kl€kl'

" Add curly brackets to one-statement-block
let @t='A {jo}k'

" Remove curly brackets from one-statement-block
let @r='A€kb€kbjjddk'

" Function keys
nmap <f2> :set hlsearch!<cr>
nmap <f3> :NERDTreeToggle<cr>
map <f4> :Tabularize /
nmap <f5> :TagbarOpenAutoClose<cr>
nmap <f6> :UltiSnipsEdit<cr>
nmap <f7> :Ack ""<left>
nmap <f8> :setlocal spell!<cr>
nmap <f9> :set shiftwidth=2 tabstop=2<cr>:IndentLinesReset<cr>
nmap <f10> :set shiftwidth=4 tabstop=4<cr>:IndentLinesReset<cr>
map <silent> <f11>
  \ :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<cr>

" Set leader
let mapleader=','
let gmapleader=','

" Various leader shortcuts
nmap <leader>i :e ~/.vimrc<cr>
nmap <leader>tw :e ~/remote-files/tw<cr>
nmap <leader>tp :e ~/remote-files/tp<cr>
nmap <leader>x :1,1000bd<cr>:q<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>c :Bclose<cr>
nmap <leader>s :vsplit<cr>
nmap <leader>hs :split<cr>
nmap <leader>. :'.<cr>
nmap <leader>l @l
nmap <leader>k @k
nmap <leader>m @m
nmap <leader>y yiw
nmap <leader>u viwpyiw
nmap <leader>a @t
nmap <leader>r @r
nmap <leader>z :tabnew<cr>
nmap <leader>d <c-]>
nmap <tab> <leader><leader>s
nmap <leader><f1> a<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>
imap <leader><f1> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" Buffer shortcuts
nnoremap <leader>p :bp<cr>
nnoremap <leader>f :bn<cr>
nnoremap <leader>1 :1b<cr>
nnoremap <leader>2 :2b<cr>
nnoremap <leader>3 :3b<cr>
nnoremap <leader>4 :4b<cr>
nnoremap <leader>5 :5b<cr>
nnoremap <leader>6 :6b<cr>
nnoremap <leader>7 :7b<cr>
nnoremap <leader>8 :8b<cr>
nnoremap <leader>9 :9b<cr>
nnoremap <leader>0 :10b<cr>

" Only use reg 0 for paste
nnoremap p "0p
nnoremap P "0P
vnoremap p "0p
vnoremap P "0P

" Various shortcuts
nmap <enter> o<esc>
nmap <s-enter> O<esc>
nmap 0 ^
nmap gr @w
nmap gR @a
nmap <space> :set noignorecase<cr>/
nmap <c-space> :set ignorecase<cr>/
nmap s :TComment<cr>
vmap s :TComment<cr>
imap <c-space> <c-x><c-o>

" Set arrow keys
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
nmap + :vertical resize +1<cr>
nmap - :vertical resize -1<cr>

" Move between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" Move lines using ALT+[jk] or Command+[jk] on mac
nmap <m-j> mz:m+<cr>`z
nmap <m-k> mz:m-2<cr>`z
vmap <m-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <m-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Copy clipboard to reg 0 on focus
autocmd FocusGained * let @0=@+

" Show where cursor is
function! CursorPing()
  set cursorline cursorcolumn
  redraw
  sleep 50m
  set nocursorline nocursorcolumn
endfunction
