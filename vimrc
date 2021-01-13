" vim-plugged
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" multiline cursor
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
 
Plug 'https://github.com/airblade/vim-gitgutter.git'
 
Plug 'ctrlpvim/ctrlp.vim'
 
" latex
Plug 'misterade/LaTeX-Box'
 
" nerdtree
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
 
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
 
" dracula theme
Plug 'https://github.com/dracula/vim.git'

Plug 'gabesoft/vim-ags'

" Go
Plug 'govim/govim'

"
Plug 'vimwiki/vimwiki'

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
 
" " show\hide some stuff to video
set number
set cursorline
set showcmd
set hlsearch
set colorcolumn=80
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme="simple"
 
 
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
 
" used to turn on 24bit colors in neovim
set termguicolors

" syntax
syntax enable
colorscheme dracula 
set guifont=Hack\ Nerd\ Font:h13

" Shoe special characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" re-read a file if changed
set autoread

" disable .swp backups
set nobackup
set nowritebackup
set noswapfile


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
" }}}

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


function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

let g:NERDTreeGitStatusShowIgnored = 1
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

" Remove annoying bell sound from MacVim
autocmd! GUIEnter * set vb t_vb=

" Mark .md file as vimwiki file
let g:vimwiki_ext2syntax = {'.md':'markdown'}

nnoremap ' :bp<CR><CR>
nnoremap ì :bn<CR><CR>
