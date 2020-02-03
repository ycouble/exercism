function to_rna(dna::AbstractString)
  map = Dict{Char,String}('G' => "C", 'C' => "G", 'A' => "U", 'T' => "A")
  rna = ""
  for c in dna
    c ∉ keys(map) && throw(ErrorException("$c not a DNA nucleotide"))
    rna *= map[c]
  end
  return rna
end

