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
autocmd BufWritePost todo.md mkview
autocmd BufEnter todo.md silent! loadview
" markdown-preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 1
nmap <localleader><C-p> <Plug>MarkdownPreviewToggle
"mdip
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'
