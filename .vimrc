" basic
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
set cursorline
set incsearch
set hidden

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
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

" ultisnips
let g:UltiSnipsSnippetsDir='~/.vim/nibor-snippets/'
let g:UltiSnipsSnippetDirectories=['nibor-snippets']
let g:UltiSnipsExpandTrigger='<c-e>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
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
endif

" set leader
let mapleader=','
let g:mapleader=','

" various shortcuts
nmap <F2> :set hlsearch!<CR>
nmap <F3> :NERDTreeToggle<CR>
nmap <F4> :TagbarToggle<CR>
nmap <F5> :TagbarOpenAutoClose<CR>/
nmap <F6> :UltiSnipsEdit<CR>
nmap <F7> :Ag! ""<Left>
nmap <leader>i :e ~/.vimrc<CR>
nmap <leader>c :e ~/.vim/colors/nibor.vim<CR>
nmap <leader>tw :e ~/todo-work.txt<CR>
nmap <leader>tp :e ~/todo-private.txt<CR>
nmap <leader>x :1,100bd<CR>:q<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>d :Bclose<CR>
nmap <leader>v :vsplit<CR>
nmap <leader>s :split<CR>
nmap <leader>, :'.<CR>
map 0 ^

" buffer shortcuts
nnoremap <leader>b :bp<CR>
nnoremap <leader>f :bn<CR>
nnoremap <leader>1 :1b<CR>
nnoremap <leader>2 :2b<CR>
nnoremap <leader>3 :3b<CR>
nnoremap <leader>4 :4b<CR>
nnoremap <leader>5 :5b<CR>
nnoremap <leader>6 :6b<CR>
nnoremap <leader>7 :7b<CR>
nnoremap <leader>8 :8b<CR>
nnoremap <leader>9 :9b<CR>
nnoremap <leader>0 :10b<CR>

" move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" move lines using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
