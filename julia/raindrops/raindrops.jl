function raindrops(number::Int)
    out = ""
    if number % 3 == 0
        out *= "Pling"
    end
    if number % 5 == 0
        out *= "Plang"
    end
    if number % 7 == 0
        out *= "Plong"
    end
    if out == ""
        out = string(number)
    end
    return out
end
