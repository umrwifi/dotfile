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
