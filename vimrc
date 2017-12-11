" Syntax Highlighting
syntax on
colo slate
set t_Co=256

" Ruler
set ru
set cursorcolumn

" stop pretending to be vi:
set nocompatible

" Vundle:
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" add plugins here using "Plugin 'githubrepo/package'"
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdcommenter'
Plugin 'lervag/vimtex'
" :PluginInstall to install
" end add plugins
call vundle#end()

" set vimtex pdf viewer
let g:latex_view_general_viewer = 'open'
let g:vimtex_compiler_latexmk = {'callback' : 0}

" netrw and nerdcommenter require this
filetype plugin on

" allow search to go into subfolders
set path+=**

" matching files menu during tab complete
set wildmenu

" tag jumping
command! Tags !ctags -R .

" netrw for file browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" nerdcommenter settings for commenting and uncommenting
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1   "add spaces after comment delimiter
let g:NERDTrimTrailingWhitespace = 1 "trim trailing whitespace when uncomm-ing
let g:NERDDefaultAlign = 'left'

" set relative line numbers
set relativenumber
set number

" hopefully python indenting
set showmatch
set ts=4
set sts=4
set sw=4
set autoindent
set smartindent
set smarttab
set expandtab
set number
set nowrap
set colorcolumn=81,121
highlight ColorColumn ctermbg=8

let mapleader=","           " leader key as comma
nnoremap + Go|              " plus appends to file
nnoremap _ o<Esc>|          " nderscore adds blank line below
nnoremap ; :|               " make colon work just like semicolon
nnoremap <C-i> i_<Esc>r|    " ^i behaves like r but for insert
nnoremap <Leader>e :tabdo exec 'windo e'<CR>

" yank to system clipboard
set clipboard=unnamedplus

" f5 to execute file (make sure it has hashbang at the start!)
nmap <F6> :w<CR>:silent !chmod 755 %<CR>:silent !./% > .tmp.xyz<CR>
     \ :tabnew<CR>:r .tmp.xyz<CR>:silent !rm .tmp.xyz<CR>:redraw!<CR>

" make airline look like powerline
set t_Co=256
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

" make mouse work inside of vim
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" save in insert mode using ^s
inoremap <c-s> <c-o>:w<cr><Esc>
inoremap <c-q> <c-o>:wq<cr>
nnoremap <c-s> :w<cr>

" disable arrow keys and backspace in insert mode
inoremap <Up> <Esc>k
inoremap <Down> <Esc>j
inoremap <Left> <Esc>
inoremap <Right> <Esc>2l
" inoremap <Backspace> <Esc>

" visualize special keys:
highlight SpecialKey ctermfg=36
highlight NonText ctermfg=36
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" commenting remaps:
nnoremap ,c :call NERDComment(0,"toggle")<CR>
nnoremap <c-_> :call NERDComment(0,"toggle")<CR>
vnoremap ,c :call NERDComment(0,"toggle")<CR>
vnoremap <c-_> :call NERDComment(0,"toggle")<CR>

" make split opening more natural:
set splitbelow
set splitright

