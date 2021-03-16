set nocompatible
filetype plugin on
syntax enable

let mapleader=" "

"""""""""""""""""""""""""""
" Plugins 
"""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

"linting
Plug 'w0rp/ale'
"git status checker
Plug 'tpope/vim-fugitive'
"Block comments; gcc to comment a line, gc<motion>
Plug 'tpope/vim-commentary'
"Display vertical line for each indent
Plug 'Yggdroot/indentLine'
"autocomplete
Plug 'ervandew/supertab'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Auto reload after file change
Plug 'djoshea/vim-autoread'
"Syntax highlighting
Plug 'HerringtonDarkholme/yats.vim' "TS
Plug 'slim-template/vim-slim'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'pangloss/vim-javascript'
"file browser
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"theme
Plug 'vim-airline/vim-airline-themes'
Plug 'haishanh/night-owl.vim'
"Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
call plug#end()

set encoding=utf8

"""""""""""""""""""""""""""
" disable bells
autocmd! GUIEnter * set vb t_vb=

" Do not make vim compatible with vi.
set nocompatible

" Do not create .swp files
set noswapfile

" Number the lines.
set number
set relativenumber

" Show auto complete menus.
set wildmenu

" Make wildmenu behave like bash completion. Finding commands are so easy now.
set wildmode=list:longest

" Enable mouse pointing
set mouse=a

" ALWAYS spaces
set expandtab

" Fix backspace behavior 
set backspace=indent,eol,start

" Use system clipboard 
set clipboard+=unnamed

" Keep Undo history on buffer change
set hidden

" Reload files after change on Disk
"set autoread
"au CursorHold * checktime

" Turn on syntax hightlighting.
set syntax=on
set nowrap
set tabstop=2
set shiftwidth=2
set nocindent
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" Speed optimization
set ttyfast
set lazyredraw

" Theme
set background=dark
set termguicolors
colorscheme night-owl
"colorscheme nord
"let g:nord_italic = 1
"let g:nord_underline = 1
"let g:nord_italic_comments = 1
"let g:nord_cursor_line_number_background = 1
"colorscheme gruvbox
"let g:gruvbox_italic = 1
"let g:gruvbox_underline = 1
"let g:gruvbox_comments = 1
"let g:gruvbox_cursor_line_number_background = 1
"let g:gruvbox_contrast = 'hard'
"let g:gruvbox_italicize_comments = 1

" Airline
set laststatus=2
let g:airline_theme='night_owl'
"let g:airline_theme='gruvbox'
"let g:airline_theme='nord'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Indent Guides
let g:indentLine_enabled=1
let g:indentLine_color_term=235
let g:indentLine_char='┆'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Start Minimap
" autocmd VimEnter * Minimap

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

nnoremap <silent> <Leader>bd :q<CR>
nnoremap <silent> <Leader>bD :q!<CR>

" Chain vimgrep and copen
augroup qf
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    cwindow
    autocmd VimEnter        *     cwindow
augroup END

" Change cursor appearance depending on the current mode
set cursorline
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

""""""""""""""""""""""""""
" Custom bindings
""""""""""""""""""""""""""

" Browse airline tabs
:nnoremap <leader>l :ls<CR>b 
:nnoremap <leader>n :enew<CR>
:nnoremap <leader>d :bd<CR>
:nnoremap <leader>o :bnext<CR>
:nnoremap <leader>i :bprevious<CR>

" Map Control S for save
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S>  <C-O>:update<CR>

" Comment block
vnoremap <silent> <C-k> :Commentary<cr>

" Close current buffer
noremap <silent> <C-q> :q!<CR>

command Q q
command W w

" Select all
map <C-a> <esc>ggVG

"Allow for recursive fuzzy find (here and down)
set path+=**

"Filebrowser
nnoremap <leader>l :Lex<CR>
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

map <C-n> :NERDTreeToggle %<CR>
map <C-m> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeShowIgnoredStatus = 1

"term
"wincmd x
"res 20
