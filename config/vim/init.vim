runtime vimrc

" lua require('lazy.bootstrap')
lua require('lazy.bootstrap')
lua require('nvim')

nmap <leader>l <Cmd>Lazy<CR>
nmap <localleader>l <Cmd>lua Snacks.picker.lazy()<CR>

color tokyonight-night
