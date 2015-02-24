# General
## Install

    git clone git@github.com:schulerjoe/vim-setup.git $HOME/.vim

Create symlink:

    ln -s $HOME/.vim/vimrc $HOME/.vimrc

Switch to _$HOME/.vim_ directory and fetch submodules:

    cd $HOME/.vim
    git submodule init
    git submodule update

## Update

    cd $HOME/.vim
    git submodule init
    git submodule update

## Upgrade
If you want to upgrade all plugins, pull master for each bundle:

    git submodule foreach git pull origin master

## Adding a new plugin

    cd $HOME/.vim
    git submodule add -f $PATH_TO_GIT_REPO ./bundle/$LOCAL_NAME
    git add .
    # update README.md
    git commit -am"your message"

# PLUGINS
## MANAGER
### pathogen
* source: https://github.com/tpope/vim-pathogen
* directory: ./bundle/pathogen

Manage your 'runtimepath' with ease. In practical terms, pathogen.vim makes it
super easy to install plugins and runtime files in their own private
directories.

## GENERAL
### The Silver Searcher
* source: https://github.com/rking/ag.vim
* directory: ./bundle/general_ag/

This plugin is a front for ag, A.K.A. the_silver_searcher. Ag can be used as a
replacement for 153% of the uses of ack. This plugin will allow you to run ag
from vim, and shows the results in a split window.

### EasyGrep
* source: https://github.com/vim-scripts/EasyGrep
* directory: ./bundle/general_EasyGrep/

EasyGrep makes using vimgrep easier.  When using EasyGrep, searching for a word
is as easy as typing <leader>vv (v v, not double-u) over the word for which you
want to search.  This search can also be accomplished with the :Grep
command.</leader>

Searching and replacing (recursively) in arbitrary folder structures is easy,
as well.

### VimRepress
* source. https://github.com/vim-scripts/VimRepress
* directory: ./bundle/general_VimRepress/

VimRepress is a plugin for managing wordpress blog from Vim.

### TwitVim
* source: https://github.com/vim-scripts/TwitVim
* directory: ./bundle/general_TwitVim/

Allows you to post to Twitter and view Twitter timelines.

### fugitive
* source: https://github.com/tpope/vim-fugitive
* directory: ./bundle/general_fugitive/

I'm not going to lie to you; fugitive.vim may very well be the best Git wrapper
of all time.

### TaskList
* source: https://github.com/vim-scripts/TaskList.vim
* directory: ./bundle/general_TaskList/

This script is based on the eclipse Task List. It will search the file for
FIXME, TODO, and XXX (or a custom list) and put them in a handy list for you to
browse which at the same time will update the location in the document so you
can see exactly where the tag is located.

### file-line
* source: https://github.com/vim-scripts/file-line
* directory: ./bundle/general_file-line

Allow files to be opened on a specific line with the following syntax:

    path_to_file:NN

where NN is the desired line number.

### gist-vim
* source: https://github.com/mattn/gist-vim
* directory: ./bundle/general_gist/

This is a vimscript for creating and managing private and public gists
(http://gist.github.com).

### TagList
* source: https://github.com/vim-scripts/taglist.vim
* directory: ./bundle/general_taglist/

The "Tag List" plugin is a source code browser plugin for Vim and
provides an overview of the structure of source code files and allows
you to efficiently browse through source code files for different
programming languages.

#### Install
Follow install instructions:
http://www.vim.org/scripts/script.php?script_id=273

### NERDTree
* source: https://github.com/scrooloose/nerdtree
* directory: ./bundle/general_nerdtree/

It presents the file system to you in the form of a tree which you
manipulate with the keyboard and/or mouse. It also allows you to perform
simple file system operations.

### Webapi
* source: https://github.com/mattn/webapi-vim
* directory: ./bundle/general_webapi/

An Interface to WEB APIs.

Currently this library supports the following protocols:
* Basic HTTP
* OAuth
* Atompub
* SOAP (in progress)
* XMLRPC
* MetaWeblog API

This library contains:
* XML Parser
* HTML Parser(Hack Way)
* JSON Parser
* BASE64 Hash Algorithm
* SHA1 Hash Algorithm
* HMAC Hash Algorithm
* Bit Operation Library
* Converter for "UTF-8 to Unicode"

### ctrlp
* source: https://github.com/kien/ctrlp.vim
* directory: ./bundle/general_ctrlp/

Fuzzy file finder. A lot like the well known CMD-T, but written in pure
vimscript, so there's no need for C extensions, ruby support, et al.

### BufOnly
* source: https://github.com/duff/vim-bufonly
* directory: ./bundle/general_bufonly/

:BufOnly without an argument will unload all buffers but the current one.

### Align
* source: https://github.com/tsaleh/vim-align
* directory: ./bunde/syntax_align

Align text on arbitray symbols, i.e. '='.

Example:

    foo = 1
    foobar = 2

Select in visual mode, then:

    :Align =

You get:

    foo    = 1
    foobar = 2

## SYNTAX
### Syntastic
* source: https://github.com/scrooloose/syntastic
* directory: ./bundle/syntax_syntastic

Syntastic is a syntax checking plugin that runs buffers through external syntax
checkers as they are saved and opened. If syntax errors are detected, the user
is notified and is happy because they didn't have to compile their code or
execute their script to find them.

### Nginx
* source: https://github.com/vim-scripts/nginx.vim
* directory: ./bundle/syntax_nginx

nginx.vim highlights configuration files for nginx, the high-performance web server

## STATUSLINE
### Airline
* source: https://github.com/bling/vim-airline
* directory: ./bundle/statusline_airline

Lean & mean status/tabline for vim that's light as air

### tmuxline
* source: https://github.com/edkolev/tmuxline.vim
* directory: ./bundle/statusline_tmuxline

Simple tmux statusline generator with support for powerline symbols and vim/airline/lightline statusline integration

## COLOR SCHEMES
### Wombat (dark, high contrast)
* source: https://github.com/cschlueter/vim-wombat
* directory: ./bundle/colors_wombat

### Tomorrow (dark, light, medium contrast)
* source: https://github.com/chriskempson/tomorrow-theme/tree/master/vim
* directory: ./bundle/colors_tomorrow

After having spent over five years using, tweaking and refining a personal
editor theme I decided it was time to release "Tomorrow Theme" - a bright theme
with pastel colours and sensible syntax highlighting.

A theme should not get in your way but should aid your programming with easily
identifiable colours that add meaning and enhance legibility. This was the main
focus when developing Tomorrow.

### Seoul256 (dark, light, low contrast)
* source: https://github.com/junegunn/seoul256.vim
* directory: ./bundle/colors_seoul256

seoul256.vim is a low-contrast Vim color scheme based on Seoul Colors. Works on 256-color terminal or on GVim.

## FONTS
### default's
#### Mac OSX
* Menlo

other option:
Source Code Pro
https://blogs.adobe.com/typblography/2012/09/source-code-pro.html

#### Linux
* Mensch

### About Fonts
#### Inconsolata
http://www.levien.com/type/myfonts/inconsolata.html

It is a monospace font, designed for code listings and the like, in print.
There are a great many "programmer fonts," designed primarily for use on the
screen, but in most cases do not have the attention to detail for high
resolution rendering.

#### Deja Vu Sans Mono
http://sourceforge.net/projects/dejavu/

This font comes preinstalled in Ubuntu.

#### Anonymous Pro
http://www.ms-studio.com/FontSales/anonymouspro.html

Anonymous Pro (2009) is a family of four fixed-width fonts designed especially
with coding in mind. Characters that could be mistaken for one another (O, 0,
I, l, 1, etc.) have distinct shapes to make them easier to tell apart in the
context of source code.

#### Mensch
http://robey.lag.net/2010/06/21/mensch-font.html

The latest MacOS release (10.6, or “Snow Leopard”) comes with a new monospace
font. It’s called “Menlo” and it’s a slightly modified form of the standard
Linux font (with appropriately weightily Linux name) “DejaVu Sans Serif Mono”,
which is itself an updated form of Bitstream Vera Sans Mono.
