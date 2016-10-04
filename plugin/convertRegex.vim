" '\m-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>'
"
" m => M
" $

function! ConvertRegex(toMode, regex)
    " Get the original regex mode
    let fromMode = matchstr(a:regex, '..')

    set noignorecase
    if fromMode[1] == a:toMode
        echo "The specified mode is the one already used in the regex"
        return
    endif
    if fromMode == '\m'
        if a:toMode == "v"
            let charsRemoveEscape=['(', ')', '|', '=', '<', '>', '+']
            let charsAddEscape=['{']
        elseif a:toMode == "V"
            let charsRemoveEscape=['\.']
            let charsAddEscape=['$', '*', '.']
        elseif a:toMode == "M"
            let charsRemoveEscape=['\.']
            let charsAddEscape=['*']
        endif
    elseif fromMode == '\M'
        if a:toMode == "v"
            let charsRemoveEscape=['(', ')', '|', '\.']
            let charsAddEscape=['{', '.']
        elseif a:toMode == "V"
            let charsRemoveEscape=['\.']
            let charsAddEscape=['$', '.']
        elseif a:toMode == "m"
            let charsRemoveEscape=[]
            let charsAddEscape=[]
        endif
    elseif fromMode == '\v'
        if a:toMode == "m"
            let charsRemoveEscape=[]
            let charsAddEscape=[]
        elseif a:toMode == "V"
            let charsRemoveEscape=[]
            let charsAddEscape=[]
        elseif a:toMode == "M"
            let charsRemoveEscape=[]
            let charsAddEscape=[]
        endif
    elseif fromMode == '\V'
        if a:toMode == "v"
            let charsRemoveEscape=[]
            let charsAddEscape=[]
        elseif a:toMode == "m"
            let charsRemoveEscape=[]
            let charsAddEscape=[]
        elseif a:toMode == "M"
            let charsRemoveEscape=[]
            let charsAddEscape=[]
        endif
    else
        echo "Can't get the mode of the regex to convert"
        echo "Please make your regex begin with '\\v', '\\m', '\\V' or '\\M'"
        return
    endif

    let res= ApplyConvertion(a:regex, charsRemoveEscape, charsAddEscape)
endfunction

function! RemoveEscaping(char, regex)
    return substitute(a:regex, '\\'.a:char, a:char, "g")
endfunction

function! AddEscaping(char, regex)
    if a:char == "$"
        return substitute(a:regex, '\$', '\\$', "g")
    else
        return substitute(a:regex, a:char, '\\'.a:char, "g")
    endif
endfunction

function! ApplyConvertion(regex, charsRemoveEscape, charsAddEscape)
    let res = a:regex

    for char in a:charsRemoveEscape
        let res = RemoveEscaping(char, res)
    endfor

    for char in a:charsAddEscape
        let res = AddEscaping(char, res)
    endfor

    echo a:regex
    echo res

    return res
endfunction
