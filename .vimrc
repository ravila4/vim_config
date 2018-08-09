" ~/.vimrc (configuration file for vim editor)

" Appearance
colorscheme arc
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
" Bundle plugin management
"

" Let Vundle manage Vundle -- required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" The bundles you install will be listed here :
Bundle 'gmarik/vundle'
Bundle 'airblade/vim-gitgutter'
Bundle 'nvie/vim-flake8'
Bundle 'itchyny/lightline.vim'
Bundle 'ervandew/supertab'
Bundle 'Raimondi/delimitMate'

filetype plugin indent on

"
" Lightline settings
"

" Always show status bar
set laststatus=2
" Lightline Theme
set noshowmode
let g:lightline = {
        \ 'colorscheme': 'arcline',
        \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
            \ },
        \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'readonly': 'LightLineReadonly',
            \   'modified': 'LightLineModified'
            \ },
        \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
 endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
 endfunction

function! LightLineFugitive()
	if exists("*fugitive#head")
		let _ = fugitive#head()
		return strlen(_) ? ' '._ : ''
    endif
	return ''
endfunction

" Nerd Tree key binding
map <F2> :NERDTreeToggle<CR>

" Ctags key binding
map <f12> :! ctags -R .<CR>

let delimitMate_expand_cr = 1
let g:SuperTabDefaultCompletionType = 'context'
