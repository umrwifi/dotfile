"  Auto load for first time uses
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
au! BufWritePost init.vim source %
"autocmd BufNewFile *.py 0put =\"#!/usr/bin/python\<nl>\"|$
autocmd BufLeave,FocusLost *  silent! wall "自动保存
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
filetype plugin indent on
filetype plugin on
filetype on
syntax on
syntax enable 
set re=1
set lazyredraw
set synmaxcol=128
syntax sync minlines=256
set nocursorline
set nocursorcolumn
"自动刷新文件
set autoread 
autocmd FocusGained,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif
"记录折叠
autocmd BufWritePost *md,*.vim,*.js mkview
autocmd BufEnter *md,*.vim,*.js silent! loadview
"缩进
set tabstop=2  "tab缩进
set softtabstop=2
set autoindent " 开启自动缩进
set shiftwidth=2 " 自动缩进n个空格
set expandtab  "用space代替tab
"set nowrapscan "不循环搜索文件
set hidden "跳转文件时无需保存
"encoding
set encoding=utf-8  termencoding=utf-8
set fileencodings=ucs-bom,utf-8,sjis,cp936 "防windows 中文乱码
set wildmenu  wildmode=full "补全提示
set ofu=syntaxcomplete#Complete " 自动补全代码
set backspace=indent,eol,start "退格可换行
set undofile  undodir=~/.vim/undo
set conceallevel=2
set infercase "补全忽略大小写
set splitright
"set nosplitright 
set nosplitbelow
set nocompatible
set history=200
set foldlevel=99
set path+=**
set timeoutlen=500 ttimeoutlen=0
set mouse=a
set noswapfile
set showcmd
set showmatch
set laststatus=2
set ruler
set number "relativenumber
set incsearch  "输入搜索内容时就显示搜索结果
set hlsearch
set backupcopy=yes
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set clipboard=unnamed "系统剪切板
let g:clipboard = {
  \ 'name': 'pbcopy',
  \ 'copy': {
  \    '+': 'pbcopy',
  \    '*': 'pbcopy',
  \  },
  \ 'paste': {
  \    '+': 'pbpaste',
  \    '*': 'pbpaste',
  \ },
  \ 'cache_enabled': 0,
  \ }
set termguicolors
let g:python3_host_prog  = '/usr/local/bin/python3' 
let g:python3_host_skip_check=1
let g:python_host_skip_check=1
set updatetime=1000
"set regexpengine=1        " use old regexp engine
set vdir=~/Documents/.nvim/view
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number       column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
set wildignore+=.git*
"mappings
let mapleader = ","
nmap [b :bnext<CR>
nmap ]b :bprevious<CR>
nmap // :noh <cr>
nmap <leader>b :ls<CR>:b 
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap %% <C-R>=expand('%:p:h').'/'<cr>
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>gc : !gcc % && ./a.out <CR>
nmap <expr> <silent> <leader>d len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 ? ':bd<CR>' : ':bp<CR>:bd #<CR>'
noremap <expr> H winline()==1 ? "\<C-u>" : "H"
noremap <expr> L winline()==winheight(0) ? "\<C-d>" : "L"
"file text-object
omap ae :<c-u>normal! mzggVG<cr>`z
omap ie :<c-u>normal! mzggVG<cr>`z
vmap ae :<c-u>normal! mzggVG<cr> 
vmap ie :<c-u>normal! mzggVG<cr>
"fold text-object
omap if :<c-u>normal! mGzcV<cr>`z
omap af :<c-u>normal! mGzcV<cr>`z
vmap if :<c-u>normal! mGzcV<cr>`z
vmap af :<c-u>normal! mGzcV<cr>`z
" emacs like
inoremap <C-b> <left>
inoremap <C-f> <right>
inoremap <C-a> <home>
inoremap <C-e> <end>
inoremap <C-d> <delete>
command! CountMatch :%s///gn
call plug#begin('~/.config/nvim/plugged')
Plug 'leafgarland/typescript-vim' ,{'for':'typescript'}
Plug 'peitalin/vim-jsx-typescript' ,{'for':'typescript'}
Plug 'othree/yajs.vim' ,{'for':'typescript'}
Plug 'ybian/smartim' "ime
Plug 'dhruvasagar/vim-table-mode' 
Plug 'deton/jasegment.vim' "japanese text-object
Plug 'junegunn/vim-easy-align' 
Plug 'rhysd/clever-f.vim' "find jump
Plug 'itchyny/lightline.vim' "status bar
Plug 'tpope/vim-commentary' 
Plug 'rhysd/accelerated-jk'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'  "theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} "lsp lint  the extensions extension by nodejs
call plug#end()            " 必须
let g:smartim_default = 'com.apple.keylayout.ABC'
let g:input_toggle = 0
nmap <leader>cc :Commentary<cr>
vmap <leader>cc :Commentary<cr>
"easyalign
au FileType markdown vmap <Bslash><Bslash> :EasyAlign*<Bar><Enter>
"vim-hexo
"clever-f
let g:clever_f_use_migemo = 1 
"let g:clever_f_mark_direct = 1
let g:clever_f_show_prompt = 1
let g:clever_f_smart_case = 1
colorscheme gruvbox
inoremap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<C-y>"  : "\<c-e>" . '<CR>':  '<CR>'
"set background=light
"accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
"Far
let g:far#default_file_mask = '*'
"coc
let g:coc_global_extensions = [
      \'coc-html',
      \'coc-sh',
      \'coc-json',
      \'coc-vimlsp',
      \'coc-snippets',
      \'coc-lists',
      \'coc-actions',
      \'coc-diagnostic',
      \'coc-highlight',
      \'coc-explorer',
      \'coc-eslint',
      \'coc-pairs'
      \ ]
inoremap <silent><expr><TAB>
  \ pumvisible() ? "\<C-n>" :
  "\ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>":
  \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
"coc-snippets 
vmap <tab> <Plug>(coc-snippets-select)
command! SnipConfig :CocCommand snippets.editSnippets
command! SnipFile :CocCommand snippets.openSnippetFiles
"coc-explorer
nmap <leader>e :CocCommand explorer <CR>
"coclist
noremap <C-P> :CocList --ignore-case files <CR>
nnoremap tg :CocList outline <CR>
" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>
function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension',"-no-quit"]
  return join(list, "\n")
endfunction
" Keymapping for grep word under cursor with interactive mode
"nnoremap <silent> <Leader>f :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
noremap <leader>f :CocList grep <CR>
command! Mru :CocList --number-select mru
