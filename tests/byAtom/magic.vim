source ../../plugin/convertRegex.vim

echo "end-of-line"
call ConvertRegex('v', '\mfoo$bar')
call ConvertRegex('M', '\mfoo$bar')
call ConvertRegex('V', '\mfoo$bar')

echo "any character"
call ConvertRegex('v', '\mfoo.bar')
call ConvertRegex('M', '\mfoo.bar')
call ConvertRegex('V', '\mfoo.bar')

echo "any number of the previous atom"
call ConvertRegex('v', '\mfoo*bar')
call ConvertRegex('M', '\mfoo*bar')
call ConvertRegex('V', '\mfoo*bar')

echo "grouping into an atom"
call ConvertRegex('v', '\mfo\(b\)ar')
call ConvertRegex('M', '\mfo\(b\)ar')
call ConvertRegex('V', '\mfo\(b\)ar')

echo "separating alternative"
call ConvertRegex('v', '\mfoo\|bar')
call ConvertRegex('M', '\mfoo\|bar')
call ConvertRegex('V', '\mfoo\|bar')

echo "alpahbetic character"
call ConvertRegex('v', '\mfoo\abar')
call ConvertRegex('M', '\mfoo\abar')
call ConvertRegex('V', '\mfoo\abar')

echo "literal backslash"
call ConvertRegex('v', '\mfoo\\bar')
call ConvertRegex('M', '\mfoo\\bar')
call ConvertRegex('V', '\mfoo\\bar')

echo "literal dot"
call ConvertRegex('v', '\mfoo\.bar')
call ConvertRegex('M', '\mfoo\.bar')
call ConvertRegex('V', '\mfoo\.bar')

echo "literal {"
call ConvertRegex('v', '\mfoo{bar')
call ConvertRegex('M', '\mfoo{bar')
call ConvertRegex('V', '\mfoo{bar')
