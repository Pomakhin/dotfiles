
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

silent! unmap <c-t>

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" They say this prevent VIM from adding newline at end of file
set fileformats+=dos

let g:disable_protodef_sorting=1
let g:session_autosave = 'no'

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
"~ Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-dispatch'
Plugin 'majutsushi/tagbar'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
"Plugin 'Shougo/unite.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'tpope/vim-fugitive'
Plugin 'beyondmarc/glsl.vim'
Plugin 'vim-scripts/Tail-Bundle'
Plugin 'tfnico/vim-gradle'
Plugin 'rhysd/vim-clang-format'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'tommcdo/vim-exchange'
"Plugin 'cvim', {'pinned': 1}
" customized plugins
Plugin 'Pomakhin/cvim'
Plugin 'Pomakhin/vim-protodef-custom'



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
set expandtab

" set font for gvim
" set guifont=Menlo\ Regular:h14

set background=dark

" avoid creation *.~ *.swp files in the current dir
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.
set undodir=~/vimtmp,.

set lcs+=space:.

" session
" let g:session_autosave = 'yes'
" let g:session_autoload = 'yes'

" clang-format settings
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc,mm nnoremap <buffer><Leader>zz :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,mm vnoremap <buffer><Leader>zz :ClangFormat<CR>


" YOU_COMPLETE_ME SETTINGS!!!
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:goldenview__enable_at_startup = 1

" TagBar settings
"let g:tagbar_expand = 1

" EasyGrepo settings
let g:EasyGrepRecursive=1
let g:EasyGrepWindow=1
let g:EasyGrepOpenWindowOnMatch=1
let g:EasyGrepMode=3
let g:EasyGrepDefaultUserPattern="*.cc *.cpp *.h *.mm *.java"
let g:EasyGrepJumpToMatch=0
let g:EasyGrepFilesToExclude=".git,.meta,.un~,.zip,.png,.unity3d,.bin,.fbx,.dll,.info,.meta,.prefab,.tga,.tif,.unity,.wav,.jpg*,.png*,.tar*,.mp3,.so,.swf*,.ipp,.fnt,.plist,.tar*,.xml,.swf*,.git*,.framework*,.dia,.d,.amf*"
let g:EasyGrepCommand=1
let g:EasyGrepReplaceWindowMode=2
let g:EasyGrepSearchCurrentBufferDir=0  
" let g:EasyGrepInvertWholeWord=1
" let g:EasyGrepRoot = "search:.git,.hg,.svn"


" CtrlP settings
silent! unlet g:ctrlp_custom_ignore
let g:ctrlp_by_filename=1
let g:ctrlp_regexp = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10,results:10'
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_tabpage_position = 'ac' 
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|meta|fbx|unity|asset|anim|cs\~|un\~|o|dia|d)$',
    \ }
let g:ctrlp_max_files = 100000
let g:ctrlp_working_path_mode = ''
let g:ctrlp_by_filename = 1

let g:glsl_file_extensions = '*.glsl,*.vsh,*.fsh,*.frag,*.vert'

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

" to prevent git diff with windows-created files
:set nofixendofline

" When I close a tab, remove the buffer
set nohidden
" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'

" vim-session
" let g:session_autosave = 'yes'
" let g:session_autoload = 'yes'
let g:session_autoload = 'no'

"Status line gnarliness
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]\ %b\ %{fugitive#statusline()}

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

  " Apply vimrc change after save
  autocmd bufwritepost .vimrc source $MYVIMRC

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

 augroup hfiles
   au!
   au BufEnter *.h let b:fswitchdst  = 'cc'
   au BufEnter *.h let b:fswitchdst  = 'cpp,cc,C,mm'
   au BufEnter *.h let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/'

   " jau BufEnter *.mm let b:fswitchdst  = 'h'
   " au BufEnter *.mm let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/'
 augroup END
else

  set autoindent		" always set autoindenting on

endif " has("autocmd")



" hotkey for open vimrc
nmap <leader>rc :tabedit ~/dotfiles/.vimrc<CR>

" hotkey for switch betwean *.cpp\*.h
nmap <silent> <Leader>h :FSHere<cr>

" right hand mapping
nmap <leader>; :w<CR>
nmap <leader>. :q<CR>
nmap , a
nmap ,, A
imap <leader>' <Esc>

command! Vb normal! <C-v>
imap <C-V>	<C-r>+
cmap <C-V>	<C-r>+
nnoremap <M-v> <C-V>
nmap <C-V>  "+p
vnoremap <C-C> "+y

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

function! s:LogCur()
    :Glog -- %
    :copen
    :TagbarClose
endfunction
command! LogCur :call s:LogCur()

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
" remove temp logs
function! s:RemoveTempLogs()
    :Grep ^\s*LOG_DEBUG\>.*!!!
    :ResultListDo delete
endfunction
command! RemoveTempLogs :call s:RemoveTempLogs()

function! s:CopyCurrentPath()
    :let @+ = expand('%:p')  
endfunction
command! CopyCurrentPath :call s:CopyCurrentPath()

function! s:CopyCurrentFileName()
    :let @+ = expand('%:t')  
endfunction
command! CopyCurrentFileName :call s:CopyCurrentFileName()

function! s:OpenFileV(path)
    :vnew
    :e a:path
endfunction
command! -nargs=1 OpenFileV call s:OpenFileV (<f-args>)

nnoremap <leader>b :lopen<ENTER>

nnoremap ; :

nnoremap <S-Enter> o<Esc>

" show\hide invisible characters
nmap <leader>l :set list!<CR>

nnoremap <F7> :tabp<ENTER>
nnoremap <F8> :tabn<ENTER>
nnoremap <S-F7> :tabm -1<ENTER>
nnoremap <S-F8> :tabm +1<ENTER>
nnoremap <F2> :YcmCompleter GoTo<ENTER>
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

" GIT
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Git<cr><C-w>20+
nnoremap <leader>gc :Gcommit<cr>

" inserts the current filename without the extension at the cursor position, when you are in insert mode
inoremap <leader>fn <C-R>=expand("%:t:r")<CR>
cnoremap <leader>fn <C-R>=expand("%:t:r")<CR>
" start outlet for cpp and cs files
autocmd BufRead *.h,*.cpp,*.cs TagbarOpen
"autocmd BufEnter * call CallNerdFindIfOk() 
" Start NERDTree
"autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
"autocmd VimEnter * wincmd p
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" CamelCase move
let g:camelchar = "A-Z0-9.,;:{([`'\""
nnoremap <silent><C-Left> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-Left> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-Right> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o


" Log.Temp macro insert file name and method name
let @l = 'oSystemFuncs::LogEventInfo();hi""i\fn "=tagbar#currenttag()€kl''''€kl%s€kr, '''']pa !!! \n$'
let @c = '`>a*/`<i/*'

