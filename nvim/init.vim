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
"自动刷新文件
set autoread 
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif
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
"set cursorline
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
set lazyredraw            " improve scrolling performanc
set regexpengine=1        " use old regexp engine
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
"surround
map S <Nop>
vmap  S"  s""<LEFT><C-r>"<ESC>
vmap  S'  s''<LEFT><C-r>"<ESC>
vmap  S`  s``<LEFT><C-r>"<ESC>
vmap  S(  s()<LEFT><C-r>"<ESC>
vmap  S{  s{}<LEFT><C-r>"<ESC>
vmap  S}} s{{}}<LEFT><LEFT><C-r>"<ESC>
vmap  S{% s{%%}<LEFT><LEFT><C-r>"<ESC>
vmap  S> s<><LEFT><C-r>"<ESC>
vmap  S[  s[]<LEFT><C-r>"<ESC>
vmap  S]]  s[[]]<LEFT><LEFT><C-r>"<ESC>
"delete surround
nmap  d'  di'"_da'P
nmap  d"  di""_da"P
nmap  d`  di``_da`P
nmap  dt  dit"_datP
nmap  d(  di("_datP
nmap  d<  di("_datP
nmap  d{  di{"_datP
nmap  d[  di["_datP
nmap  d(  di("_datP
"text-object
"file
omap ae :<c-u>normal! mzggVG<cr>`z
omap ie :<c-u>normal! mzggVG<cr>`z
vmap ae :<c-u>normal! mzggVG<cr> 
vmap ie :<c-u>normal! mzggVG<cr>
"fold
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
"auto pair
function! IsCharsBetween()
  if getline('.')[col('.')] =~'[0-9A-Za-z_]'
    return 1
  endif
  if getline('.')[col('.') -2 ] =~'[0-9A-Za-z_]'
    return 1
  endif
 return 0
endfunction
"inoremap {<cr>  {}<left><cr><C-o>O<TAB>
"inoremap <expr> <silent>' IsCharsBetween()==0 ? "\'\'\<left>" : "\'"
"inoremap <expr> <silent>( IsCharsBetween()==0 ? "\(\)\<left>" : "\("
" inoremap <expr> <silent>{ IsCharsBetween()==0 ? "\{\}\<left>" : "\{"
command! CountMatch :%s///gn
call plug#begin('~/.config/nvim/plugged')
" https://github.com/tpope/vim-dadbod
Plug 'mattn/calendar-vim'
Plug 'jceb/vim-orgmode'
Plug 'ybian/smartim' "ime
Plug 'tpope/vim-fugitive' "git
Plug 'dhruvasagar/vim-table-mode' 
"Plug 'deton/jasegment.vim' "japanese text-object
Plug 'junegunn/vim-easy-align' 
Plug 'rhysd/clever-f.vim' "find jump
Plug 'itchyny/lightline.vim' "status bar
Plug 'tpope/vim-commentary' 
Plug 'rhysd/accelerated-jk'
Plug 'christoomey/vim-tmux-navigator'
Plug 'umrwifi/vim-hexo'
Plug 'mhinz/vim-startify' "mru
Plug 'morhetz/gruvbox'  "theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} "lsp lint  the extensions extension by nodejs
"Plug 'cohama/lexima.vim'
call plug#end()            " 必须
let g:org_agenda_files=[ '~/Documents/todo/inbox.org', '~/Documents/todo/bangumi.org' ]
let g:EasyMotion_use_migemo = 1
let g:smartim_default = 'com.apple.keylayout.ABC'
let g:input_toggle = 0
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("skhd -k  0x66")
   endif
endfunction
nmap <leader>cc :Commentary<cr>
vmap <leader>cc :Commentary<cr>
"easyalign
au FileType markdown vmap <Bslash><Bslash> :EasyAlign*<Bar><Enter>
"vim-hexo
let g:hexoRootPath='/Users/admin/hexo/'
"indent-guide
"let g:indent_guides_enable_on_vim_startup = 1
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
      \'coc-eslint',
      \'coc-diagnostic',
      \'coc-highlight',
      \'coc-explorer',
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
nmap <silent> @d <Plug>(coc-diagnostic-prev)
nmap <silent> [d <Plug>(coc-diagnostic-next)
"coc-snippets 
vmap <tab> <Plug>(coc-snippets-select)
command! SnipConfig :CocCommand snippets.editSnippets
command! SnipFile :CocCommand snippets.openSnippetFiles
"coc-explorer
nmap <leader>e :CocCommand explorer --width 30 <CR>
let g:path =""
function! Explorer_preview()
"TODO 判断他在buffer列表中
if (g:path!='')
exe "wincmd w"
if(len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1)
silent! exe "bd" .g:path
else
exe "bp"
silent! exe "bd" .g:path
endif
exe "wincmd p"
endif
let g:path = CocAction('runCommand','explorer.getNodeInfo',0 ).fullpath
call CocAction('runCommand', 'explorer.doAction', 0, ['expandable?', 'expand', 'open'])
"exe "vs ". g:path
endfunction
function! Explorerinit()
  nnoremap <buffer><CR> :call Explorer_preview()<CR>
  nnoremap <buffer>q :bd <CR>
  set winblend=50
endfunction
autocmd FileType coc-explorer call Explorerinit()
autocmd InsertEnter let g:path=""
"coclist
noremap <C-P> :CocList --ignore-case files <CR>
noremap <C-c>c :CocList  --ignore-case <CR> 
nnoremap tg :CocList outline <CR>
noremap <leader>f :CocList  grep <CR>
command! Mru :CocList --number-select mru
