" Globaly required key map

" ctrl-p
nnoremap <C-p> :Unite -profile-name=ido file_rec/async<cr>
nnoremap <Leader>uf :Unite -profile-name=ido file_rec/async<cr>

" yank history
let g:unite_source_history_yank_enable = 1
nnoremap <Leader>uy :Unite -profile-name=ido history/yank<cr>

" unite show marks
nnoremap <Leader>um :Unite -profile-name=ido mark<cr>

" unite radio
nnoremap <Leader>ur :Unite -profile-name=ido radio<cr>

" grep
nnoremap <Leader>ug :Unite -auto-preview -vertical grep:.<cr>

" outline
nnoremap <Leader>uo :Unite -profile-name=ido outline<cr>
nnoremap <Leader>ut :TagbarToggle<cr>

" toggle git gutter
nnoremap <Leader>st :SignifyToggle<cr>

" explore buffers
nnoremap <Leader>ub :Unite -profile-name=ido buffer<cr>

" easymotion
map <Leader>/ <Plug>(easymotion-sn)

" toggle explorer
nnoremap <c-n> :VimFilerExplorer<cr>
nnoremap <Leader>fe :VimFilerExplorer<cr>
" use vimfiler instead of netrw
let g:vimfiler_as_default_explorer = 1

" toggle fullscreen (needs wmctrl)
map <silent> <f11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<cr>
map <silent> <Leader>F :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<cr>

" nohlsearch
nnoremap <Leader>H :noh<cr>

" fugitive map
"
nmap <Leader>fs :Gstatus<CR>
nmap <Leader>fb :Gblame<CR>
nmap <Leader>fc :Gcommit<CR>
nmap <Leader>fd :Gdiff<CR>
nmap <Leader>fp :Gpush<CR>
