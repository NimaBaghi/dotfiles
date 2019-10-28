call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'TaDaa/vimade'
Plug 'mcchrish/nnn.vim'
Plug 'skywind3000/asyncrun.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'iberianpig/tig-explorer.vim'
Plug 'ledger/vim-ledger'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/vim-peekaboo'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'amiorin/ctrlp-z'
Plug 'tpope/vim-surround'
Plug 'thaerkh/vim-workspace'
Plug 'tpope/vim-repeat'
Plug 'simnalamburt/vim-mundo'
Plug 'haya14busa/vim-keeppad'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'embear/vim-localvimrc'
Plug 'lifepillar/vim-solarized8'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'leafgarland/typescript-vim'
call plug#end()

" CtrlpZ, fasd intergration
let g:ctrlp_map = ''
let g:ctrlp_extensions = ['Z']

let g:localvimrc_enable=1

" vim-workspace
let g:workspace_session_name = '.session.vim'
let g:workspace_autosave = 0

nnoremap <leader>n :NnnPicker %:p:h<CR>

command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  let cmd = 'fasd -d -e printf'
  for arg in a:000
    let cmd = cmd . ' ' . arg
  endfor
  let path = system(cmd)
  if isdirectory(path)
    echo path
    exec 'cd' fnameescape(path)
  endif
endfunction


" coc
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

imap <C-l> <Plug>(coc-snippets-expand)

" Colors
set number relativenumber
syntax enable
set background=dark
set termguicolors
" let g:solarized_termtrans=1
colorscheme solarized8
set cursorline
if exists('g:GuiLoaded')
  Guifont! Iosevka:h13
endif

augroup TerminalStuff
    au!
    autocmd TermOpen * nnoremap <buffer> <A-q> <Esc>:bdelete!<CR>
    autocmd BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif
    autocmd TermOpen * setlocal nonumber norelativenumber noshowcmd noruler
    autocmd TermOpen * echo ""
augroup END


" Other
filetype plugin indent on
set autowrite
setlocal spell spelllang=en_us

if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

" Cd to current file directory
command CDC cd %:p:h

" vim-bufferline
 let g:bufferline_echo = 0
 let g:bufferline_show_bufnr = 0

" Color terminal curser
" :hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" Indent
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

" Mouse integration
set mousemodel=popup
set mouse=a

" Maps
let mapleader = " "
nmap <S-w> :w<CR>
nmap <S-q> :w<CR>:bd<CR>
nmap <leader>1 :on<CR>
inoremap jj <Esc>

" fzf
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nmap <leader>o :History<CR>
nmap <leader>p :GFiles<CR>
nmap <C-p> :GFiles<CR>
nmap <leader>/ :Rg<CR>
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
nmap <leader><leader> :Commands<CR>
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

" Hide statusline in fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" File manager
" nnoremap <leader>d :Ranger<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
" let g:ranger_replace_netrw = 1

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
" nnoremap <A-l> <C-W><C-L>
" nnoremap <A-h> <C-W><C-H>

" Ale
nmap <silent> <leader>en :ALENext<cr>
nmap <silent> <leader>ep :ALEPrevious<cr>
nnoremap <C-q> :ALEHover<CR>
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1
" set completeopt=menu,menuone,preview,noselect,noinsert "" see help *ale-completion-completopt-bug*
let b:ale_set_balloons = 1
" let g:ale_open_list = 'on_save'
let g:ale_sign_column_always = 1

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" vim-javascript
let g:jsx_ext_required = 0
" let g:javascript_plugin_flow = 1

" Navigation
nnoremap <A-j> <C-w>h
nnoremap <A-k> <C-w>l
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
inoremap <A-q> <Esc>:bdelete<CR>
nnoremap <A-q> <Esc>:bdelete<CR>
nnoremap <leader><tab> :b#<cr>
nnoremap <A-l> :bnext<CR>
nnoremap <A-h> :bprev<CR>

" Tig
if has('nvim')
  nnoremap <leader>gs :Tig<cr>
else
  nmap <leader>gs :!tig status<cr>
endif

" Nvim specific
if has('nvim')
  set inccommand=nosplit
endif

" Teminal mode, make it like tmux
if has('nvim')
  nnoremap <A-n> :terminal<CR>i
  inoremap <A-h> <C-\><C-N><C-w>h
  inoremap <A-j> <C-\><C-N><C-w>j
  inoremap <A-k> <C-\><C-N><C-w>k
  inoremap <A-l> <C-\><C-N><C-w>l
  tnoremap <Esc><Esc> <C-\><C-n>
  " tnoremap <M-[> <Esc>
  " tnoremap <C-v><Esc> <Esc>
  tnoremap <A-h> <C-\><C-N><C-w>h
  tnoremap <A-j> <C-\><C-N><C-w>j
  tnoremap <A-k> <C-\><C-N><C-w>k
  tnoremap <A-l> <C-\><C-N><C-w>l
  tnoremap <A-l> <C-\><C-n>:bnext<CR>
  tnoremap <A-h> <C-\><C-n>:bprev<CR>
  tnoremap <A-q> <C-\><C-n>:bdelete!<CR>
  tnoremap <A-n> <C-\><C-n>:terminal<CR>i
endif


" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev z Z
cnoreabbrev j Z
cnoreabbrev Qall qall

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Clipboard
noremap <C-c> "+y<CR>
inoremap <C-v> <Esc>l"+gPa

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Airline
" let g:airline_theme='minimalist'
let g:airline_section_x=''
let g:airline_section_y=''
" let g:airline_section_warning=''
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat =
  \ 'gundo|undotree|vimfiler|tagbar|nerd_tree|startify|!'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
set noshowmode
