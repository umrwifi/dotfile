let mapleader = ","
let localleader="\\"
set nocompatible              " 去除VI一致性,必须要添加
set backspace=2
  :command Done %/-[x]/ m $
" 改键mapList
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
"noremap Y y$
"vnoremap < <gv
"vnoremap > >gv
"noremap gV `[v`]
nnoremap <Leader>b :ls<CR>:b<Space>
nmap [b :bp <CR>
nmap ]b :bn <CR>
nnoremap <Tab> <C-w>
"set scrolloff=999 “typewriter mode
vnoremap <leader>gr :<CR>  " run the command with select text
nnoremap <leader>gr :<CR>  "run the current line command
" nmap  <silent> <leader>d  :bd <CR>
nmap <expr> <silent> <leader>d len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 ? ':bd<CR>' : ':bp<CR>:bd #<CR>'
"double !! to excute r!
nnoremap <leader>: :!<Space>
" 标点符号简化
" 标准省略号
inoremap <Up> <C-p>
inoremap <Down> <C-n>
inoremap ...  ……  
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin on
set tags=./tags;,tags;
set wrap 
set ofu=syntaxcomplete#Complete " 自动补全代码
filetype off
syntax on
syntax enable
set noesckeys
set nosplitright
set nosplitbelow
set history=700
set relativenumber
set foldopen=hor
set path+=** 
set timeoutlen=1000 ttimeoutlen=100
set mouse=a
set noswapfile
set showcmd
set showmatch
set laststatus=2
set cursorline
set ruler
set number  "行号  
set incsearch  "输入搜索内容时就显示搜索结果
set backupcopy=yes 
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏
"set foldmethod=syntax
set foldmethod=manual
set foldlevelstart=1
"color solarized
"color slate
"set autowriteall
" check one time after 4s of inactivity in normal mode
set autoread
au FocusGained,BufEnter * :checktime
"set foldclose=all          " 设置为自动关闭折叠                
set clipboard=unnamed "剪切板设置
nnoremap <leader>sc	:w<CR>:source ~/.vimrc<CR>
nnoremap	_d "_d
inoremap <Esc> <Esc>:w<CR>
set tabstop=2  "tab缩进
set hidden
set autoindent " 开启自动缩进
set shiftwidth=2 " 自动缩进n个空格
set expandtab  "用space代替tab
set encoding=utf-8
set nrformats= "转换为10进制
set fileencodings=ucs-bom,utf-8,cp936 "防windows 中文乱码
set wildmenu "补全提示
set wildmode=full "补全提示
set backspace=indent,eol,start 
set undofile
set undodir=~/.vim/undo
"set suffixesadd+=.md
"autocmd setting
function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction
if has("autocmd")
  au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
  au BufEnter *.md setlocal foldmethod=expr  
:autocmd FileType html,wxml setlocal foldmethod=marker
autocmd BufLeave,FocusLost *  silent! wall
autocmd CursorHold * update
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
