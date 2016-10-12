function! ConvertRegex(toMode, regex)
    " Get the original regex mode
    let fromMode = matchstr(a:regex, '..')
    let inverseDotEscaping = 0

    let s:saveIgnoreCase=&ignorecase
    set noignorecase

    if a:toMode != 'm' && a:toMode != 'M' && a:toMode != 'v' && a:toMode != 'V'
        echoerr "Can't get the mode you want to convert the regex to"
        echoerr "Please make your first argument be 'm', 'M', 'v' or 'V'"
        return 0
    endif
    
    if fromMode[1] == a:toMode
        echo "The specified mode is the one already used in the regex"
        return
    endif

    if fromMode == '\m'
        if a:toMode == "v"
            let charsRemoveEscape = ['(', ')', '|', '=', '<', '>', '+']
            let charsAddEscape = ['{']
        elseif a:toMode == "V"
            let charsRemoveEscape = []
            let charsAddEscape = ['$', '*', '~']
            let inverseDotEscaping = 1
        elseif a:toMode == "M"
            let charsRemoveEscape = []
            let charsAddEscape = ['*', '~']
            let inverseDotEscaping = 1
        endif
    elseif fromMode == '\M'
        if a:toMode == "v"
            let charsRemoveEscape = ['*', '~', '(', ')', '|']
            let charsAddEscape = ['{']
            let inverseDotEscaping = 1
        elseif a:toMode == "V"
            let charsRemoveEscape = []
            let charsAddEscape = ['$']
        elseif a:toMode == "m"
            let charsRemoveEscape = ['*', '~']
            let charsAddEscape = []
            let inverseDotEscaping = 1
        endif
    elseif fromMode == '\v'
        if a:toMode == "m"
            let charsRemoveEscape = ['{']
            let charsAddEscape = ['(', ')', '|', '=', '<', '>', '+']
        elseif a:toMode == "V"
            let charsRemoveEscape = ['{']
            let charsAddEscape = ['$', '*', '~', '(', ')', '|']
            let inverseDotEscaping = 1
        elseif a:toMode == "M"
            let charsRemoveEscape = ['{']
            let charsAddEscape = ['*', '~', '(', ')', '|']
            let inverseDotEscaping = 1
        endif
    elseif fromMode == '\V'
        if a:toMode == "v"
            let charsRemoveEscape = ['$', '*', '~', '(', ')', '|']
            let charsAddEscape = ['{']
            let inverseDotEscaping = 1
        elseif a:toMode == "m"
            let charsRemoveEscape = ['$', '*', '~']
            let charsAddEscape = ['{', '}']
            let inverseDotEscaping = 1
        elseif a:toMode == "M"
            let charsRemoveEscape = ['$']
            let charsAddEscape = []
        endif
    else
        echoerr "Can't get the original mode of the regex to convert"
        echoerr "Please make your regex begin with '\\v', '\\m', '\\V' or '\\M'"
        return 0
    endif

    " Apply the conversion
    let res= <sid>ApplyConversion(a:regex, charsRemoveEscape, charsAddEscape, inverseDotEscaping)
    " Change the mode of the regex (first two characters)
    let res= substitute(res, '..', '\\'.a:toMode, '')

    let &ignorecase=s:saveIgnoreCase
    unlet s:saveIgnoreCase

    return res
endfunction

function! s:ApplyConversion(regex, charsRemoveEscape, charsAddEscape, inverseDotEscaping)
    let res = a:regex

    " Remove '\'
    for char in a:charsRemoveEscape
        let res = substitute(res, '\V\\'.char, char, "g")
    endfor

    " Add '\'
    for char in a:charsAddEscape
        let res = substitute(res, '\V'.char, '\\'.char, "g")
    endfor

    " Handle the dot conversion
    if a:inverseDotEscaping == 1
        let res = substitute(res, '\V\\.', 'UNESCAPEME', 'g')
        let res = substitute(res, '\V.', '\\.', 'g')
        let res = substitute(res, 'UNESCAPEME', '.', 'g')
    endif

    return res
endfunction
