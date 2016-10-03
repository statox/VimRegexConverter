source ./convertRegex.vim

"call ConvertRegex('v', '\m-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>')
"call ConvertRegex('V', '\mtoto..tata\.\.')

"call ConvertRegex('M', '\m\toto$')
"call ConvertRegex('M', '\m\toto*toto')

" magic to very magic
"call ConvertRegex('v', '\mfoo$')
"call ConvertRegex('v', '\mfoo.bar')
"call ConvertRegex('v', '\mfoo*bar')
"call ConvertRegex('v', '\mfo\(b\)ar')
"call ConvertRegex('v', '\mfoo\|bar')
"call ConvertRegex('v', '\mfoo\abar')
"call ConvertRegex('v', '\mfoo\\bar')
"call ConvertRegex('v', '\mfoo\.bar')
"call ConvertRegex('v', '\mfoo{bar')

" magic to magic
"call ConvertRegex('m', '\mfoo$')
"call ConvertRegex('m', '\mfoo.bar')
"call ConvertRegex('m', '\mfoo*bar')
"call ConvertRegex('m', '\mfo\(b\)ar')
"call ConvertRegex('m', '\mfoo\|bar')
"call ConvertRegex('m', '\mfoo\abar')
"call ConvertRegex('m', '\mfoo\\bar')
"call ConvertRegex('m', '\mfoo\.bar')
"call ConvertRegex('m', '\mfoo{bar')

" magic to no magic
"call ConvertRegex('M', '\mfoo$')
"call ConvertRegex('M', '\mfoo.bar')
"call ConvertRegex('M', '\mfoo*bar')
"call ConvertRegex('M', '\mfo\(b\)ar')
"call ConvertRegex('M', '\mfoo\|bar')
"call ConvertRegex('M', '\mfoo\abar')
"call ConvertRegex('M', '\mfoo\\bar')
"call ConvertRegex('M', '\mfoo\.bar')
"call ConvertRegex('M', '\mfoo{bar')

" magic to very no magic
"call ConvertRegex('V', '\mfoo$')
"call ConvertRegex('V', '\mfoo.bar')
"call ConvertRegex('V', '\mfoo*bar')
"call ConvertRegex('V', '\mfo\(b\)ar')
"call ConvertRegex('V', '\mfoo\|bar')
"call ConvertRegex('V', '\mfoo\abar')
"call ConvertRegex('V', '\mfoo\\bar')
"call ConvertRegex('V', '\mfoo\.bar')
"call ConvertRegex('V', '\mfoo{bar')
