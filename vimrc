" ~/.vimrc
"
" Author:   Joe Schuler <josefschuler at gmail dot com>
" Source:   https://github.com/schulerjoe/vim
"
" Sections:
"           -> Plugin Manager
"           -> General
"           -> VIM user interface
"           -> Colors and Fonts
"           -> Backup and undo
"           -> Text, tab and indent related
"           -> Filetype settings
"           -> Moving around, tabs and buffers
"           -> Status line
"           -> Mappings
"           -> Spell checking
"           -> Plugin related

""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Manager
""""""""""""""""""""""""""""""""""""""""""""""""
" Required by Vundle plugin manager
set nocompatible              " be iMproved
filetype off                  " required to be off by Vundle

" set the runtime path to include Vundle
set rtp+=~/.vim/bundle/vundle

" initialize Vundle
call vundle#begin()

" let Vundle manage Vundle
Plugin 'git@github.com:gmarik/Vundle.vim.git', {'name': 'vundle'}

Plugin 'git@github.com:scrooloose/syntastic.git', {'name': 'syntax_syntastic'}
Plugin 'git@github.com:vim-scripts/nginx.vim.git', {'name': 'syntax_nginx'}
Plugin 'git@github.com:pprovost/vim-ps1.git', {'name': 'syntax_powershell'}

Plugin 'git@github.com:vim-airline/vim-airline.git', {'name': 'statusline_airline'}
Plugin 'git@github.com:vim-airline/vim-airline-themes.git', {'name': 'statusline_airline_themes'}
Plugin 'git@github.com:edkolev/tmuxline.vim.git', {'name': 'statusline_tmuxline'}
Plugin 'git@github.com:chriskempson/base16-vim', {'name': 'statusline_colors_base16'}

Plugin 'git@github.com:vim-scripts/VimRepress.git', {'name': 'general_VimRepress'}
Plugin 'git@github.com:vim-scripts/EasyGrep.git', {'name': 'general_EasyGrep'}
Plugin 'git@github.com:tpope/vim-fugitive.git', {'name': 'general_fugitive'}
Plugin 'git@github.com:vim-scripts/TaskList.vim.git', {'name': 'general_TaskList'}
Plugin 'git@github.com:vim-scripts/file-line.git', {'name': 'general_file-line'}
Plugin 'git@github.com:mattn/gist-vim.git', {'name': 'general_gist'}
Plugin 'git@github.com:vim-scripts/taglist.vim.git', {'name': 'general_taglist'}
Plugin 'git@github.com:scrooloose/nerdtree.git', {'name': 'general_nerdtree'}
Plugin 'git@github.com:mattn/webapi-vim.git', {'name': 'general_webapi'}
Plugin 'git@github.com:kien/ctrlp.vim.git', {'name': 'general_ctrlp'}
Plugin 'git@github.com:duff/vim-bufonly.git', {'name': 'general_bufonly'}
Plugin 'git@github.com:rking/ag.vim.git', {'name': 'general_ag'}
Plugin 'git@github.com:tsaleh/vim-align.git', {'name': 'general_align'}
Plugin 'git@github.com:tpope/vim-surround.git', {'name': 'general_surround'}

call vundle#end()

""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""
" Explicitly tell Vim that the terminal supports 256 colors
set t_Co=256

" Sets how many lines of history VIM has to remember
set history=700

" Recognize filetype on the fly
filetype on
filetype plugin on

" Set to auto read when a file is changed from the outside
set autoread

" Set ',' as map leader
let mapleader = ","
let g:mapleader = ","

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Do not show startup message
set shortmess+=I

" Enable mouse usage
set mouse=a

" Set terminal window title
set title

" Check OS - needed for minor differences between OSX and Linux
let os = substitute(system('uname'), "\n", "", "")

" Always enable relative numbering (hybrid mode)
set number
set relativenumber


""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""
" cmd completion enhanced mode
set wildmenu

" Line/Column information
set ruler

" Search related
set incsearch  " Incremental search
set ignorecase " Override 'ignorecase' if search pattern contains upper case characters
set smartcase  " When searching try to be smart about cases
set hlsearch   " Search highlighting

" Shows all occurences of the underlying word
nnoremap * :set hls<CR>:exec "let @/='\\<".expand("<cword>")."\\>'"<CR>

" GUI options
if has("gui_running")
  " Don't show toolbar
  set guioptions-=T
  " Vertical fullscreen
  set lines=999 columns=100
endif


""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Colorschemes
" Settings when running GUI (MacVIM)
if has('gui_running')
    " Tomorrow theme
    colorscheme base16-tomorrow-night

  else
    " Settings when running CLI (iTerm2, PuTTY or SecureCRT)
    "Tomorrow theme
    set background=dark
    colorscheme base16-tomorrow-night

end

" Set font, always use patched DejaVu Sans Mono
if os == "darwin"
    " default
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11

  elseif os == "Linux"
    " default
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
endif


""""""""""""""""""""""""""""""""""""""""""""""""
" Backup and undo
""""""""""""""""""""""""""""""""""""""""""""""""
" Backup
" Enable backup files
set backup
" Set backup directory
set backupdir=~/.vim/backups
" Just before writing the file, a copy will be saved with timestamp
autocmd BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

" Undo
" Persistent undo
set undofile
set undodir=~/.vim/undo
set undolevels=500
set undoreload=5000


""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""
" Tab behaviour
set expandtab     " Use spaces instead of tabs
set tabstop=8     " Real tabs should be 8, and they will show with set list on
set softtabstop=2 " When hitting tab or backspace, how many spaces should a tab be (see expandtab)

" Text wrap
set nowrap        " do not wrap line
set textwidth=0   " No autowrapping


""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype settings
""""""""""""""""""""""""""""""""""""""""""""""""
" Detect filetype, load optional filetype plugins, load optional indent rule file
filetype plugin indent on

" Enable syntax highlighting for jquery files
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""
" Do not skip lines when 'wrap' is set
nnoremap j gj
nnoremap k gk

" Remap ESC to 'jj'
inoremap jj <ESC>

" Remove all highlighting with ampersand
nnoremap & :nohls<CR>

" Text bubbling like in Textmate
" http://vimcasts.org/episodes/bubbling-text/
" single lines
nmap <C-k> ddkP
nmap <C-j> ddp
" multiple lines
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

" Fast switching between buffers
map { :bp<cr>
map } :bn<cr>

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" If doing a diff. Upon writing changes to file, automatically update the differences
autocmd BufWritePost * if &diff == 1 | diffupdate | endif


""""""""""""""""""""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""""""""""""""""""""
" General
set laststatus=2    " Always show statusline
set noshowmode      " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Airline
" General
" populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1

" show the path in statusline relative to the current directory
let g:airline_section_c = '%f'

" tabline
" Enable tabline
let g:airline#extensions#tabline#enabled = 1
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" tmuxline
" customization
if os == "Linux"
  let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : ['#(top -b -n1 | grep "Cpu" | cut -d "," -f 4 | cut -d " " -f 2,3) cpu', '#(uptime -p | cut -d "," -f 1)', '#(who | wc -l | sed "s/ //g") users'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W',],
      \'y'    : '#(date "+%a %d/%m/%Y %T")',
      \'z'    : '#H'}
  elseif os == "darwin"
    " tmuxline customization for OSX
    let g:tmuxline_preset = {
        \'a'    : '#S',
        \'b'    : ['#(who | wc -l | sed "s/ //g") users'],
        \'win'  : ['#I', '#W'],
        \'cwin' : ['#I', '#W',],
        \'y'    : '#(date "+%a %d/%m/%Y %T")',
        \'z'    : '#H'}
endif


""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""
" Fast quit
nmap <leader>q :q<cr>

" Fast saving
nmap <leader>w :w!<cr>

" Fast sudo saving
nmap <leader>e :w !sudo tee  % > /dev/null<cr>

" Fast quit without saving
nmap <leader>a :q!<cr>

" Fast pasting
nmap <leader>p :set paste!<cr>

" Cope (current list of errors)
" Show
nmap <leader>c :copen<cr>
" Don't show
nmap <leader>C :ccl<cr>

" Remap capital Q/W to lower case
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Clipboard
if os == "darwin"
    " Fast copying to clipboard in visual mode
    vmap <leader>c "*y<cr>

    " Fast cutting to clipboard in visual mode
    vmap <leader>x "*x<cr>

    " Fast open file with standard program
    nmap <leader>O :!open %:p<cr><cr>

  elseif os == "Linux"
    set clipboard=unnamed
    set clipboard=unnamedplus
endif

" Fast creating a visual code snippet and open in browser
vmap <leader>S :TOhtml<cr> :w! /tmp/1.html<cr> :!open /tmp/1.html<cr> :q!<cr>

" Delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()


""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""
" Set spell language order
set spelllang=de,en

" Pressing ,ss will toggle and untoggle spell checking
nmap <silent> <leader>ss :setlocal spell!<CR>


""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin related
""""""""""""""""""""""""""""""""""""""""""""""""
" Ag
" Fast searching
nmap <leader>s :Ag<cr>

" NERDTree
" Open and close with Ctrl-n
map <c-n> :NERDTreeToggle<CR>
" Show hidden files (dotfiles)
let NERDTreeShowHidden = 1

" CtrlP
" Quickly open
map <leader>f :CtrlP<cr>

" BufOnly
" Fast closing of all buffers expect current
nmap <leader>o :BufOnly<cr>

" Taglist
" Exuberant Ctags; needed for Taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
" Show taglist buffer (classes, methods)
map T :TlistToggle<CR>

" Fugitive
nmap <leader>gd :Gstatus <cr><C-w><C-w> :Gdiff <cr>
nmap <leader>gc :Gcommit<CR>

" Syntastic
" Enable syntastic syntax checking for supported languages
" location-list error window will be automatically opened when errors are detected, and closed when none are detected
let g:syntastic_auto_loc_list=1

" Tasklist
" Show buffer
map TL :TaskList<CR>
