" ~/.vimrc (configuration file for vim editor)

" Appearance
colorscheme yinse
set background=dark
syntax on	                        " Automatic syntax highlighting
set t_Co=256      	      	        " 256 colors in terminal
set tabstop=8                           " Tab settings
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set number				" Show line numbers
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

" Highlight characters past column 80 for Python files
hi ColorColumn ctermbg=0 guibg=#383C4A  
augroup vimrc_autocmds
		autocmd!
		autocmd FileType python let &colorcolumn=join(range(81,999),",") 
		augroup END

set nocompatible
filetype off

" Highlight unnecessary spaces
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"
" Plugin management
"

" Let Vundle manage Vundle -- required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nvie/vim-flake8'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
call vundle#end()
filetype plugin indent on

" Ctags key binding
map <f12> :! ctags -R .<CR>

" delimitMate settings
let delimitMate_expand_cr = 1

" SuperTab completion settings
let g:SuperTabDefaultCompletionType = 'context'
