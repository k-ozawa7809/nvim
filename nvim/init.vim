"========================================================
" Set on May 21, 2020
" Set vim plugins and various settings to vimrc
"========================================================

"---------------------------
" Initialize
"---------------------------

" line number
set number

" tab space
set autoindent          " Measure indent of previous line at line break
set smartindent         " Increase or decrease the indentation of the next line according to the end of the line entered at the line break 
set cindent             " Start automatic indentation of C program files
set smarttab            " Perform a high degree of automatic indentation when creating a new line
set expandtab           " Replace tab input with multiple spaces

set tabstop=2           " How many spaces to convert tabs to when opening a file containing tabs
set shiftwidth=2        " Number of blank spaces that can be inserted with automatic indentation 
set softtabstop=0       " Number of tabs entered from the keyboard

if has("autocmd")
  " Enable file type search
  filetype plugin on
  " Use indent according to file type
  filetype indent on
  " sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
endif

" Tab visualization
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" search highlight
set hlsearch

" Cursor trouble countermeasure
set guicursor=

"---------------------------
" Start dein Settings.
"---------------------------

if &compatible
  set nocompatible               " Be iMproved
endif

" Plugin install directory
let s:dein_dir = expand('~/.config/nvim/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" XDG base direcory compartible
let g:dein#cache_directory = $HOME . '/.cache/dein'

"If you don't have dein.vim, drop it from github
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" setting
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  
  " TOML file containing the plugin
  let g:toml_dir  = expand('~/.config/nvim/toml')
  let s:toml      = g:toml_dir . '/dein.toml'
  let s:lazy_toml = g:toml_dir . '/dein_lazy.toml'
  let s:py_toml  = g:toml_dir . '/python.toml'
  
  " Read and cache TOML
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#load_toml(s:py_toml,   {'lazy': 1})
  
  call dein#end()
  call dein#save_state()
endif

" Color scheme
call dein#add('flazz/vim-colorschemes')
colorscheme molokai

" Starting new package install
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

"End dein settings-----------------------------

"flake8    
let g:syntastic_python_checkers = ["flake8"]    

"Syntax highlight
syntax on

"Syntastic settings----------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


"Plugin shortcut key map----------------------
" NERDTreeToggle
noremap <silent><S-t>t :NERDTreeToggle<CR>

" VimShell
noremap <silent><S-t>s :VimShell<CR>
noremap <silent><S-t>sp :VimShellPop<CR>

" Airline tab controll
noremap <silent>tw :tabnew<CR>
noremap <silent>tp :tabprevious <CR>
noremap <silent>tn :tabnext<CR>

