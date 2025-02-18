" highlight `strings`
" highlight `strings 1`
" highlight `strings:`
" highlight `strings_s`
" highlight `strings`
" highlight `strings strings`



highlight CommentBacktickString guibg=NONE guifg=#39ff14
syntax region CommentBacktickString start=/`/ end=/`/ contained containedin=.*Comment
" syntax region CommentBacktickString start=/`/ end=/`/ contained containedin=Comment
