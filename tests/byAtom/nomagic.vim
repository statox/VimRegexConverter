source ../../plugin/convertRegex.vim

echo "end-of-line"
call ConvertRegex('v', '\Mfoo$bar')
call ConvertRegex('m', '\Mfoo$bar')
call ConvertRegex('V', '\Mfoo$bar')

echo "any character"
call ConvertRegex('v', '\Mfoo.bar')
call ConvertRegex('m', '\Mfoo.bar')
call ConvertRegex('V', '\Mfoo.bar')

echo "any number of the previous atom"
call ConvertRegex('v', '\Mfoo*bar')
call ConvertRegex('m', '\Mfoo*bar')
call ConvertRegex('V', '\Mfoo*bar')

echo "grouping into an atom"
call ConvertRegex('v', '\Mfo\(b\)ar')
call ConvertRegex('m', '\Mfo\(b\)ar')
call ConvertRegex('V', '\Mfo\(b\)ar')

echo "separating alternative"
call ConvertRegex('v', '\Mfoo\|bar')
call ConvertRegex('m', '\Mfoo\|bar')
call ConvertRegex('V', '\Mfoo\|bar')

echo "alpahbetic character"
call ConvertRegex('v', '\Mfoo\abar')
call ConvertRegex('m', '\Mfoo\abar')
call ConvertRegex('V', '\Mfoo\abar')

echo "literal backslash"
call ConvertRegex('v', '\Mfoo\\bar')
call ConvertRegex('m', '\Mfoo\\bar')
call ConvertRegex('V', '\Mfoo\\bar')

echo "literal dot"
call ConvertRegex('v', '\Mfoo\.bar')
call ConvertRegex('m', '\Mfoo\.bar')
call ConvertRegex('V', '\Mfoo\.bar')

echo "literal {"
call ConvertRegex('v', '\Mfoo{bar')
call ConvertRegex('m', '\Mfoo{bar')
call ConvertRegex('V', '\Mfoo{bar')
