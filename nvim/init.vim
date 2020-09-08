" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
"color desert
function! s:SetHighlightings()
  highlight Pmenu ctermbg=Gray ctermfg=White
  highlight PmenuSel ctermbg=Green ctermfg=White
  highlight Pmenu guibg=#333333 guifg=White 
  highlight PmenuSel guibg=#6B8E30 guifg=White 
endfunction
call s:SetHighlightings()
"autocmd ColorScheme * call <SID>SetHighlightings()

 lang zh_CN.UTF-8
 ":command Done 1,$/- [x] / m $
 if has("autocmd")
   "autocmd BufLeave,FocusLost *  silent! wall "自动保存
   autocmd FocusLost *  silent! wall "自动保存
   "au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
 endif  
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin on
set tags=./tags;,tags;
set ofu=syntaxcomplete#Complete " 自动补全代码
filetype on
syntax on
syntax enable
set infercase
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
set relativenumber  "相对行号  
set number "绝对行号，与相对行号同时生效时只显示当前行的绝对行号
set incsearch  "输入搜索内容时就显示搜索结果
set backupcopy=yes 
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏
set foldmethod=manual
set foldlevelstart=4
set clipboard=unnamed "剪切板设置
set termguicolors
let g:python3_host_skip_check=1
let g:python3_host_prog  = '/usr/local/bin/python3'
let mapleader = ","
set updatetime=100
set lazyredraw            " improve scrolling performanc
set regexpengine=1        " use old regexp engine
if has("patch-8.1.1564")
        " Recently vim can merge signcolumn and number       column into one
set signcolumn=number
else
set signcolumn=yes
endif
set wildignore+=.git*
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
"let maplocalleader = "<CR>"
 " === Plug List
 call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'liuchengxu/vista.vim'
Plug 'rhysd/vim-gfm-syntax'
Plug 'brooth/far.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'majutsushi/tagbar',{'on':'Tagbar'}
Plug 'ferrine/md-img-paste.vim',{'for':['markdown','vim-plug']}
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'plasticboy/vim-markdown',{'for':['markdown','vim-plug']}
Plug 'ybian/smartim',{'for':['markdown','vim-plug']}
Plug 'tpope/vim-repeat'
Plug 'rhysd/clever-f.vim'
"Plug 'tpope/vim-obsession' "保存退出前vim状态
call plug#end()            " 必须 :cd <CR>
" markdown-preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 1
nmap <leader><C-p> <Plug>MarkdownPreviewToggle
"let g:vista_sidebar_position = ' topleft'
" 启用悬浮窗预览
"let g:vista_echo_cursor_strategy ='floating_win'
" 侧边栏宽度.
let g:vista_sidebar_width = 30
" 设置为0，以禁用光标移动时的回显.
let g:vista_echo_cursor = 1
" 当前游标上显示详细符号信息的时间延迟.
let g:vista_cursor_delay = 400
" 跳转到一个符号时，自动关闭vista窗口.
let g:vista_close_on_jump = 0
"打开vista窗口后移动到它.
let g:vista_stay_on_open = 1
" 跳转到标记后闪烁光标2次，间隔100ms.
let g:vista_blink = [2, 100]
" 图标美化
" 优先选择lsp作为标签来源，其次ctags
let g:vista_default_executive = 'coc'
let g:vista_echo_cursor_strategy = 'scroll'
nnoremap <leader>t :Vista <cr>
nnoremap <silent> <leader>f  :Farf<cr>
vnoremap <silent> <leader>f  :Farf<cr>
nnoremap <silent> <leader>r  :Farr<cr>
vnoremap <silent> <leader>r  :Farr<cr>
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
	\ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
    \ }
"defx
nmap <leader>e :Defx <CR>
nnoremap <silent> <LocalLeader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()` <CR> 
autocmd BufWritePost * call defx#redraw()
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
	" Define mappings
	nnoremap <silent><buffer><expr> <CR>
				\ defx#is_directory() ? 
				\ defx#do_action('open_tree') : 
				\ defx#do_action('multi', ['drop'])
	nnoremap <silent><buffer><expr> c
				\ defx#do_action('copy')
	nnoremap <silent><buffer><expr> m
				\ defx#do_action('move')
	nnoremap <silent><buffer><expr> p
				\ defx#do_action('paste')
	nnoremap <silent><buffer><expr> i
				\ defx#do_action('multi', ['drop'])
	nnoremap <silent><buffer><expr> c
				\ defx#do_action('copy')
	nnoremap <silent><buffer><expr> m
				\ defx#do_action('move')
	nnoremap <silent><buffer><expr> p
				\ defx#do_action('paste')
	nnoremap <silent><buffer><expr> i
				\ defx#do_action('multi',[['drop','split']])
	nnoremap <silent><buffer><expr> <C-g>
				\ defx#do_action('print')
	nnoremap <silent><buffer><expr> d
				\ defx#do_action('remove')
	nnoremap <silent><buffer><expr> r
				\ defx#do_action('rename')
	nnoremap <silent><buffer><expr> o
				\ defx#is_directory() ? 
				\ defx#do_action('open_or_close_tree') : 
				\ defx#do_action('multi', ['drop'])
	nnoremap <silent><buffer><expr> l
				\ defx#is_directory() ? 
				\ defx#do_action('open_tree') : 
				\ defx#do_action('multi', ['drop'])
	nnoremap <silent><buffer><expr> P
	                \ defx#do_action('open', 'pedit')
	nnoremap <silent><buffer><expr> p
	                \ defx#do_action('preview')
endfunction
    "coc
    let g:coc_global_extensions = ['coc-json','coc-vimlsp','coc-snippets','coc-lists','coc-markdownlint']
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    function! s:check_back_space() abort
              let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~# '\      s'
        endfunction
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>      "
    "回车确认补全
if exists('*complete_info')
	  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
	    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif
"coclist
noremap <C-p> :CocList files <CR>
 "far
    nnoremap <silent> <leader>f  :Farf<cr>
    vnoremap <silent> <leader>f  :Farf<cr>
    nnoremap <silent> <leader>r  :Farr<cr>
    vnoremap <silent> <leader>r  :Farr<cr>
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
 let g:airline#extensions#tabline#alt_sep = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
nmap 1<leader> <Plug>AirlineSelectTab1
nmap 2<leader> <Plug>AirlineSelectTab2
nmap 3<leader> <Plug>AirlineSelectTab3
nmap 4<leader> <Plug>AirlineSelectTab4
nmap 5<leader> <Plug>AirlineSelectTab5
nmap ]b :bnext<CR>
nmap [b :bprevious<CR>
let g:tmux_navigator_no_mappings = 1
nnoremap <C-h> :TmuxNavigateLeft<cr>
nnoremap <C-j> :TmuxNavigateDown<cr>
nnoremap <C-k> :TmuxNavigateUp<cr>
nnoremap <C-l> :TmuxNavigateRight<cr>
 "nnoremap <silent> <A-p>ng} :TmuxNavigatePrevious<cr>
let g:vim_markdown_folding_disable = 1
let g:vim_markdown_folding_level = 4
let g:vim_markdown_conceal = 1
let g:vim_markdown_autowrite = 0
"source ~/md-snippets.vim
let g:smartim_default = 'com.apple.keylayout.ABC'
nnoremap <Leader>b :ls<CR>:b<Space>
nmap <leader>f :vimgrep //**<left><left><left>
vmap <leader>f :vimgrep /<C-R><C-W>/ *<CR>
nmap cp :cp <CR>
nmap cn :cn <CR>
nmap co :copen <CR>
 nmap <leader>ww  :tabedit  ~/iCloud/wiki/todo.md <CR> :cd %% <CR>
call defx#custom#option('_', { 
	\ 'winwidth': 30, 
	\ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
" end
" 改键mapping List
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <leader>R  :wa <CR> :source ~/.config/nvim/init.vim <CR>
noremap ,,  :e ~/.config/nvim/init.vim <CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>! : !gcc % && ./a.out <CR>
autocmd Filetype markdown nnoremap <buffer> <leader>! ?```<CR> jV  /```<CR> ky  :!pbpaste>a.c && gcc a.c && ./a.out <CR>
"set scrolloff=999 "typewriter mode
nmap <expr> <silent> <leader>d len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 ? ':bd<CR>' : ':bp<CR>:bd #<CR>'
 "double !! to excute r!
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
nnoremap	_d "_d
