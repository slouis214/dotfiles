" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=200		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set tabstop=4
set wildmode=longest,list

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

"" My key mapping
" directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" disable-arrowkeys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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

" My Setting
" Gauche
map <Leader>r <Esc>:!gosh -l %:p<CR>
" CLISP
map <Leader>c <Esc>:!clisp -i %<CR>
" lisp mode
set nocindent
set lisp
set showmatch
let lisp_rainbow = 1
" Japanese
:set encoding=utf-8
" colorscheme
" colorscheme evening

"" NeoBundle setting
set nocompatible
filetype plugin indent off

if has('vim_starting')
		set runtimepath+=~/.vim/bundle/neobundle.vim
		call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

"" Neobundle plugins

" Vim plugin for moving faster
NeoBundle 'tpope/vim-unimpaired'

" Vim plugin for rails
NeoBundle 'tpope/vim-rails'

" Vim plugin for Surround
NeoBundle 'tpope/vim-surround'

" Vim plugin for Io Language
NeoBundle 'andreimaxim/vim-io'

" plugin
filetype plugin indent on
