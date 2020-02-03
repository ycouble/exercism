function transform(input::AbstractDict)
  out = Dict()
  for (point, letters) in input
    for letter in letters
      out[lowercase(letter)] = point
    end
  end
  return out
end
