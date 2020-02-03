
function ispangram(input::AbstractString)
  letters = 'a':'z'
  counts = Dict(c => false for c in letters)
  for c in lowercase(input)
    counts[c] = true
  end
  return all(collect(values(counts)))
end
