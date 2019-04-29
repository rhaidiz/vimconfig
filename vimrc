" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" aslan++
"Bundle 'file:////Users/federicodemeo/.config/nvim/bundle/aslanpp'

" multiline cursor
Plug 'https://github.com/terryma/vim-multiple-cursors.git'

Plug 'wincent/command-t'

" snippet engine used by vim-snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

Plug 'ctrlpvim/ctrlp.vim'
"Plug 'fugitive.vim'

Plug 'honza/vim-snippets'
" latex
Plug 'misterade/LaTeX-Box'

" nerdtree
Plug 'https://github.com/scrooloose/nerdtree.git'

" airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()


" tuning
set nofoldenable 
"set esckeys
set backspace=indent,eol,start
set nostartofline
set wildmenu
set ruler
" show statusbar always
set laststatus=2
set incsearch

" performance boost
set lazyredraw
set ttyfast

" show\hide some stuff to video
set number
set cursorline
set showcmd
set showmatch
set noshowmode
set hlsearch
set colorcolumn=80
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="bubblegum"


" use mouse
set mouse=a

" formatting
set smarttab
set autoindent
set noexpandtab
set tabstop=2
set shiftwidth=2
set wrap
set ffs=unix,dos,mac

" The 'encoding' option can no longer be changed after initialization."
" https://github.com/neovim/neovim/wiki/Following-HEAD
if(!has('nvim'))
		set encoding=utf8
endif
set list
set listchars=tab:▸\ ,trail:¬

"syntax
syntax on

" used to turn on 24bit colors in neovim
set termguicolors
"colorscheme solarized
colorscheme iceberg
" set an underline line in gui
hi CursorLine gui=underline
hi Visual guibg=#3d415d
" makes the special charactes a bit brigther
hi SpecialKey guifg=#989DB4
hi SpellBad guifg=#E27878

" re-read a file if changed
set autoread

" disable .swp backups
set nobackup
set nowritebackup
set noswapfile


" YCM settings {{{
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_min_num_identifier_candidate_chars = 99
" }}}

" Vimscript file settings {{{
augroup filetype_vim
		autocmd!
		" note, sourcing vimrc with autocmd FileType won't work
		" since vim has already set the FileType
		autocmd FileType vim setlocal foldmethod=marker
		autocmd FileType text setlocal foldmethod=marker
augroup END
" }}}

" Leaders {{{
let mapleader = "-"
let maplocalleader = "."
" }}}

" Mapping {{{
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
inoremap <c-u> <esc>viwUea
nnoremap <c-c> :NERDTreeToggle<CR>
nnoremap <c-a> viw
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <Up> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Down> <nop>
nnoremap <leader>s :set hls!<cr>
inoremap <leader>p <C-r>"
" }}}
		
autocmd BufNewFile,BufRead *.txt :setlocal spell spelllang=en_us

" Trick for avoiding toggle paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" LatexBox {{{

augroup latexbox_mapping
		autocmd!
		autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <LocalLeader>ll :update!<CR>:Latexmk!<CR>
		" <C-R>= allows to insert the content of an expression at the cursor
		" position. Remember that this is a command and not a function
		autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <LocalLeader>lv :LatexView <C-R>=line('.')<CR><CR>
		autocmd BufNewFile,BufRead *.tex :setlocal spell spelllang=en_us
		autocmd BufNewFile,BufRead *.tex :call Set_latex()
augroup END


" deoplete
let g:deoplete#enable_at_startup = 1

function! Set_latex()
	let g:LatexBox_auto_preview = 1
	let s:extfname = expand("%:e")
	if s:extfname ==? "tex"
	  let g:LatexBox_split_type="new"
	endif
	
	" configure LatexBox to synctex and to use Skim
	let g:LatexBox_latexmk_options = "-f -cd -interaction=nonstopmode -pdflatex='pdflatex -synctex=1 \%O \%S'"
	" -r to displayline is used to retrieve the pdf if it was open
	let g:LatexBox_viewer="/Applications/Skim.app/Contents/SharedSupport/displayline -r "
	
	let g:LatexBox_latexmk_async = 1
	let g:LatexBox_quickfix = 2
endfunction
" }}}
let g:completor_python_binary = '/usr/local/bin/python3'
