function count_nucleotides(strand::AbstractString)
    counts = Dict('A' => 0, 'T' => 0, 'C' => 0, 'G' => 0)
    for c in strand
	if !(c in keys(counts))
	    throw(DomainError(c))
	end
	counts[c] += 1
    end
    return counts
end
