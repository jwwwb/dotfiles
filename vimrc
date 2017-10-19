" Syntax Highlighting
syntax on
colo slate
set t_Co=256

" Ruler
set ru

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
" end add plugins
call vundle#end()

" netrw
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

" underscore for append to file
nnoremap + Go<CR>
nnoremap _ o<Esc>

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
inoremap <c-s> <c-o>:w<cr>
inoremap <c-q> <c-o>:wq<cr>
nnoremap <c-s> :w<cr>

" visualize special keys:
highlight SpecialKey ctermfg=36
highlight NonText ctermfg=36
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

