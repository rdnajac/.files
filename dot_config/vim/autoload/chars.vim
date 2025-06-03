scriptencoding utf-8

" Insert Greek letters with <localleader> + first two letters of the name
" XXX: omicron is omitted
" XXX: don't use this in latex math mode
function vim#chars#greek()
  " Uppercase {{{
  inoremap <localleader>Al Α
  inoremap <localleader>Be Β
  inoremap <localleader>Ga Γ
  inoremap <localleader>De Δ
  inoremap <localleader>Ep Ε
  inoremap <localleader>Ze Ζ
  inoremap <localleader>Et Η
  inoremap <localleader>Th Θ
  inoremap <localleader>Io Ι
  inoremap <localleader>Ka Κ
  inoremap <localleader>La Λ
  inoremap <localleader>Mu Μ
  inoremap <localleader>Nu Ν
  inoremap <localleader>Xi Ξ
  " inoremap <localleader>Om Ο
  inoremap <localleader>Pi Π
  inoremap <localleader>Rh Ρ
  inoremap <localleader>Si Σ
  inoremap <localleader>Ta Τ
  inoremap <localleader>Up Υ
  inoremap <localleader>Ph Φ
  inoremap <localleader>Ch Χ
  inoremap <localleader>Ps Ψ
  inoremap <localleader>Om Ω
  " }}}
  " Lowercase {{{
  inoremap <localleader>al α
  inoremap <localleader>be β
  inoremap <localleader>ga γ
  inoremap <localleader>de δ
  inoremap <localleader>ep ε
  inoremap <localleader>ze ζ
  inoremap <localleader>et η
  inoremap <localleader>th θ
  inoremap <localleader>io ι
  inoremap <localleader>ka κ
  inoremap <localleader>la λ
  inoremap <localleader>mu μ
  inoremap <localleader>nu ν
  inoremap <localleader>xi ξ
  " inoremap <localleader>om ο
  inoremap <localleader>pi π
  inoremap <localleader>rh ρ
  inoremap <localleader>si σ
  inoremap <localleader>ta τ
  inoremap <localleader>up υ
  inoremap <localleader>ph φ
  inoremap <localleader>ch χ
  inoremap <localleader>ps ψ
  inoremap <localleader>om ω
  " }}}
endfunction
