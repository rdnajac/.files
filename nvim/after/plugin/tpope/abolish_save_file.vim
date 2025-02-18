" Exit if :Abolish isn't available.
if !exists(':Abolish')
    finish
endif

" BUG: https://stackoverflow.com/questions/18514671/vim-abbreviation-also-applies-to-search-bug
" Abolish -cmdline {w,W,q,Q}{q,Q,w,W} wqa!
