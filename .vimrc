" General
syntax on
set nocompatible
set colorcolumn=101
set number
set showmatch
set laststatus=2
set statusline+=%-10.3n\
set scrolloff=0
set clipboard=unnamedplus
set autoread
set ruler
set hlsearch
set encoding=utf8
set listchars=tab:>-,trail:~
set list
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set viminfo^=%
set nowrap
set nocursorline
set nocursorcolumn
set incsearch
set hidden
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set noundofile
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Wildmenu
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc
set wildignore+=.git\*,.hg\*,.svn\*

" Plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

" indentLine
let g:indentLine_char = '|'

" neocomplete.vim
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" vim-gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

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
let g:airline_theme='wombat'
let g:airline_left_sep='â–¶'
let g:airline_right_sep='â—€'

" Set colorscheme
try
  colorscheme nibor
catch
endtry

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

" Add curly brackets to one-statement-if
let @t='A {jo€kb}k'

" Remove curly brackets from one-statement-if
let @r='A€kb€kbjjddk'

" Function keys
nmap <f2> :set hlsearch!<cr>
nmap <f3> :NERDTreeToggle<cr>
nmap <f4> :TagbarToggle<cr>
nmap <f5> :TagbarOpenAutoClose<cr>
nmap <f6> :UltiSnipsEdit<cr>
nmap <f7> :Ag! ""<left>
nmap <f8> :setlocal spell!<cr>
nmap <f9> :set shiftwidth=2 tabstop=2<cr>:IndentLinesReset<cr>
nmap <f10> :set shiftwidth=4 tabstop=4<cr>:IndentLinesReset<cr>
map <silent> <f11>
  \ :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<cr>

" Set leader
let mapleader=','
let gmapleader=','

" Leader shortcuts
nmap <leader>i :e ~/.vimrc<cr>
nmap <leader>z :e ~/.vim/colors/nibor.vim<cr>
nmap <leader>tw :e ~/todo-work.txt<cr>
nmap <leader>tp :e ~/todo-private.txt<cr>
nmap <leader>x :1,1000bd<cr>:q<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>d :Bclose<cr>
nmap <leader>v :vsplit<cr>
nmap <leader>s :split<cr>
nmap <leader>. :'.<cr>
nmap <leader>l @l
nmap <leader>k @k
nmap <leader>m @m
nmap <leader>y yiw
nmap <leader>u viwpyiw
nmap <leader>a @t
nmap <leader>r @r

" Various shortcuts
nmap <enter> o<esc>
nmap <s-enter> O<esc>
nmap f <leader><leader>s
nmap 0 ^
nmap gr @w
nmap gR @a
nmap <C-Space> :call CursorPing()<CR>

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

" Disable arrow keys in normal mode
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Show where cursor is
function! CursorPing()
    set cursorline cursorcolumn
    redraw
    sleep 50m
    set nocursorline nocursorcolumn
endfunction
