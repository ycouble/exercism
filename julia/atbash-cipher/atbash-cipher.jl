atoz = 'a':'z'
ztoa = 'z':-1:'a'
numbers= '0':'9'
conv = Dict(atoz[i] => string(ztoa[i]) for i in 1:length(atoz))

function encode(input::AbstractString)
    out = ""
    i = 1
    input_l = lowercase(input)
    for c in input_l
        if c in numbers
            out *= string(c)
        elseif c in keys(conv)
            out *= conv[c]
        else
            continue
        end
        if i % 5 == 0
            out *= " "
        end
        i += 1
    end
    # Remove trailing space
    if out[end] == ' '
        out = out[1:end-1]
    end
    return out
end

function decode(input::AbstractString)
    out = ""
    for c in input
        if c in keys(conv)
            out *= conv[c]
        elseif c in numbers
            out *= string(c)
        end
    end
    return out
end

