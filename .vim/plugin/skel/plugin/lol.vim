" lol.vim - It prints a cat
" Author: Ryan Najac <http://rdnajac.tech>
" Version: 0.1

" The usual guard that prevents the plugin from being loaded multiple times
" also skips loading the plugin if we are running in compatible mode
" or if the vim version is too old (less than 7.0 in this case)
if exists("g:loaded_lolcat") || &cp || v:version < 700
     finish
endif
let g:loaded_lolcat = 1

" Define some <Plug> mappings, mappings without a keysequence to trigger them
" the :<C-U> syntax removes any range that vim might have inserted
" :help using-<Plug>
nnoremap <silent> <Plug>lolcatFunction :<C-U>call <SID>dofunction()<CR>
nnoremap <silent> <Plug>lolcatOperator :set operatorfunc=lolcat#myoperator<CR>g@


" don't pollute vim with new keysequence mapping if the user doesn't want us to
if !exists("g:lolcat_no_mappings") || ! g:lolcat_no_mappings
  " here we provide explicity key sequences for the mappings
  " by refering to the <Plug>mappings that we defined unconditionally.
  " gus<motion> , like gusiw, gusE, etc. will invoke myoperator in autoload/
  nmap gus <Plug>lolcatOperator
end

" Define a function to call when the user event "Lol" is triggered
autocmd User Lol call lol#cat()

" Map the autoloaded function to a command
command! LOL call lol#cat()

" vim:set ft=vim sw=2 sts=2 et:
