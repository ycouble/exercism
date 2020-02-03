function distance(s1::AbstractString, s2::AbstractString)
    if length(s1) != length(s2)
        throw(ArgumentError("Both nucleotide chains should be the same size."))
    end
    maxL = max(length(s1), length(s2))
    minL = min(length(s1), length(s2))
    hamming = maxL - minL

    ss1 = s1[1:minL]
    ss2 = s2[1:minL]

    for index ∈ 1:minL
        hamming += ss1[index] == ss2[index] ? 0 : 1
    end
    hamming
end
