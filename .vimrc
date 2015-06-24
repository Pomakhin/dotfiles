
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2014 Feb 05
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

unmap <c-t>

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'Valloric/YouCompleteMe'
"Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'
Plugin 'majutsushi/tagbar'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
"Plugin 'Shougo/unite.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'dkprice/vim-easygrep'
"Plugin 'zhaocai/GoldenView.Vim'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'vim-fswitch'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

" Put your non-Plugin stuff after this line
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set exrc
set secure

" remove gui elements in gvim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
" tabulation politic
set tabstop=4
set softtabstop=4
set shiftwidth=4

set colorcolumn=110

set background=dark
" YOU_COMPLETE_ME SETTINGS!!!
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" OmniSharp settings
let g:OmniSharp_server_type = 'roslyn'

let g:goldenview__enable_at_startup = 1

" TagBar settings
"let g:tagbar_expand = 1

" EasyGrepo settings
let g:EasyGrepRecursive=1
let g:EasyGrepWindow=1
let g:EasyGrepMode=2
let g:EasyGrepJumpToMatch=0
let g:EasyGrepFilesToExclude=".git,.meta"
let g:EasyGrepCommand=1


" CtrlP settings
unlet g:ctrlp_custom_ignore
unlet g:ctrlp_user_command
let g:ctrlp_by_filename=1
let g:ctrlp_regexp = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10,results:10'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_tabpage_position = 'ac' 
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|meta|fbx|unity|asset|anim|cs\~)$',
    \ }
let g:ctrlp_max_files = 100000



if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number
" Ignoring case is a fun trick
set ignorecase
" And so is Artificial Intellegence!
set smartcase

" When I close a tab, remove the buffer
set nohidden
" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

colorscheme gruvbox 

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
  set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Try to maximize gvim window
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" returns true iff is NERDTree open/active
"function! IsNerdTreeOpen()        
"  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction
"
"" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
"function! CallNerdFindIfOk()
"  if &modifiable && IsNerdTreeOpen() && strlen(expand('%')) > 0 && !&diff
"    NERDTreeFind
"    wincmd p
"  endif
"endfunction

nnoremap <S-Enter> o<Esc>

nnoremap <F7> :tabp<ENTER>
nnoremap <F8> :tabn<ENTER>
nnoremap <F2> :YcmCompleter GoToDefinition<ENTER>
"This unsets the "last search pattern" register by hitting return
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Jump between windows
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

nnoremap <silent> <F6> :TagbarToggle<CR>
nnoremap <silent> <F5> :NERDTreeToggle<CR>

" search selection in visual mode
vnoremap // y/<C-R>"<CR>

" start outlet for cpp and cs files
autocmd BufRead *.h,*.cpp,*.cs TagbarOpen
"autocmd BufEnter * call CallNerdFindIfOk() 
" Start NERDTree
"autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
"autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Omnisharp find symbol
autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap <leader>r :OmniSharpRename<cr>
