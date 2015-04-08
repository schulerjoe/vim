# General
## Install
Clone it

    git clone git@github.com:schulerjoe/vim.git $HOME/.vim

Clone Vundle plugin manager

    git clone git@github.com:gmarik/Vundle.vim.git $HOME/.vim/bundle/vundle

Create symlink

    ln -s $HOME/.vim/vimrc $HOME/.vimrc

Launch `vim` and run `:PluginInstall`

## Update plugins
Launch `vim` and run `:PluginUpdate`

## Adding a new plugin
Just add a new entry in the `.vimrc` between `call vundle#begin()` and `call vundle#end()`

    Plugin '%GITHUBUSER%/%REPOSITORY%', {'name': '%FOLDER%'}

And launch `vim` and run `:PluginUpdate`

# PLUGINS
## MANAGER
### vundle
* source: https://github.com/gmarik/Vundle.vim
* directory: ./bundle/vundle

Vundle is short for Vim bundle and is a Vim plugin manager.

Vundle allows you to...

* keep track of and configure your plugins right in the .vimrc
* install configured plugins (a.k.a. scripts/bundle)
* update configured plugins
* search by name all available Vim scripts
* clean unused plugins up
* run the above actions in a single keypress with interactive mode

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
* directory: ./bundle/syntax_align

Align text on arbitray symbols, i.e. '='.

Example:

    foo = 1
    foobar = 2

Select in visual mode, then:

    :Align =

You get:

    foo    = 1
    foobar = 2

### Surround
* source: https://github.com/tpope/vim-surround
* directory: ./bundle/general_surround

Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.

### dbext
* source: https://github.com/vim-scripts/dbext.vim
* directory: ./bundle/general_dbext

This plugin contains functions/mappings/commands to enable Vim to access several databases.

Current databases supported are:
* ODBC / Perl DBI
* Mysql
* Oracle
* Oracle Rdb (VMS)
* SAP HANA
* SAP Sybase SQL Anywhere (SA/ASA)
* SAP Sybase IQ (ASA)
* SAP Sybase Adaptive Server Enterprise (ASE)
* SAP Sybase UltraLite (UL)
* Microsoft SQL Server
* IBM DB2
* Interbase
* SQLite
* PostgreSQL
* Ingres
* Firebird

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
### Tomorrow
* source: https://github.com/chriskempson/tomorrow-theme/
* directory: ./bundle/colors_tomorrow

After having spent over five years using, tweaking and refining a personal
editor theme I decided it was time to release "Tomorrow Theme" - a bright theme
with pastel colours and sensible syntax highlighting.

A theme should not get in your way but should aid your programming with easily
identifiable colours that add meaning and enhance legibility. This was the main
focus when developing Tomorrow.

## FONTS
### Deja Vu Sans Mono
http://sourceforge.net/projects/dejavu/

This font comes preinstalled in Ubuntu.

For Powerline patched version check https://github.com/powerline/fonts
