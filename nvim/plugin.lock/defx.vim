
"defx
 call defx#custom#option('_', { 
	\ 'winwidth': 30, 
	\ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ 'vertical_preview':1,
      \ })

nnoremap td :Defx <CR>
nnoremap tt :<C-u>Defx -resume -toggle -search=`expand('%:p')`<CR>
autocmd BufWritePost * call defx#redraw()
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
    \ defx#is_directory() ? 
    \ defx#do_action('open_tree') : 
    \ defx#do_action('multi', ['drop'])
  nnoremap <buffer><expr> c defx#do_action('copy')
  nnoremap <buffer><expr> m defx#do_action('move')
  nnoremap <buffer><expr> gp defx#do_action('paste')
  nnoremap <buffer><expr> i defx#do_action('multi', [['drop','split']])
  nnoremap <buffer><expr> E defx#do_action('open', 'vsplit')
  nnoremap <buffer><expr> <C-g> defx#do_action('print')
  nnoremap <buffer><expr> d defx#do_action('remove')
  nnoremap <buffer><expr> r defx#do_action('rename')
  nnoremap <buffer><expr> o
    \ defx#is_directory() ? 
    \ defx#do_action('open_or_close_tree') : 
    \ defx#do_action('multi', ['drop'])
	nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> h defx#do_action('close_tree' )
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> l
    \ defx#is_directory() ? 
    \ defx#do_action('open_tree') : 
    \ defx#do_action('multi', ['drop'])
  nnoremap <buffer><expr> p defx#do_action('open','pedit')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> s defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> gx defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> *  defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> <S-Space> defx#do_action('toggle_select') . 'k'
