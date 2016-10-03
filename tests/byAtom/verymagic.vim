source ../../plugin/convertRegex.vim

echo "end-of-line"
call ConvertRegex('m', '\vfoo$bar')
call ConvertRegex('M', '\vfoo$bar')
call ConvertRegex('V', '\vfoo$bar')

echo "any character"
call ConvertRegex('m', '\vfoo.bar')
call ConvertRegex('M', '\vfoo.bar')
call ConvertRegex('V', '\vfoo.bar')

echo "any number of the previous atom"
call ConvertRegex('m', '\vfoo*bar')
call ConvertRegex('M', '\vfoo*bar')
call ConvertRegex('V', '\vfoo*bar')

echo "grouping into an atom"
call ConvertRegex('m', '\vfo\(b\)ar')
call ConvertRegex('M', '\vfo\(b\)ar')
call ConvertRegex('V', '\vfo\(b\)ar')

echo "separating alternative"
call ConvertRegex('m', '\vfoo\|bar')
call ConvertRegex('M', '\vfoo\|bar')
call ConvertRegex('V', '\vfoo\|bar')

echo "alpahbetic character"
call ConvertRegex('m', '\vfoo\abar')
call ConvertRegex('M', '\vfoo\abar')
call ConvertRegex('V', '\vfoo\abar')

echo "literal backslash"
call ConvertRegex('m', '\vfoo\\bar')
call ConvertRegex('M', '\vfoo\\bar')
call ConvertRegex('V', '\vfoo\\bar')

echo "literal dot"
call ConvertRegex('m', '\vfoo\.bar')
call ConvertRegex('M', '\vfoo\.bar')
call ConvertRegex('V', '\vfoo\.bar')

echo "literal {"
call ConvertRegex('m', '\vfoo{bar')
call ConvertRegex('M', '\vfoo{bar')
call ConvertRegex('V', '\vfoo{bar')
