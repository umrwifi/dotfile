nnoremap <localleader>d :call ToggleCheck() <CR>
vnoremap <localleader>d : s/\[.\]/\[x\]/g <CR>
nnoremap <localleader>td :. s/-/-\ \[\ \]/g <CR> " change the list to checkbox
vnoremap <localleader>td : s/-/-\ \[\ \]/g <CR>
nnoremap ]] /^#\+\s<CR> :let @/ = ""<CR>^zz
nnoremap [[ ?^#\+\s<CR> :let @/ = ""<CR>^zz
vnoremap ]] /^#\+\s<CR>
vnoremap [[ ?^#\+\s<CR>
"autocmd FileType markdown vnoremap ]] : s/^#\{1,5\}\s/#&/g <CR> :let @/ = ""<CR>
"autocmd FileType markdown vnoremap [[ : s/^##/#/g <CR> :let @/ = ""<CR>
function! MarkdownLevel()
  if getline(v:lnum) =~ '^# .*$'
    return "=0"
  endif

  if getline(v:lnum) =~ '^## .*$'
    return "=1"
  endif
  if getline(v:lnum-1) =~ '^## .*$'
    return ">2"
  endif
  if getline(v:lnum+2) =~ '^## .*$'
    return "<2"
  endif

  if getline(v:lnum) =~ '^### .*$'
    return "=2"
  endif
  if getline(v:lnum-1) =~ '^### .*$'
    return ">3"
  endif
  if getline(v:lnum+2) =~ '^### .*$'
    return "<3"
  endif

  if getline(v:lnum) =~ '^#### .*$'
    return "=3"
  endif
  if getline(v:lnum-1) =~ '^#### .*$'
    return ">4"
  endif
  if getline(v:lnum+2) =~ '^#### .*$'
    return "<4"
  endif

  if getline(v:lnum) =~ '^##### .*$'
    return "=4"
  endif
  if getline(v:lnum-1) =~ '^##### .*$'
    return ">5"
  endif
  if getline(v:lnum+2) =~ '^##### .*$'
    return "<5"
  endif
  if line(v:lnum) == line('$')
    echo 1
    return "=1"
  endif
  "     return ">7"
  " endif
 "if getline(v:lnum) =~ '^- \[.\] .*$'
 "  return ">6"
 "endif
 "" 如果是缩进列表
 "if getline(v:lnum) =~ '^\s\+- .*$'
 "  return ">8"
 "endif
  return "=" 
endfunction

nmap <leader>p  :silent exec "!pandoc -s %:p -o .%:r.html"<cr> :silent exec "!open -a 'Microsoft Edge' .%:r.html" <cr>
nnoremap ge g_yiw:vs <c-r>".md <cr>
" set foldmethod=expr
set foldmethod=manual
set foldexpr=MarkdownLevel()

"quicklook file
nmap gp :!qlmanage -p %:p  &> /dev/null & <cr>  
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
"autocmd BufNewFile *.md call HexoTitle()
command! Sum :r!awk -F '|' '{print; sum+=$4}; END {print "Total: "sum}'
" markdown-preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 1
nmap <localleader><C-p> <Plug>MarkdownPreviewToggle
"mdip
"autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'
