
letters = 'a':'z'

function counts(str)
  count = Dict(c => 0 for c in letters)
  for c in str
    if !(c in keys(count))
      continue
    end
    count[c] += 1
  end
  return count
end

function detect_anagrams(subject::AbstractString, candidates::AbstractArray)
  out = []
  low_subject = lowercase(subject)
  ref_count = counts(low_subject)
  for cand in candidates
    candidate = lowercase(cand)
    if candidate in out || candidate == low_subject
      continue
    end
    count = counts(candidate)
    if all(count[c] == ref_count[c] for c in letters)
      push!(out, cand)
    end
  end
  return out
end
