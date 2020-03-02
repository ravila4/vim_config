" ~/.vimrc (configuration file for vim editor)

" Appearance
colorscheme darksea
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

" Copy yanked text in Windows
if system('uname -r') =~ "Microsoft"
  nnoremap = :r !powershell.exe -Command "& {Get-Clipboard}"<enter>
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe ',@")
  augroup END
endif


"
" Plugin management
"

" Let Vundle manage Vundle -- required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'airblade/vim-gitgutter'
Plugin 'nvie/vim-flake8'
Plugin 'Raimondi/delimitMate'
Plugin 'goerz/jupytext.vim'
Plugin 'ravila4/vim-neatstatus'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" Ctags key binding
map <f12> :! ctags -R .<CR>

" Insert date
map <F3> :r!date "+\%F" -d "-2 day" <CR>

" delimitMate settings
let delimitMate_expand_cr = 1

" NeatStatusLine settings
let g:NeatStatusLine_color_insert = 'guifg=#ffffff guibg=#ff0000 gui=bold ctermfg=15 ctermbg=9 cterm=bold'
