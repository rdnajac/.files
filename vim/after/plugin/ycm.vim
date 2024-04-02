let g:ycm_clangd_args = [ '--header-insertion=never' ]

let g:ycm_enable_semantic_highlighting=1
let MY_YCM_HIGHLIGHT_GROUP = {
            \   'typeParameter': 'PreProc',
            \   'parameter': 'Normal',
            \   'variable': 'Normal',
            \   'property': 'Normal',
            \   'enumMember': 'Normal',
            \   'event': 'Special',
            \   'member': 'Normal',
            \   'method': 'Normal',
            \   'class': 'Special',
            \   'namespace': 'Special',
            \ }

"for tokenType in keys( MY_YCM_HIGHLIGHT_GROUP )
"  call prop_type_add( 'YCM_HL_' . tokenType,
"                    \ { 'highlight': MY_YCM_HIGHLIGHT_GROUP[ tokenType ] } )
"endfor

"let g:ycm_enable_inlay_hints=1
" Modify below if you want less invasive semantic auto-complete
let g:ycm_semantic_triggers = {
            \   'c,objc' : ['->', '.'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \ }

let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_show_diagnostics_ui=0
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:ycm_min_num_of_chars_for_completion = 99
"set completeopt-=preview
"nnoremap <leader>] :YcmCompleter GoTo<CR>
"nnoremap ? <plug>(YCMHover)

