" ~/.vimrc (configuration file for vim editor)

" Appearance
colorscheme default
set background=dark
syntax on	                        " Automatic syntax highlighting
set t_Co=256      	      	        " 256 colors in terminal

" Line Numbers
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
set cursorline     			" Highlight current line

" Tabbing 
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

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
Plug 'ervandew/supertab'
Plug 'davidhalter/jedi-vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'chrisbra/csv.vim'
Plug 'iamcco/markdown-preview.vim'
Plug 'jpalardy/vim-slime'
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

" delimitMate settings
let delimitMate_expand_cr = 1

" vim-slime settings
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
