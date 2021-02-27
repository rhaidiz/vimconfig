" ============ PLUGINs ============
" {{{
" vim-plugged
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" multiline cursor
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
 
Plug 'https://github.com/airblade/vim-gitgutter.git'
 
"Plug 'ctrlpvim/ctrlp.vim'
 
" nerdtree
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
 
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
 
" dracula theme
Plug 'https://github.com/dracula/vim.git'

" Silver searcher
" Plug 'gabesoft/vim-ags'

" Go
Plug 'govim/govim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" fzf
" remember to install fzf, bat for file preview and ag for searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1

" Initialize plugin system
call plug#end()
" }}}

" " Deoplete {{{
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('omni_patterns', {
" \ 'go': '[^. *\t]\.\w*',
" \})
" " <TAB>: completion.
" function! s:check_back_space() abort 
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ deoplete#manual_complete()
" " }}}

" Settings {{{
" set spell " enable spell checker. To obtain suggestion press z= on the word
" :setlocal spell spelllang=en " set spell checker  for eng. Use ]s and [s to 
" move to the next and previous misspelled word
set scrolloff=10 " Lines to keep above and below curso
set backspace=indent,eol,start " don't remember
set wildmenu " Vim command completion expanded
set laststatus=2 " always show status bar
set incsearch " while searching show the pattern that matches so far
set number relativenumber " show line numbers hybrid mode
set cursorline " highlight the cursor line
set showcmd " show cmd in last line
set hlsearch " highlight search
set colorcolumn=80 " set column to 80 chars
let g:airline#extensions#tabline#enabled = 1 " enable airline
set mouse=a " enable mouse support in case I'm lazy
set autoindent " auto indent based on current line
set expandtab " spaces for tabs
set tabstop=2 " number of spaces for a tab
set shiftwidth=2 " indentation when using << >> and ==
set wrap " wrap lines
set ffs=unix,dos,mac " EOL formart to try when editing\reading file in buffer
set termguicolors " for 24bit color support
syntax enable " enable syntax
colorscheme dracula " colorscheme
set guifont=Hack\ Nerd\ Font:h13 " font
set listchars=tab:\·\ ",extends:>,precedes:< " to use with set list to show special characters
set list " show invisible chars
set autoread " re-read a file that was changed outside of vim
set nobackup " disable backup
set nowritebackup " disable backup
set noswapfile " disable swap file
let mapleader = "-" " leader - to be used with command for all vim
let maplocalleader = "." " localleader - to be used for command specific to the buffer
autocmd! GUIEnter * set vb t_vb= " Remove annoying bell sound from MacVim
set shell=fish " set prefered shell for :terminal
set foldmarker={{{,}}} " set what to use as fold marker
set foldmethod=marker " set fold method to marker
set foldlevelstart=20 " decide how fold should be when loading in buffer
set hidden " do not unload buffer when abandoned. Useful for switching buf without persisting it and keep its history of undos
set ignorecase " ignore case sensitivity when searching
set smartcase " overwrite ignorecase if uppercase letters appear
set fillchars+=vert:\  " get rid of split separator, dont' line it
" no line numbers in terminal buffers
autocmd TerminalOpen * if &buftype == 'terminal' | setlocal nonumber | setlocal norelativenumber | endif

" suggested by the govim plugin
set ttymouse=xterm2 " terminal type for which mouse command should be recognized
                    " xterm2 is better for iterm2

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
" }}}

" Mapping {{{
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
" open fzf Files with Ctrl-p
nnoremap <C-p> :Files<CR> 
nnoremap <c-c> :NERDTreeToggle<CR>
" select current word in normal mode
nnoremap <c-a> viw  
" open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr> 
" reload vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> 
" behave like esc
inoremap jk <esc>
" disable esc
inoremap <esc> <nop> 
nnoremap <Up> <nop>    
nnoremap <Left> <nop>  
nnoremap <Right> <nop> 
nnoremap <Down> <nop>  

" Silver searcher mappings
" Search for the word under cursor
nnoremap <Leader>s :Ag<Space><C-R>=expand('<cword>')<CR><CR>
" Search for the visually selected text
vnoremap <Leader>s y:Ags<Space><C-R>='"' . escape(@", '"*?()[]{}.') . '"'<CR><CR>
" Run Ags
nnoremap <Leader>a :Ags<Space>
" Quit Ags
nnoremap <Leader><Leader>a :AgsQuit<CR>

" Move around buffers
nnoremap ' :bp!<CR><CR>
nnoremap ì :bn!<CR><CR>
" Move around tabs
nnoremap è :tabp<CR><CR>
nnoremap + :tabn<CR><CR>

" Autocomplete
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
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
" NerdTree stuff {{{
let NERDTreeShowHidden=1" 
let NERDTreeRespectWildIgnore=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:NERDTreeGitStatusShowIgnored = 1
"call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'NONE')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', 'NONE')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', 'NONE')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', 'NONE')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', 'NONE')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', 'NONE')
"call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', 'NONE')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', 'NONE')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', 'NONE')
"call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 'NONE')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'NONE')
"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'NONE')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', 'NONE')
"call NERDTreeHighlightFile('go', 'lightblue', 'none', '#338ab3', 'NONE')
" }}}

