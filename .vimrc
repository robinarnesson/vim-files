" general
syntax on
set nocompatible
set colorcolumn=101
set number
set showmatch
set laststatus=2
set statusline+=%-10.3n\
set scrolloff=10
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
set cursorline
set incsearch
set hidden
set fileformats=unix,dos,mac
set backspace=indent,eol,start

" plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
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
call vundle#end()
filetype plugin indent on

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" airline
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'wombat'
let g:airline_left_sep = 'â–¶'
let g:airline_right_sep = 'â—€'

" ultisnips
let g:UltiSnipsSnippetsDir='~/.vim/nibor-snippets/'
let g:UltiSnipsSnippetDirectories=['nibor-snippets']
let g:UltiSnipsExpandTrigger='<c-e>'
let g:UltiSnipsJumpForwardTrigger='<c-d>'
let g:UltiSnipsJumpBackwardTrigger='<c-c>'
let g:UltiSnipsEditSplit='vertical'

" set colorscheme
try
  colorscheme nibor
catch
endtry

" set gui options
if has('gui_running')
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=L
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endi

" transform /* comment */ to // comment
let @l = '$?\/\*lr/$xxa g_ld$'

" transform /* comment */ to // Comment
let @k = '$?\/\*lr/llvU$xxa g_ld$'

" replace word in block
let @w = '"tyiw[{V%::s/\V\<t\>//gc€kl€kl€kl'

" replace word in file
let @a = '"tyiw:%s/\V\<t\>//gc€kl€kl€kl'

" set leader
let mapleader=','
let gmapleader=','

" various shortcuts
nmap <f2> :set hlsearch!<cr>
nmap <f3> :NERDTreeToggle<cr>
nmap <f4> :TagbarToggle<cr>
nmap <f5> :TagbarOpenAutoClose<cr>/
nmap <f6> :UltiSnipsEdit<cr>
nmap <f7> :Ag! ""<left>
nmap <f8> :setlocal spell!<cr>
nmap <leader>i :e ~/.vimrc<cr>
nmap <leader>u :e ~/.vim/colors/nibor.vim<cr>
nmap <leader>tw :e ~/todo-work.txt<cr>
nmap <leader>tp :e ~/todo-private.txt<cr>
nmap <leader>x :1,100bd<cr>:q<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>d :Bclose<cr>
nmap <leader>v :vsplit<cr>
nmap <leader>s :split<cr>
nmap <leader>. :'.<cr>
nmap <enter> o<esc>
nmap <s-enter> O<esc>
nmap f <leader><leader>s
nmap 0 ^
nmap <leader>l @l
nmap <leader>k @k
nmap gr @w
nmap gR @a

" buffer shortcuts
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

" move between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" move lines using ALT+[jk] or Command+[jk] on mac
nmap <m-j> mz:m+<cr>`z
nmap <m-k> mz:m-2<cr>`z
vmap <m-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <m-k> :m'<-2<cr>`>my`<mzgv`yo`z

" disable arrow keys in normal mode
nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

" fullscreen
map <silent> <f11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<cr>

" return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
