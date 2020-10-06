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
"自动刷新文件
set autoread
set tabstop=2  "tab缩进
set hidden
set autoindent " 开启自动缩进
set shiftwidth=2 " 自动缩进n个空格
set expandtab  "用space代替tab
set encoding=utf-8
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936 "防windows 中文乱码
set wildmenu "补全提示
set wildmode=full "补全提示
set backspace=indent,eol,start "退格可换行
set undofile
set undodir=~/.vim/undo
set conceallevel=2
set ofu=syntaxcomplete#Complete " 自动补全代码
"set synmaxcol=1000
filetype on
syntax on
syntax enable
set infercase
"set nosplitright
"set nosplitbelow
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
set relativenumber  "相对行号
set number "绝对行号，与相对行号同时生效时只显示当前行的绝对行号
set incsearch  "输入搜索内容时就显示搜索结果
set backupcopy=yes
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏
set foldmethod=manual
function! MyFoldText()
    let nblines = v:foldend - v:foldstart + 1
    let w = winwidth(0) - &foldcolumn - (&number ? 5 : 0)
    let line = getline(v:foldstart)
    let comment = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
    let expansionString = repeat(' ', w - strwidth(nblines.comment.'#'))
    let txt = comment . expansionString . nblines
    return txt
endfunction
set foldtext=MyFoldText()
set foldlevelstart=99
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
let g:python3_host_skip_check=1
let g:python3_host_prog  = '/usr/local/bin/python3'
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
"mappings
let mapleader = ","
nmap ]b :bnext<CR>
nmap [b :bprevious<CR>
nmap <leader>q :xa<CR>
vnoremap gy y']
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
nnoremap	_d "_d
nnoremap <leader>b :ls<CR>: bd<C-B>
nnoremap <leader>ww :tabedit  ~/Documents/wiki/index.md <CR> :cd '%:h' <CR>
nmap gtd :e ~/Documents/wiki/dpca/todo.md<CR>
fun! Redraw()
  let l = winline()
  let cmd = l * 2 <= winheight(0) + 1 ? l <= (&so + 1) ? 'zb' : 'zt' : 'zz'
  return cmd
endf
nnoremap <expr>H Redraw()
noremap ,,  :e ~/.config/nvim/init.vim <CR>
vnoremap < <gv
vnoremap > >gv
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <leader>! : !gcc % && ./a.out <CR>
nmap <expr> <silent> <leader>d len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 ? ':bd<CR>' : ':bp<CR>:bd #<CR>'
"markdown
autocmd BufNewFile *.md call HexoTitle()
function! HexoTitle()
      call append(0,"---")
      call append(1,"title: ".expand('%:r'))
      call append(2,"date: ")
      call append(3,"tags: ")
      call append(4,"---")
endfunction
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
autocmd FileType markdown vnoremap <localleader>d : s/\[.\]/\[x\]/g <CR>
autocmd FileType markdown nnoremap <localleader>td :. s/-/-\ \[\ \]/g <CR> " change the list to checkbox
autocmd FileType markdown vnoremap <localleader>td : s/-/-\ \[\ \]/g <CR>
autocmd FileType markdown nnoremap ]] /^#\+\s<CR> :let @/ = ""<CR>^zz
autocmd FileType markdown nnoremap [[ ?^#\+\s<CR> :let @/ = ""<CR>^zz
autocmd FileType markdown vnoremap ]] /^#\+\s<CR>
autocmd FileType markdown vnoremap [[ ?^#\+\s<CR>
"autocmd FileType markdown vnoremap ]] : s/^#\{1,5\}\s/#&/g <CR> :let @/ = ""<CR>
"autocmd FileType markdown vnoremap [[ : s/^##/#/g <CR> :let @/ = ""<CR>
autocmd Filetype markdown nnoremap <buffer> <leader>! ?```<CR> jV  /```<CR> ky  :!pbpaste>a.c && gcc a.c && ./a.out <CR>
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
       " match - / - [ ] but not - [x] 
       if getline(v:lnum) =~ '^- \(\[x]\)\@!.*$'
           return ">7"
       endif
       if getline(v:lnum) =~ '^- \[x\] .*$'
           return ">7"
       endif
       " 如果是缩进列表
       if getline(v:lnum) =~ '^\s\+- .*$'
           return ">8"
       endif
       return "=" 
endfunction
au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr
autocmd BufWritePost *.md mkview
autocmd BufEnter *.md silent! loadview
" statusline
call plug#begin('~/.config/nvim/plugged')
Plug 'cocopon/iceberg.vim'
Plug 'freitass/todo.txt-vim'
Plug 'w0ng/vim-hybrid'
Plug 'rhysd/vim-gfm-syntax'
Plug 'Konfekt/FastFold',{'for':['markdown']}
Plug 'rhysd/accelerated-jk'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'],'on' : 'MarkdownPreviewToggle'}
Plug 'brooth/far.vim',{'on':'Farf'}
Plug 'preservim/tagbar',{'on':['Tagbar','TagbarOpen']}
Plug 'ferrine/md-img-paste.vim',{'for':['markdown','vim-plug']}
Plug 'tpope/vim-surround'
Plug 'ap/vim-buftabline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-repeat'
Plug 'rhysd/clever-f.vim'
Plug 'cohama/lexima.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'terryma/vim-expand-region'  "扩大选中范围
"Plug 'preservim/nerdcommenter'
call plug#end()            " 必须
"indent-guide
"let g:indent_guides_enable_on_vim_startup = 1
"clever-f
let g:clever_f_use_migemo=1
"colorscheme
function! s:SetHighlightings()
    "highlight Pmenu guibg=gray guifg=white
    "hi PmenuSel guibg=#6B8E30  guifg=white
    "hi default link BufTabLineActive  TabLine
endfunction
autocmd ColorScheme * call s:SetHighlightings()
colorscheme hybrid
"set background=light
"lexima
"map放在最上面声明
inoremap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<C-y>"  : "\<c-e>" . lexima#expand('<CR>', 'i') :  lexima#expand('<CR>', 'i')
call lexima#add_rule({'char': '<', 'input_after': '>', 'filetype': 'markdown'})
call lexima#add_rule({'char': '>', 'at': '\%#>', 'leave': 1, 'filetype': 'markdown'})
call lexima#add_rule({'char': '<BS>', 'at': '\%#>', 'delete': 1, 'filetype': 'markdown'})
call lexima#add_rule({'char': '<CR>' , 'at': '\%#>', 'input': '<CR>','input_after':'<CR>', 'filetype': 'markdown'})
"buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
let g:buftabline_separators = 0
nmap 1<leader> <Plug>BufTabLine.Go(1)
nmap 2<leader> <Plug>BufTabLine.Go(2)
nmap 3<leader> <Plug>BufTabLine.Go(3)
nmap 4<leader> <Plug>BufTabLine.Go(4)
nmap 5<leader> <Plug>BufTabLine.Go(5)
nmap 6<leader> <Plug>BufTabLine.Go(6)
"fast folding
let g:markdown_folding = 0
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
" markdown-preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 1
nmap <localleader><C-p> <Plug>MarkdownPreviewToggle
"Far
let g:far#default_file_mask = '*'
nnoremap <silent> <leader>f  :Farf<cr>
vnoremap <silent> <leader>f  :Farf<cr>
nnoremap <silent> <leader>r  :Farr<cr>
vnoremap <silent> <leader>r  :Farr<cr>
"tagbar
nnoremap tg :TagbarOpen f <CR>
function! AutoOutline()
  if(winwidth(0)>40&&line('$')>150)
    exe 'Tagbar'
  endif
endfunction
"autocmd BufRead *.md  call AutoOutline()
let g:tagbar_map_previewwin='gp'
let g:tagbar_map_nexttag = "\]\]"
let g:tagbar_map_prevtag = "\[\["
let g:tagbar_map_togglefold = "l"
let g:tagbar_show_linenumbers = 2
let g:tagbar_singleclick = 1
let g:tagbar_autofocus = 0
let g:tagbar_width = 30
let g:tagbar_indent = 0
let g:tagbar_autopreview = 0
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_compact = 1
let g:tagbar_previewwin_pos = "belowright"
autocmd Filetype tagbar nmap <buffer><expr>k IsPwinOpen()==1? 'kgp':'<Plug>(accelerated_jk_gk)'
autocmd Filetype tagbar nmap <buffer><expr>j IsPwinOpen()==1? 'jgp':'<Plug>(accelerated_jk_gj)'
autocmd Filetype tagbar nmap <buffer><expr>P IsPwinOpen()==1? ':pclose<CR>':':call TagbarWinPreview()<CR>'
autocmd Filetype tagbar nmap <buffer><expr><ESC> IsPwinOpen()==1? ':pclose<CR>':'<ESC>'
"autocmd CursorHold __Tagbar__* ++nested exe 'normal gp'
function! IsPwinOpen()
  for win in range(1, winnr('$'))
    if getwinvar(win, '&previewwindow')
        return 1
      break
    endif
endfor
	return 0
endf
function! TagbarWinPreview()
let fileinfo = tagbar#state#get_current_file(0)
if empty(fileinfo)
  return {}
endif
if !has_key(fileinfo.tline,line('.'))
  return {}
endif
let taginfo= fileinfo.tline[line('.')]
let cmd=taginfo.getPrototype(0)
let cmd=split(cmd,'=')[0]
let pattern = escape(cmd,'\*')
echo pattern
exe 'wincmd p'
"TODO 缩小定位范围
exe '% psearch!/'. pattern .'/ '
exe 'wincmd l'
"TODO 让他准确的回到tagbar窗口
endfunction
let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
  \ 'h:sections',
  \ ],
  \ 'sort' : 0,
  \ 'excmd' : 'number'
  \ }
"coc
let g:coc_global_extensions = [ 'coc-sh','coc-translator','coc-explorer','coc-imselect', 'coc-tasks',  'coc-highlight',  'coc-prettier',  'coc-json',  'coc-vimlsp',  'coc-snippets',  'coc-lists' ,  'coc-markdownlint',  'coc-actions',  ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile
autocmd FileType markdown command! -nargs=0 Fix :CocCommand markdownlint.fixAll
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
vmap <tab> <Plug>(coc-snippets-select)
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
endfunction
autocmd FileType coc-explorer call Explorerinit()
autocmd InsertEnter let g:path=""
"coclist
noremap <C-P> :CocList --number-select --auto-preview --ignore-case files<CR>
noremap <leader><C-P> :CocList --number-select --ignore-case 
nnoremap <leader>tg :CocList --auto-preview outline <CR>
"far
let g:far#default_file_mask = '*'
nnoremap <silent> <leader>f  :Farf<cr>
vnoremap <silent> <leader>f  :Farf<cr>
nnoremap <silent> <leader>r  :Farr<cr>
vnoremap <silent> <leader>r  :Farr<cr>
"mdip
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'
let g:tmux_navigator_no_mappings = 1
nnoremap <C-h> :TmuxNavigateLeft<cr>
nnoremap <C-j> :TmuxNavigateDown<cr>
nnoremap <C-k> :TmuxNavigateUp<cr>
nnoremap <C-l> :TmuxNavigateRight<cr>
"FastFold
let g:markdown_folding = 0
let g:tex_fold_enabled = 0
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:r_syntax_folding = 1
let g:php_folding = 1
