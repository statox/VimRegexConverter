function! ConvertRegex(toMode, regex)
    " Get the original regex mode
    let fromMode = matchstr(a:regex, '..')
    let inverseDotEscaping = 0

    set noignorecase
    if fromMode[1] == a:toMode
        echo "The specified mode is the one already used in the regex"
        return
    endif
    if fromMode == '\m'
        if a:toMode == "v"
            let charsRemoveEscape = ['(', ')', '|']
            let charsAddEscape = ['{', '}']
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
            let charsAddEscape = ['{', '}']
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
            let charsRemoveEscape = ['{', '}']
            let charsAddEscape = ['(', ')', '|']
        elseif a:toMode == "V"
            let charsRemoveEscape = ['{', '}']
            let charsAddEscape = ['$', '*', '~', '(', ')', '|']
            let inverseDotEscaping = 1
        elseif a:toMode == "M"
            let charsRemoveEscape = ['{', '}']
            let charsAddEscape = ['*', '~', '(', ')', '|']
            let inverseDotEscaping = 1
        endif
    elseif fromMode == '\V'
        if a:toMode == "v"
            let charsRemoveEscape = ['$', '*', '~', '(', ')', '|']
            let charsAddEscape = ['{', '}']
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
        echo "Can't get the mode of the regex to convert"
        echo "Please make your regex begin with '\\v', '\\m', '\\V' or '\\M'"
        return
    endif

    " Apply the convertion
    let res= <sid>ApplyConvertion(a:regex, charsRemoveEscape, charsAddEscape, inverseDotEscaping)
    " Change the mode of the regex (first two characters)
    let res= substitute(res, '..', '\\'.a:toMode, '')

    echo a:regex
    echo res
    echo " "

    return res
endfunction

function! s:RemoveEscaping(char, regex)
    return substitute(a:regex, '\V\\'.a:char, a:char, "g")
endfunction

function! s:AddEscaping(char, regex)
    return substitute(a:regex, '\V'.a:char, '\\'.a:char, "g")
endfunction

function! s:InverseDotEscaping(regex)
    let res = substitute(a:regex , '\V\\.', 'UNESCAPEME', 'g')
    let res = substitute(res, '\V.', '\\.', 'g')
    return substitute(res, 'UNESCAPEME', '.', 'g')
endfunction

function! s:ApplyConvertion(regex, charsRemoveEscape, charsAddEscape, inverseDotEscaping)
    let res = a:regex

    for char in a:charsRemoveEscape
        let res = <sid>RemoveEscaping(char, res)
    endfor

    for char in a:charsAddEscape
        let res = <sid>AddEscaping(char, res)
    endfor

    " Handle the dot convertion
    if a:inverseDotEscaping == 1
        let res = <sid>InverseDotEscaping(res)
    endif

    return res
endfunction
