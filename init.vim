let g:python3_host_prog  = '/usr/local/bin/python3'
let mapleader = ","
call plug#begin('~/.config/nvim/plugged')
Plug 'majutsushi/tagbar'
"let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
"let g:tagbar_ctags_bin='/usr/bin/ctags'  
"设置tagbar的窗口宽度  
let g:tagbar_width=30  
let g:tagbar_right=1  "设置tagbar的窗口显示的位置,为左边  
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
"let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }
Plug 'lvht/tagbar-markdown'
nnoremap <leader>t :TagbarToggle<CR>
Plug 'ybian/smartim' "切换输入法 
let g:smartim_default = 'com.apple.keylayout.ABC'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "自动补全提示
let g:deoplete#enable_at_startup = 1
Plug 'tpope/vim-repeat'
Plug 'rhysd/clever-f.vim'
" Plug 'tpope/vim-obsession' "保存退出前vim状态
Plug 'vim-airline/vim-airline' "tabbar
nmap 1<leader> <Plug>AirlineSelectTab1
nmap 2<leader> <Plug>AirlineSelectTab2
nmap 3<leader> <Plug>AirlineSelectTab3
nmap 4<leader> <Plug>AirlineSelectTab4
nmap 5<leader> <Plug>AirlineSelectTab5
nmap 5<leader> <Plug>AirlineSelectTab5
nmap 6<leader> <Plug>AirlineSelectTab5
nmap 7<leader> <Plug>AirlineSelectTab5
nmap 8<leader> <Plug>AirlineSelectTab5
nmap 9<leader> <Plug>AirlineSelectTab5
nmap 0<leader> <Plug>AirlineSelectTab5
nmap [b <Plug>AirlineSelectPrevTab
nmap ]b <Plug>AirlineSelectNextTab
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_extensions = ['tabline']
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline_theme='bubblegum' 
Plug 'jremmen/vim-ripgrep'
Plug 'Yggdroot/LeaderF'
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <leader>ff :Leaderf rg  --regexMode  --ignore-file .gitignore <CR> 
nnoremap <leader>F :Leaderf rg  --regexMode  --ignore-file .gitignore -e <CR>
nnoremap <leader>p :LeaderfFile<CR>
Plug 'haya14busa/vim-migemo'
Plug 'haya14busa/vim-easymotion'
map q <Plug>(easymotion-prefix)
let g:EasyMotion_use_migemo = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map ; <Plug>(easymotion-repeat)
call plug#end()            " 必须
"
" 改键mapList
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap Y y$
vnoremap < <gv
vnoremap > >gv
"set scrolloff=999 “typewriter mode
nnoremap <Tab> <C-w>
nnoremap <leader>q :x<cr>
nnoremap <leader>s :w<cr>
noremap cp yap<S-}>p
noremap <leader>a =ip
nmap <expr> <silent> <leader>d len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 ? ':bd<CR>' : ':bp<CR>:bd #<CR>'
"double !! to excute r!
inoremap <Up> <C-p> 
inoremap <Down> <C-n>  
inoremap ...  ……  
"cnoremap <C-p> <Up>
"cnoremap <C-n> <Down>

cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" 改变insert模式和normal模式的光标
if $TERM_PROGRAM =~ "iTerm" 
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif 
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin on
"
" netrw
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_wiw = 1 
let g:netrw_hide = 1
let g:netrw_menu = 0
let g:netrw_banner = 0
let g:netrw_browse_split = 0  " 0 关闭 4 预览  1水平 2 垂直
let g:netrw_altv = 1
"let g:netrw_chgwin = 2
let g:netrw_list_hide = '.*\.swp$'
let g:netrw_localrmdir = 'rm -rf'

nnoremap <leader>e :Lexplore <cr>
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl' "netrw 显示行号
set tags=./tags;,tags;
set wrap 
set ofu=syntaxcomplete#Complete " 自动补全代码
filetype off
syntax on
syntax enable
set nosplitright
set nosplitbelow
set nocompatible
set history=700
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
set clipboard=unnamed "剪切板设置
nnoremap	_d "_d
set tabstop=2  "tab缩进
set hidden
set autoindent " 开启自动缩进
set shiftwidth=2 " 自动缩进n个空格
set expandtab  "用space代替tab
set encoding=utf-8
set termencoding=utf-8
set nrformats= "转换为10进制
set fileencodings=ucs-bom,utf-8,cp936 "防windows 中文乱码
set wildmenu "补全提示
set wildmode=full "补全提示
set backspace=indent,eol,start "退格可换行
set undofile
set undodir=~/.vim/undo
lang zh_CN.UTF-8
:command Done 1,$/- [x] / m $
if has("autocmd")
  autocmd BufLeave,FocusLost *  silent! wall "自动保存
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif 
