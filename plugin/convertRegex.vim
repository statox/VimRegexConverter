function! ConvertRegex(toMode, regex)
    " Get the original regex mode
    let fromMode = matchstr(a:regex, '..')

    " Save ignorecase setting
    let s:saveIgnoreCase=&ignorecase
    set noignorecase

    " Test toMode validity
    if a:toMode != 'm' && a:toMode != 'M' && a:toMode != 'v' && a:toMode != 'V'
        echoerr "Can't get the mode you want to convert the regex to"
        echoerr "Please make your first argument be 'm', 'M', 'v' or 'V'"
        return 1
    endif

    " Test fromMode validity
    if fromMode[0] != '\' || (fromMode[1] != 'm' && fromMode[1] != 'M' &&fromMode[1] != 'v' &&fromMode[1] != 'V')
        echoerr "Can't get the original mode of the regex to convert"
        echoerr "Please make your regex begin with '\\v', '\\m', '\\V' or '\\M'"
        return 1
    endif
    
    " Test conversion validity
    if fromMode[1] == a:toMode
        echo "The specified mode is the one already used in the regex"
        return
    endif

    " Dictionnary containing the characters to (un)escape from each conversion
    " Keys are of the format 'fromModeToMode'
    let charsToEscape = {
            \'mv' : ['(', ')', '|', '=', '<', '>', '+', '{', '&'],
            \'mV' : ['.', '$', '*', '~', '[', '^'],
            \'mM' : ['.', '*', '~', '['],
            \'Mv' : ['.', '*', '~', '(', ')', '|', '{'],
            \'MV' : ['$'],
            \'Mm' : ['.', '*', '~'],
            \'vm' : ['{', '(', ')', '|', '=', '<', '>', '+'],
            \'vV' : ['.', '{', '$', '*', '~', '(', ')', '|'],
            \'vM' : ['.', '{', '*', '~', '(', ')', '|'],
            \'Vv' : ['.', '$', '*', '~', '(', ')', '|', '{'],
            \'Vm' : ['.', '$', '*', '~', '{', '}'],
            \'VM' : ['$']
        \}

    " Create the key of the subdictionary to use and call the conversion function
    let key = fromMode[1] . a:toMode
    let res= <sid>ApplyConversion(a:regex, charsToEscape[key], a:toMode)

    " Restore the ignorecase setting
    let &ignorecase=s:saveIgnoreCase
    unlet s:saveIgnoreCase

    return res
endfunction

function! s:ApplyConversion(regex, charsToEscape, toMode)
    let res = a:regex

    " Handle the chars where escaping needs to be inversed
    for char in a:charsToEscape
        let res = substitute(res, '\V\\'.char, 'UNESCAPEME', 'g')
        let res = substitute(res, '\V'.char, '\\'.char, 'g')
        let res = substitute(res, 'UNESCAPEME', char, 'g')
    endfor

    " Change the mode of the regex (first two characters)
    let res= substitute(res, '..', '\\'.a:toMode, '')

    return res
endfunction

" Utility function to test the other one
function! TestRegex(regex)
    let m = ConvertRegex('m', a:regex)
    let v = ConvertRegex('v', a:regex)
    let M = ConvertRegex('M', a:regex)
    let V = ConvertRegex('V', a:regex)

    let string = m . "\n" . v . "\n" . M . "\n" . V
    call setreg('z', string)
    normal "ap
endfunction
