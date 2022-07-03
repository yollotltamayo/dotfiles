if !has('conceal')
    finish
endif

syntax match pyOperator ">=" conceal cchar=≥
syntax match pyOperator "<=" conceal cchar=≤
hi link pyOperator Operator
hi! link Conceal Operator

set conceallevel=2
