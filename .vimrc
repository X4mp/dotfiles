" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
" set shellslash
set shell=/bin/sh

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
" let g:Tex_MultipleCompileFormats='pdf,pdf'

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" get a list of completions when typing the beginning of a latex command and
" hit 'tab' (http://stackoverflow.com/questions/3723493/latex-and-vim-usage)
filetype on
au FileType * exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/".expand('<amatch>'))
set complete+=k

" break lines after 80 characters
set tw=80

" PLUGINS:
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'shougo/neocomplete.vim'
Plugin 'gregsexton/gitv'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'tpope/vim-fugitive'

Bundle 'farseer90718/vim-taskwarrior'

call vundle#end()            " required
" filetype plugin indent on    " required
"------------------------------------------------------------


" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
" Enable syntax highlighting
syntax on

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple
" files in the same editor window. Users can use multiple split windows or
" multiple tab pages to edit multiple files, but it is still best to enable an option
" to allow easier switching between files.

" One such option is the 'hidden' option, which allows you to re-use the
" same window and switch from an unsaved buffer without saving it first. Also
" allows you to keep an undo history for multiple files when re-using the same
" window in this way. Note that using persistent undo also lets you undo in
" multiple files even in the same window, but is less efficient and is actually
" designed for keeping undo history after closing Vim entirely. Vim will complain if
" you try to quit without saving, and swap files will keep you safe if your
" computer crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the
" same window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see
" the mapping of <C-L> below)
set incsearch
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

"------------------------------------------------------------
" Usability options {{{1

" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled,
" keep the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

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

" Show a vertical red line at column 80
" set colorcolumn=80

"------------------------------------------------------------
" Indentation options {{{1

" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
set tabstop=4

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
