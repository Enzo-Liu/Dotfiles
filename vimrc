set nocompatible
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
nnoremap ; :
execute pathogen#infect()

"for mvim
if has("gui_running")
  set go=aAce        " 去掉难看的工具栏和滑动条
  set gfn=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h13
  set gfm=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h13
  set fullscreen
endif

"colorTheme
syntax enable
set background=dark
colorscheme solarized
"set background=dark
"colorscheme base16-solarized

"设置自定义的<leader>快捷键
let mapleader=","
let g:mapleader=","
map <leader>w :w<CR>
map <leader>q :q<CR>
nnoremap <leader>p O<Esc>p

map <leader>aq :qa!<CR>

set number
set mouse=a
set autoindent
set smartindent
set expandtab
set showmatch
set showcmd
set guioptions-=T
set ruler
set hlsearch
set autoread
set incsearch
set shiftwidth=2
set tabstop=2
set ignorecase
set confirm
set completeopt=longest,menu
set grepprg=grep\ -nH\ $*
set fencs=utf-8,gbk,big5,euc-jp,shift-jis,utf-16le
set fenc=utf-8 enc=utf-8 tenc=utf-8
set hidden
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
set foldmethod=marker
"so the long line wont make vim slow
set synmaxcol=256
" Disable error bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

if $TMUX == ''
  set clipboard+=unnamed
endif

"设置不生成swap文件
set noswf
set cursorline

"设置总在屏幕视线的中间位置
set scrolloff=10

"setFormat
nnoremap <leader>f gg=G<CR>
filetype plugin indent on
set ofu=syntaxcomplete#Complete
autocmd FileType ruby map <leader>r :!ruby %<CR>
autocmd FileType ruby set shiftwidth=2 | set expandtab
autocmd FileType lisp map <leader>r :!clisp %<CR>
autocmd FileType python map <leader>r :!python %<CR>
autocmd FileType javascript map <leader>r :!node %<CR>
autocmd FileType yaml set shiftwidth=2 | set expandtab
autocmd FileType java set shiftwidth=4 | set expandtab | set tabstop=4
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
map <F3> :bp <CR>
map <F4> :bn <CR>
map <PageUp> :bp <CR>
map <PageDown> :bn <CR>
autocmd QuickFixCmdPost * nested cwindow | redraw!
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
au BufNewFile,BufRead Capfile  setf ruby
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
  au BufNewFile,BufRead *.prawn setfiletype ruby
augroup end
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost * silent %s/\t/  /ge | %s/ \+$//ge | redraw!

" 热键绑定
" "直接按 Ctrl + h 等方向键切换窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quickly get out of insert mode without your fingers having to leave the
" " home row (either use 'jj' or 'jk')
inoremap kj <Esc>

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

"设置在命令模式下按Tab缩进 按S-Tab反缩进
nnoremap <S-Tab> <<<ESC>
nnoremap <Tab> >><ESC>

"设置在命令模式下按Tab缩进 按S-Tab反缩进
vnoremap <S-Tab> <<<ESC>
vnoremap <Tab> >><ESC>

"for NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F2> :NERDTreeToggle <CR>
map <leader>e :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.class$','\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let g:nerdtree_tabs_open_on_gui_startup=0
" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1



""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline_theme       = 'solarized'
let g:airline_enable_branch   = 1
let g:airline_enable_syntastic  = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set ttimeoutlen=50

"CTRLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
map <leader>b :CtrlPBuffer<CR>


"Tagbar
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
map <leader>t :TagbarToggle<CR>

" Fugitive
map <leader>gd :Gdiff<CR>

" YCM--youCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" Syntastic
let g:syntastic_ignore_files = ['^.*ba-tgplatform.*\.java$']

" Slimv
let g:slimv_repl_split = 4 " Vertical right split buffer for output
let g:slimv_leader = "'"

"slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ".1"}

" for html5
" Disable event-handler attributes support:
" let g:html5_event_handler_attributes_complete = 0

" Disable RDFa attributes support:
" let g:html5_rdfa_attributes_complete = 0

" Disable microdata attributes support:
" let g:html5_microdata_attributes_complete = 0

" Disable WAI-ARIA attribute support:
" let g:html5_aria_attributes_complete = 0

" for instant markdown
" let g:instant_markdown_slow = 1
