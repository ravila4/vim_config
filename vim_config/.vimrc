" ~/.vimrc (configuration file for vim editor)

" Appearance
colorscheme default
set background=dark
syntax on	                        " Automatic syntax highlighting
set t_Co=256      	      	        " 256 colors in terminal
set tabstop=8                           " Tab settings
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set number				" Show line numbers
set relativenumber
set cursorline     			" Highlight current line

" Behaviour
set incsearch ignorecase smartcase	" Search
set scrolloff=4				" Keep some context around cursor
set wildmenu wildmode=list		" Completion
set mouse=a				" Enable mouse for all modes
set nomousehide			        " Don't hide mouse while typing
set mousemodel=popup			" Right-click pops up menu
set guioptions-=T			" Turn off GUI toolbar
set guioptions-=r			" Turn off GUI right scrollbar
set guioptions-=L			" Turn off GUI left scrollbar
set foldmethod=marker                   " Fold code using {{{}}}

" Highlight unnecessary spaces
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Insert date
map <F3> :r!date "+\%F" -d "-2 day" <CR>

" Copy yanked text in Windows
if system('uname -r') =~ "Microsoft"
  nnoremap = :r !powershell.exe -Command "& {Get-Clipboard}"<enter>
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe ',@")
  augroup END
endif

" Plugin management
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'nvie/vim-flake8'
Plug 'Raimondi/delimitMate'
Plug 'goerz/jupytext.vim'
Plug 'ravila4/vim-neatstatus'
Plug 'Valloric/YouCompleteMe'
call plug#end()

" delimitMate settings
let delimitMate_expand_cr = 1

" NeatStatusLine settings
let g:NeatStatusLine_color_insert = 'guifg=#ffffff guibg=#ff0000 gui=bold ctermfg=15 ctermbg=9 cterm=bold'
