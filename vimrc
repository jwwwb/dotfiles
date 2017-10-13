" Syntax Highlighting
syntax on

" Ruler
set ru

" stop pretending to be vi:
set nocompatible

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

" underscore for append to file
:nnoremap _ Go<CR>

" yank to system clipboard
set clipboard=unnamed

