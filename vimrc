" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" multiline cursor
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
 
Plug 'airblade/vim-gitgutter.git'
 
Plug 'ctrlpvim/ctrlp.vim'
 
" latex
Plug 'misterade/LaTeX-Box'
 
" nerdtree
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
 
" airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
 
 
" vim visual studio theme
Plug 'tomasiser/vim-code-dark'
 
Plug 'gabesoft/vim-ags'
"Plug 'govim/govim'

" Initialize plugin system
call plug#end()

set guifont=Hack\ Nerd\ Font:h13

"set rubydll=/usr/local/Cellar/ruby/2.6.3/lib/libruby.2.6.dylib

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
"set lazyredraw
"set ttyfast
" 
" " show\hide some stuff to video
set number
 "set cursorline
set showcmd
set hlsearch
set colorcolumn=80
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="codedark"
 
 
" use mouse
set mouse=a
" 
" formatting
set smarttab
set autoindent
set noexpandtab
set tabstop=2
set shiftwidth=2
set wrap
set ffs=unix,dos,mac
" 
" " The 'encoding' option can no longer be changed after initialization."
" " https://github.com/neovim/neovim/wiki/Following-HEAD
" if(!has('nvim'))
" 		set encoding=utf8
" endif
" set list
" set listchars=tab:__,trail:¬
" 
" "syntax
syntax on
" 
" used to turn on 24bit colors in neovim
set termguicolors
"colorscheme solarized
colorscheme codedark
" set an underline line in gui
hi CursorLine gui=underline
" hi Visual guibg=#3d415
" makes the special charactes a bit brigther
hi SpecialKey guifg=#3F4152
hi SpellBad guifg=#E27878
" 
" re-read a file if changed
set autoread

" disable .swp backups
set nobackup
set nowritebackup
set noswapfile
" 
" " Vimscript file settings {{{
" augroup filetype_vim
" 		autocmd!
" 		" note, sourcing vimrc with autocmd FileType won't work
" 		" since vim has already set the FileType
" 		autocmd FileType vim setlocal foldmethod=marker
" 		autocmd FileType text setlocal foldmethod=marker
" augroup END
" " }}}
" 
" Leaders {{{
let mapleader = "-"
let maplocalleader = "."
" }}}
" 
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
" move among buffers with CTRL
nnoremap <F12> :bn<CR>
nnoremap <S-F12> :bp<CR>

" }}}
 		
" autocmd BufNewFile,BufRead *.txt :setlocal spell spelllang=en_us
" 
" Trick for avoiding toggle paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
" 
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

set wildignore+=moc.*,moc_*
let NERDTreeRespectWildIgnore=1
  
"  " LatexBox {{{
"  
"  augroup latexbox_mapping
"  		autocmd!
"  		autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <LocalLeader>ll :update!<CR>:Latexmk!<CR>
"  		" <C-R>= allows to insert the content of an expression at the cursor
"  		" position. Remember that this is a command and not a function
"  		autocmd BufNewFile,BufRead *.tex nnoremap <buffer> <LocalLeader>lv :LatexView <C-R>=line('.')<CR><CR>
"  		autocmd BufNewFile,BufRead *.tex :setlocal spell spelllang=en_us
"  		autocmd BufNewFile,BufRead *.tex :call Set_latex()
"  augroup END
"  
"  
"  function! Set_latex()
"  	let g:LatexBox_auto_preview = 1
"  	let s:extfname = expand("%:e")
"  	if s:extfname ==? "tex"
"  	  let g:LatexBox_split_type="new"
"  	endif
"  	
"  	" configure LatexBox to synctex and to use Skim
"  	let g:LatexBox_latexmk_options = "-f -cd -interaction=nonstopmode -pdflatex='pdflatex -synctex=1 \%O \%S'"
"  	" -r to displayline is used to retrieve the pdf if it was open
"  	let g:LatexBox_viewer="/Applications/Skim.app/Contents/SharedSupport/displayline -r "
"  	
"  	let g:LatexBox_latexmk_async = 1
"  	let g:LatexBox_quickfix = 2
"  endfunction
"  " }}}
"  
"  
  
" To get hover working in the terminal we need to set ttymouse. See
"
" :help ttymouse
"
" for the appropriate setting for your terminal. Note that despite the
" automated tests using xterm as the terminal, a setting of ttymouse=xterm
" does not work correctly beyond a certain column number (citation needed)
" hence we use ttymouse=sgr
set ttymouse=sgr

" Suggestion: By default, govim populates the quickfix window with diagnostics
" reported by gopls after a period of inactivity, the time period being
" defined by updatetime (help updatetime). Here we suggest a short updatetime
" time in order that govim/Vim are more responsive/IDE-like
set updatetime=500
"
" Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
" balloondelay
set balloondelay=250

" Suggestion: Turn on the sign column so you can see error marks on lines
" where there are quickfix errors. Some users who already show line number
" might prefer to instead have the signs shown in the number column; in which
" case set signcolumn=number
set signcolumn=yes

filetype indent on


" Suggestion: show info for completion candidates in a popup menu
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif

" NERDTree
" sync open file with NERDTree
" Check if NERDTree is open or active
" function! IsNERDTreeOpen()        
"    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction
" 
" " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" " file, and we're not in vimdiff
"  function! SyncTree()
"    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"      NERDTreeFind
"      wincmd p
"    endif
" endfunction
" " 
" autocmd VimEnter * call OpenNERDTree()
" let NERDTreeMinimalUI=1
" 
" function! OpenNERDTree()
" 	NERDTree
" 	wincmd p
" endfunction

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" " Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()
"    " NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

let g:NERDTreeShowIgnoredStatus = 1
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'NONE')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', 'NONE')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', 'NONE')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', 'NONE')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 'NONE')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'NONE')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'NONE')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', 'NONE')
call NERDTreeHighlightFile('go', 'lightblue', 'none', '#338ab3', 'NONE')


" Search for the word under cursor
nnoremap <Leader>s :Ags<Space><C-R>=expand('<cword>')<CR><CR>
" Search for the visually selected text
vnoremap <Leader>s y:Ags<Space><C-R>='"' . escape(@", '"*?()[]{}.') . '"'<CR><CR>
" Run Ags
nnoremap <Leader>a :Ags<Space>
" Quit Ags
nnoremap <Leader><Leader>a :AgsQuit<CR>
