
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
"autocmd FileType coc-explorer call Explorerinit()
autocmd InsertEnter let g:path=""
