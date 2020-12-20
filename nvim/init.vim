"  Auto load for first time uses
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
au! BufWritePost init.vim source %
autocmd BufNewFile *.py 0put =\"#!/usr/bin/python\<nl>\"|$
":command Done 1,$ /- [x] / m $
if has("autocmd")
  autocmd BufLeave,FocusLost *  silent! wall "自动保存
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
endif
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin on
filetype on
syntax on
syntax enable
set autoread "自动刷新文件
set tabstop=2  "tab缩进
set hidden "跳转文件时无需保存
set autoindent " 开启自动缩进
set shiftwidth=2 " 自动缩进n个空格
set expandtab  "用space代替tab
set encoding=utf-8  termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936 "防windows 中文乱码
set wildmenu  wildmode=full "补全提示
set backspace=indent,eol,start "退格可换行
set undofile  undodir=~/.vim/undo
set conceallevel=2
set ofu=syntaxcomplete#Complete " 自动补全代码
"set synmaxcol=1000
set infercase
set nosplitright nosplitbelow
set nocompatible
set history=200
set foldopen=hor
set path+=**
set timeoutlen=1000 ttimeoutlen=0
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
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏
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
set updatetime=200
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
" 改变insert模式和normal模式的光标
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
"mappings
let mapleader = ","
nmap [b :bnext<CR>
nmap @b :bprevious<CR>
nmap <leader>q :xa<CR>
nmap <RightMouse> :tag <CR>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <Down> <C-e>j
nnoremap <Up> <C-y>k
fun! Redraw()
  let l = winline()
  let cmd = l * 2 <= winheight(0) + 1 ? l <= (&so + 1) ? 'zb' : 'zt' : 'zz'
  return cmd
endf
"nnoremap <expr>zz Redraw()
noremap <leader>$  :e $MYVIMRC <CR> :sleep 100m <CR>:CocCommand explorer --width 30 --no-focus <CR>
vnoremap < <gv
vnoremap > >gv
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <leader>gc : !gcc % && ./a.out <CR>
nmap <expr> <silent> <leader>d len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 ? ':bd<CR>' : ':bp<CR>:bd #<CR>'

call plug#begin('~/.config/nvim/plugged')
"移动
" must after easymotion plugin
Plug 'junegunn/vim-easy-align'
Plug 'rhysd/clever-f.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim',{'on':'Goyo'}
Plug 'rhysd/accelerated-jk'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jianshanbushishan/vim-PYSearch',{'on':'PYSearch'}
Plug 'umrwifi/vim-hexo'
Plug 't184256/vim-boring'
Plug 'morhetz/gruvbox'
"语法补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'alvan/vim-closetag'
"Plug 'ferrine/md-img-paste.vim',{'for':['markdown','vim-plug']}
"Plug 'ap/vim-buftabline'
"Plug 'cohama/lexima.vim'
call plug#end()            " 必须
"easyalign
au FileType markdown vmap <Bslash><Bslash> :EasyAlign*<Bar><Enter>
"vim-hexo
let g:hexoRootPath='/Users/admin/hexo/'
"indent-guide
"let g:indent_guides_enable_on_vim_startup = 1
"clever-f
let g:clever_f_use_migemo = 1 
let g:clever_f_mark_direct = 1
let g:clever_f_show_prompt = 1
"colorscheme
function! s:SetHighlightings()
    highlight Pmenu guibg=gray guifg=white
    hi PmenuSel guibg=#6B8E30  guifg=white
    hi default link BufTabLineActive  TabLine
    highlight LineNr guifg=#72787e
endfunction
"autocmd ColorScheme * call s:SetHighlightings()
colorscheme gruvbox
inoremap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<C-y>"  : "\<c-e>" . '<CR>':  '<CR>'
"set background=light
"lexima
"map放在最上面声明
"inoremap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
"                 \ "\<C-y>"  : "\<c-e>" . lexima#expand('<CR>', 'i') :  lexima#expand('<CR>', 'i')
"call lexima#add_rule({'char': '<', 'input_after': '>', 'filetype': 'markdown'})
"call lexima#add_rule({'char': '>', 'at': '\%#>', 'leave': 1, 'filetype': 'markdown'})
"call lexima#add_rule({'char': '<BS>', 'at': '\%#>', 'delete': 1, 'filetype': 'markdown'})
"call lexima#add_rule({'char': '<CR>' , 'at': '\%#>', 'input': '<CR>','input_after':'<CR>', 'filetype': 'markdown'})

"buftabline
let g:buftabline_show = 2
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
let g:buftabline_separators = 0
nmap 1<leader> <Plug>BufTabLine.Go(1)
"accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
"Far
let g:far#default_file_mask = '*'
"coc
let g:coc_global_extensions = ['coc-html','coc-sh','coc-translator','coc-explorer','coc-imselect', 'coc-tasks',  'coc-highlight',  'coc-json',  'coc-vimlsp',  'coc-snippets',  'coc-lists' ,  'coc-markdownlint',  'coc-actions',  ]
inoremap <silent><expr> <TAB>
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
"coc-translator
nmap ts <Plug>(coc-translator-p)
vmap ts <Plug>(coc-translator-pv)
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
noremap <C-P> :CocList --number-select --ignore-case files <CR>
noremap <leader><C-P> :CocList --number-select --ignore-case <CR> 
nnoremap <leader>tg :CocList --auto-preview outline <CR>
noremap <leader>f :CocList  grep <CR>

"surround
map S <Nop>
vmap  S"  s""<LEFT><C-r>"<ESC>
vmap  S'  s''<LEFT><C-r>"<ESC>
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
nmap  dt  dit"_datP
nmap  d(  di("_datP
nmap  d<  di("_datP
nmap  d{  di{"_datP

"markdown
autocmd BufNewFile *.md call HexoTitle()
au FileType markdown nmap <leader>p  :!open -a "Microsoft Edge" %:p  <cr>
"quick look
nmap gp :!killall qlmanage <cr> :!qlmanage -p %:p  &> /dev/null & <cr>  
autocmd BufRead *.md !open -a "Microsoft Edge" %:p & >/dev/null &
function! HexoTitle()
  if getline(1)==""
      call setline(1,"---")
      call setline(2,"title: ".expand('%:r'))
      call setline(3,"date:" .strftime("%F")."")
      call setline(4,"tags: ")
      call setline(5,"---")
      exe  "normal G"
    endif
endfunction
command! Sum :r!awk -F '|' '{print; sum+=$4}; END {print "Total: "sum}'
"inoremap <silent><expr> <c-q> coc#refresh()
" PYsearch
let g:PYSearchOnlyChinese = 0
map ? :PYSearch <cr>
