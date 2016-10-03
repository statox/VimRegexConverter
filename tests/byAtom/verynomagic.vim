source ../../plugin/convertRegex.vim

echo "end-of-line"
call ConvertRegex('v', '\Vfoo$bar')
call ConvertRegex('m', '\Vfoo$bar')
call ConvertRegex('M', '\Vfoo$bar')

echo "any character"
call ConvertRegex('v', '\Vfoo.bar')
call ConvertRegex('m', '\Vfoo.bar')
call ConvertRegex('M', '\Vfoo.bar')

echo "any number of the previous atom"
call ConvertRegex('v', '\Vfoo*bar')
call ConvertRegex('m', '\Vfoo*bar')
call ConvertRegex('M', '\Vfoo*bar')

echo "grouping into an atom"
call ConvertRegex('v', '\Vfo\(b\)ar')
call ConvertRegex('m', '\Vfo\(b\)ar')
call ConvertRegex('M', '\Vfo\(b\)ar')

echo "separating alternative"
call ConvertRegex('v', '\Vfoo\|bar')
call ConvertRegex('m', '\Vfoo\|bar')
call ConvertRegex('M', '\Vfoo\|bar')

echo "alpahbetic character"
call ConvertRegex('v', '\Vfoo\abar')
call ConvertRegex('m', '\Vfoo\abar')
call ConvertRegex('M', '\Vfoo\abar')

echo "literal backslash"
call ConvertRegex('v', '\Vfoo\\bar')
call ConvertRegex('m', '\Vfoo\\bar')
call ConvertRegex('M', '\Vfoo\\bar')

echo "literal dot"
call ConvertRegex('v', '\Vfoo\.bar')
call ConvertRegex('m', '\Vfoo\.bar')
call ConvertRegex('M', '\Vfoo\.bar')

echo "literal {"
call ConvertRegex('v', '\Vfoo{bar')
call ConvertRegex('m', '\Vfoo{bar')
call ConvertRegex('M', '\Vfoo{bar')
