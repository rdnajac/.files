" Insert Greek letters with , + first two letters of the name
" XXX: omicron is omitted
scriptencoding utf-8

function! greek#setupmappings()
" Uppercase
inoremap ,Al Α
inoremap ,Be Β
inoremap ,Ga Γ
inoremap ,De Δ
inoremap ,Ep Ε
inoremap ,Ze Ζ
inoremap ,Et Η
inoremap ,Th Θ
inoremap ,Io Ι
inoremap ,Ka Κ
inoremap ,La Λ
inoremap ,Mu Μ
inoremap ,Nu Ν
inoremap ,Xi Ξ
" inoremap ,Om Ο
inoremap ,Pi Π
inoremap ,Rh Ρ
inoremap ,Si Σ
inoremap ,Ta Τ
inoremap ,Up Υ
inoremap ,Ph Φ
inoremap ,Ch Χ
inoremap ,Ps Ψ
inoremap ,Om Ω

" Lowercase
inoremap ,al α
inoremap ,be β
inoremap ,ga γ
inoremap ,de δ
inoremap ,ep ε
inoremap ,ze ζ
inoremap ,et η
inoremap ,th θ
inoremap ,io ι
inoremap ,ka κ
inoremap ,la λ
inoremap ,mu μ
inoremap ,nu ν
inoremap ,xi ξ
" inoremap ,om ο
inoremap ,pi π
inoremap ,rh ρ
inoremap ,si σ
inoremap ,ta τ
inoremap ,up υ
inoremap ,ph φ
inoremap ,ch χ
inoremap ,ps ψ
inoremap ,om ω
endfunction
