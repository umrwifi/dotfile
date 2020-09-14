"  Auto load for first time uses
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
set conceallevel=2
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"function! s:SetHighlightings()
"  highlight Pmenu ctermbg=Gray ctermfg=White
"  highlight PmenuSel ctermbg=Green ctermfg=White
"  highlight Pmenu guibg=#333333 guifg=White 
"  highlight PmenuSel guibg=#6B8E30 guifg=White 
"endfunction
"autocmd ColorScheme * call <SID>SetHighlightings()
 "lang zh_CN.UTF-8
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
"set nosplitright set nosplitbelow
set nocompatible
set history=700
set foldopen=hor
set path+=** 
set timeoutlen=1000 ttimeoutlen=0
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
"markdown
function! ToggleCheck()
  if(match(getline('.'),'\[x\]') != -1) 
	  exe '. s/\[x\]/\[\ \]/g'
	  exe 'let @/="" ' 
   elseif(match(getline('.'),'\[.\]') != -1)
	  exe '. s/\[.\]/\[x\]/g'
	  exe 'let @/="" '
  endif
endfunction
autocmd FileType markdown nnoremap <localleader>d :call ToggleCheck() <CR>
autocmd FileType markdown vnoremap <localleader>d :'<,'> s/\[.\]/\[x\]/g <CR>
"change the list to checkbox
autocmd FileType markdown nnoremap <localleader>td :. s/-/-\ \[\ \]/g <CR> :let @/=""<CR>  
autocmd FileType markdown vnoremap <localleader>td :'<,'> s/-/-\ \[\ \]/g <CR> :let @/=""<CR>
fun! Redraw()
let l = winline()
let cmd = l * 2 <= winheight(0) + 1 ? l <= (&so + 1) ? 'zb' : 'zt' : 'zz'
return cmd
endf
nnoremap <expr>zz Redraw()
"删除所有行末的空格
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
"noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
"noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
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
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <leader>ww  :tabedit  ~/iCloud/wiki/todo.md <CR> :cd %% <CR>
" statusline
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
set statusline=
set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
"set statusline+=%m\ ”不知为何显示为\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
" === Plug List
 call plug#begin('~/.config/nvim/plugged')
Plug 'cocopon/iceberg.vim'
Plug 'rhysd/vim-gfm-syntax',{'for':['markdown','vim-plug']}
Plug 'Konfekt/FastFold'
Plug 'rhysd/accelerated-jk'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'],'on' : 'MarkdownPreviewToggle'}
Plug 'liuchengxu/vista.vim',{'on':'Vista!!'}
Plug 'brooth/far.vim',{'on':'Farf'}
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'majutsushi/tagbar',{'on':'Tagbar'}
Plug 'ferrine/md-img-paste.vim',{'for':['markdown','vim-plug']}
Plug 'tpope/vim-surround'
Plug 'ap/vim-buftabline'
"Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'plasticboy/vim-markdown',{'for':['markdown','vim-plug']}
Plug 'ybian/smartim',{'for':['markdown','vim-plug']}
Plug 'tpope/vim-repeat'
Plug 'rhysd/clever-f.vim' 
call plug#end()            " 必须 
"buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
let g:buftabline_separators = 0
 nmap <leader>1 <Plug>BufTabLine.Go(1)
        nmap <leader>2 <Plug>BufTabLine.Go(2)
        nmap <leader>3 <Plug>BufTabLine.Go(3)
        nmap <leader>4 <Plug>BufTabLine.Go(4)
        nmap <leader>5 <Plug>BufTabLine.Go(5)
        nmap <leader>6 <Plug>BufTabLine.Go(6)
"colorscheme
colorscheme iceberg
"fast folding
let g:markdown_folding = 1
let g:tex_fold_enabled = 0
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:r_syntax_folding = 1
let g:php_folding = 1
"accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
"auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutToggle = '' 
let g:AutoPairsShortcutBackInsert = '<C-B>'
let g:AutoPairsMapCh = 0
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
"Far
"let g:far#file_mask_favorites
let g:far#default_file_mask = '*' 
nnoremap tg :Vista!!<CR>
nnoremap <silent> <leader>f  :Farf<cr>
vnoremap <silent> <leader>f  :Farf<cr>
nnoremap <silent> <leader>r  :Farr<cr>
vnoremap <silent> <leader>r  :Farr<cr>
"tagbar
function! TagbarRedraw()
	if(winwidth(0)>80)
		exe 'let g:tagbar_position="botright vertical"'
	else
		exe 'let g:tagbar_position="topleft"'
endif
endfunction
function! AutoOutline()
				if(winwidth(0)>65&&line('$')>150)
								exe 'Tagbar'
				endif
endfunction
"autocmd VimResized * call TagbarRedraw()
autocmd BufRead *.md  call AutoOutline()
autocmd FileType markdown nnoremap tg :Tagbar<CR>
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                        \ 'h:sections',
                        \ 't:todo',
                        \ 't:done',
        \ ],
    \ 'sort' : 0
    \ }
let g:tagbar_show_linenumbers = -1
let g:tagbar_singleclick = 1
let g:tagbar_autofocus = 0
let g:tagbar_width = 30
let g:tagbar_indent = 0
let g:tagbar_autopreview = 0
let g:tagbar_iconchars = ['+', '-']  
let g:tagbar_compact = 1
let g:tagbar_previewwin_pos = "botright"
autocmd BufWinEnter * if &previewwindow | setlocal nonumber  endif

"defx
call defx#custom#option('_', { 
	\ 'winwidth': 30, 
	\ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
nnoremap tt :Defx <CR>
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
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> l
  nnoremap <silent><buffer><expr> E
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
        \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns',
        \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
        \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
        \ defx#do_action('change_vim_cwd')
endfunction
    "coc
let g:coc_global_extensions = [  'coc-tasks',  'coc-highlight',  'coc-prettier',  'coc-json',  'coc-vimlsp',  'coc-snippets',  'coc-lists' ,  'coc-markdownlint',  'coc-actions',  ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd FileType markdown command! -nargs=0 Fix :CocCommand markdownlint.fixAll
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
"coc snippets
autocmd FileType markdown inoremap <silent><expr> <TAB>
												\ pumvisible() ? coc#_select_confirm() :
												\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
												\ <SID>check_back_space() ? "\<TAB>" :
												\ coc#refresh()

"let g:coc_snippet_next = '<tab>'"coclist
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
nmap ]b :bnext<CR>
nmap [b :bprevious<CR>
let g:tmux_navigator_no_mappings = 1
nnoremap <C-h> :TmuxNavigateLeft<cr>
nnoremap <C-j> :TmuxNavigateDown<cr>
nnoremap <C-k> :TmuxNavigateUp<cr>
nnoremap <C-l> :TmuxNavigateRight<cr>
 "nnoremap <silent> <A-p>ng} :TmuxNavigatePrevious<cr>
 " plasticboy vim-markdown
let g:vim_markdown_folding_disable = 1
let g:vim_markdown_folding_level = 4
let g:vim_markdown_conceal = 1
let g:vim_markdown_autowrite = 0
"source ~/md-snippets.vim
let g:smartim_default = 'com.apple.keylayout.ABC'
