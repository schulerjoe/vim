" vimrc
"
" Author:   Joe Schuler <josefschuler at gmail dot com>
" Source:   https://github.com/schulerjoe/vim-setup
"
" Sections:
"           -> Plugin Manager
"           -> General
"           -> VIM user interface
"           -> Colors and Fonts
"           -> Files, backups and undo
"           -> Text, tab and indent related
"           -> Filetype settings
"           -> Moving around, tabs and buffers
"           -> Status line
"           -> Editing mappings
"           -> Spell checking
"           -> Plugin related

""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN MANAGER
""""""""""""""""""""""""""""""""""""""""""""""""
" Use Pathogen plugin manager, Keep each plugin in its own git submodule
call pathogen#infect()
call pathogen#helptags()


""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""
" Disable vi-compatibility
set nocompatible

" Necessary to show Unicode glyphs
set encoding=utf-8

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


""""""""""""""""""""""""""""""""""""""""""""""""
" VIM USER INTERFACE
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
" COLORS AND FONTS
""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Colorschemes
" Settings when running GUI
if has('gui_running')
    " Tomorrow theme
    set background=dark
    colorscheme Tomorrow-Night-Bright

    " Wombat theme
    "colorscheme wombat256

    "Seoul256 theme
    "let g:seoul256_background = 233
    "colorscheme seoul256
  else
    " Settings when running CLI
    "Tomorrow theme
    set background=dark
    colorscheme Tomorrow-Night-Bright

    " Wombat theme
    "colorscheme wombat256

    "Seoul256 theme
    "let g:seoul256_background = 233
    "colorscheme seoul256
end

" Set font according to operating system
if os == "darwin"
    " default
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11

  elseif os == "Linux"
    " default
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
endif


""""""""""""""""""""""""""""""""""""""""""""""""
" FILES, BACKUPS AND UNDO
""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set nowritebackup
" set noswapfile
set backupdir=/tmp

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=500
set undoreload=5000


""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT, TAB AND INDENT RELATED
""""""""""""""""""""""""""""""""""""""""""""""""
" Tab behaviour
set expandtab     " Use spaces instead of tabs
set tabstop=8     " Real tabs should be 8, and they will show with set list on
set softtabstop=2 " When hitting tab or backspace, how many spaces should a tab be (see expandtab)

" Text wrap
set nowrap      " do not wrap line
set textwidth=0 " No autowrapping


""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""
" Detect filetype, load optional filetype plugins, load optional indent rule file
filetype plugin indent on

" Python
autocmd FileType python set number

" Ruby
autocmd FileType ruby set number

""""""""""""""""""""""""""""""""""""""""""""""""
" MOVING AROUND, TABS, WINDOWS AND BUFFERS
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
" STATUSLINE
""""""""""""""""""""""""""""""""""""""""""""""""
" General
set laststatus=2    " Always show statusline
set noshowmode      " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1

" tmuxline customization
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : ['#(top -b -n1 | grep "Cpu" | cut -d "," -f 4 | cut -d " " -f 2,3) cpu', '#(uptime -p | cut -d "," -f 1)', '#(who | wc -l) users'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W',],
      \'y'    : '#(date "+%a %d/%m/%Y %T")',
      \'z'    : '#H'}

let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""
" EDITING MAPPINGS
""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :w!<cr>

" Fast quit
nmap <leader>q :qa<cr>

" Fast pasting
nmap <leader>p :set paste!<cr>

" Cope (current list of errors)
" Show
nmap <leader>c :cope<cr>
" Don't show
nmap <leader>C :ccl<cr>

" Remap capital Q/W to lower case
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Shortcut for scripting calculations
" Type 8*8<C-A> results in 8*8=64
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>1<CR>

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
" SPELL CHEKING
""""""""""""""""""""""""""""""""""""""""""""""""
" Set spell language order
set spelllang=de,en

" Pressing ,ss will toggle and untoggle spell checking
nmap <silent> <leader>ss :setlocal spell!<CR>


""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN RELATED
""""""""""""""""""""""""""""""""""""""""""""""""
" Ag
" Fast searching
nmap <leader>a :Ag<cr>

" NERDTree
" Open and close with Ctrl-n
map <c-n> :NERDTreeToggle<CR>
" Show hidden files (dotfiles)
let NERDTreeShowHidden = 1
" CtrlP
" Quickly open
map <leader>f :CtrlP<cr>

" Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

" BufOnly
" Fast closing of all buffers expect current
nmap <leader>o :BufOnly<cr>:MBEOpen<cr>

" TwitVIM
" Configuration
if filereadable("~/vim_setup/twitter_account.vim")
  :so ~/vim_setup/twitter_account.vim
  let twitvim_api_root = "https://api.twitter.com/1"
  nmap <leader>tp :BPosttoTwitter<cr>
  nmap <leader>tf :FriendsTwitter<cr>
  nmap <leader>tr :RepliesTwitter<cr>
  nmap <leader>td :DMTwitter<cr>
endif

" Taglist
" Exuberant Ctags; needed for Taglist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
" Show taglist buffer (classes, methods)
map T :TlistToggle<CR>

" Fugitive
" disable mbe, because it confuses Gdiff, then get the status window and diff
nmap <leader>gd :CMiniBufExplorer <cr> :Gstatus <cr><C-w><C-w> :Gdiff <cr>
nmap <leader>gc :Gcommit<CR>

" jQuery
" Enable syntax highlighting
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" Syntastic
" Enable syntastic syntax checking for supported languages
" location-list error window will be automatically opened when errors are detected, and closed when none are detected
let g:syntastic_auto_loc_list=1

" Tasklist
" Show buffer
map TL :TaskList<CR>
