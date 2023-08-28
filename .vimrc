set nocompatible
filetype plugin on
syntax enable

let mapleader=" "

"""""""""""""""""""""""""""
" Plugins 
"""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'haishanh/night-owl.vim'
"Plug 'arcticicestudio/nord-vim'
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'morhetz/gruvbox'
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
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()

set renderoptions=type:directx
set encoding=utf-8
"set guifont=Fira\ Code:h12
set guifont=Fira\ Mono\ For\ Powerline:h12

"""""""""""""""""""""""""""
" for devicons
filetype off
filetype plugin indent on " required
set encoding=utf-8
let g:airline_powerline_fonts=1

" disable bells
autocmd! GUIEnter * set vb t_vb=

" Do not make vim compatible with vi.
set nocompatible

" Do not create .swp files
set noswapfile

" Number the lines.
set number
set relativenumber
map <C-l> <esc>:set relativenumber! number!<CR>
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Show auto complete menus.
set wildmenu

" Make wildmenu behave like bash completion. Finding commands are so easy now.
set wildmode=list:longest

"Autocomplete (based on context, not language)
"Default: ctrl+p (previous) ctrl+n (next)
inoremap <leader><TAB> <C-p>

"Allow for recursive fuzzy find (here and down)
set path+=**
"Fuzzyfind
set autochdir
set wildcharm=<Tab>
nnoremap <C-p> :find **/*
vnoremap <C-p> :<C-u>find **/*<C-R><C-W><Tab><CR>

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
map <leader>w <esc>:set wrap!<CR>
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
"colorscheme nord
"let g:nord_italic = 1
"let g:nord_underline = 1
"let g:nord_italic_comments = 1
"let g:nord_cursor_line_number_background = 1
"colorscheme molokai
"colorscheme gruvbox
"let g:gruvbox_italic = 1
"let g:gruvbox_underline = 1
"let g:gruvbox_comments = 1
"let g:gruvbox_cursor_line_number_background = 1
"let g:gruvbox_contrast = 'hard'
"let g:gruvbox_italicize_comments = 1
"colorscheme palenight
"let g:palenight_terminal_italics=1
colorscheme night-owl
highlight Comment cterm=italic gui=italic

" To enable the lightline theme
set showtabline=2
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline = { 'colorscheme': 'nightowl' }
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" Airline
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let airline#extensions#ale#error_symbol=1
let airline#extensions#ale#warning_symbol=1
let g:airline#extensions#tabline#fnamemod=':t'
"let g:airline_theme='molokai'
"let g:airline_theme='gruvbox'
"let g:airline_theme='nord'
"let g:airline_theme='palenight'
"let g:airline_theme='night-owl'
"let g:airline_powerline_fonts=1
"let g:airline#extensions#branch#enabled=1

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

" Browse airline tabs (buffers)
:nnoremap <leader>bl :ls<CR> 
:nnoremap <leader>t :enew<CR>
:nnoremap <leader>bd :bp <BAR> bd #<CR>
:nnoremap <leader>l :bnext<CR>
:nnoremap <leader>h :bprevious<CR>

" Map Control S for save
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S>  <C-O>:update<CR>

" Comment block
vnoremap <silent> <C-/> :Commentary<cr>

" Close current buffer
noremap <silent> <C-q> :q!<CR>

"Allow capital Q to also quit, W to also write
command -bar -bang Q q<bang>
command -bar -bang W w<bang>
command -bar -bang WQ wq<bang>

" Select all
map <leader>a <esc>ggVG<CR>

"Filebrowser
"nnoremap <leader>b :Lex<CR>
"let g:netrw_banner=0
"let g:netrw_browse_split=4
"let g:netrw_altv=1
"let g:netrw_winsize=25
"let g:netrw_liststyle=3
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

map <C-b> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:NERDTreeShowIgnoredStatus = 1
autocmd FileType nerdtree setlocal nolist

"term
"wincmd x
"res 20

"Disable Ex mode
nnoremap Q <Nop>
