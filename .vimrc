" PLUGINS
" set Terminal Colors to 256 colors for vim airline
set t_Co=256

" encoding
set encoding=utf-8

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/youcompleteme'
"Plugin 'klen/python-mode'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'shougo/neocomplete.vim'
"Plugin 'gregsexton/gitv'
"Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'sirver/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

call vundle#end()            " required
filetype plugin indent on    " required

" TERMINAL settings and Misc
set shell=/bin/sh

" filetype indent on

" get a list of completions when typing the beginning of a latex command and
" hit 'tab' (http://stackoverflow.com/questions/3723493/latex-and-vim-usage)
"filetype on
au FileType * exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/".expand('<amatch>'))
set complete+=k
"------------------------------------------------------------
" Must have options {{{1
"
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see
" the mapping of <C-L> below)
set hlsearch

" As you type search
set incsearch

" show tabs and non-breakable spaces
set listchars=tab:>>,nbsp:~ 

" show lines above and below 
set scrolloff=0

" disable showmode since using vim-airline; otherwise use 'set showmode'
set noshowmode

" more history
set history=8192

" save read-only files
"command -nargs=0 Sudow w !sudo tee % >/dev/null
"------------------------------------------------------------
" Usability options {{{1

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled,
" keep the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Enable syntax highlighting
syntax on

" Stop certain movements from always going to the first character of a
" line. While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the
" status line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead
" raise a dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is
" set, and this line is also included, vim will neither flash nor beep. If
" visualbell is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of
" having to "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F9> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F9>

" Set Mapleader key to '<'
let mapleader = '<'

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" quicker window movement
"nnoremap <C-j> <C-w>j
"noremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

" save file
nnoremap <C-s> :w<CR>
"------------------------------------------------------------
" Indentation options {{{1
 
set shiftwidth=4
set softtabstop=4
set expandtab

"------------------------------------------------------------
" Mappings {{{1
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$


" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
"nnoremap <C-L> :nohl<CR><C-L>
"noremap  <Up> :echo "Don't be stupid"
"noremap! <Up> <Esc>
"noremap  <Down> :echo "Don't be stupid"
"noremap! <Down> <Esc>
"noremap  <Left> :echo "Don't be stupid"
"noremap! <Left> <Esc>
"noremap  <Right> :echo "Don't be stupid"
"noremap! <Right> <Esc>
"           

"-------------------------------------------------------------
" PLUGIN Configurations
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor = "latex"

" compile latex files per default to PDF
let g:Tex_DefaultTargetFormat='pdf'

" specify pdf viewer
let g:Tex_ViewRule_pdf = 'evince'

" For compiling also with BibTex or just multiple times
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'

let g:ycm_python_binary_path = 'python'

" airline
" let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'

"youcompleteme
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:UltiSnipsExpandTrigger="<C-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsUsePythonVersion = 2


"---------------------
"" Custom functions
"---------------------
"
fun! TrimWhitespace()
   let l:save = winsaveview()
   %s/\s\+$//e
   call winrestview(l:save)
endfun

