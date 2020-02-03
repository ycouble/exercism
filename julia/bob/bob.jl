function bob(stimulus::AbstractString)
  str = strip(stimulus)
  uppers = 'A':'Z'
  lowers = 'a':'z'
  letter = sum([str[i] ∈ uppers || str[i] ∈ lowers for i in 1:length(str)])
  upper = sum([str[i] ∈ uppers for i in 1:length(str)])
  lower = sum([str[i] ∈ lowers for i in 1:length(str)])
  if length(str) == 0
    answer = "Fine. Be that way!"
  elseif str[end] == '?' && letter > 0 && upper == letter
    answer = "Calm down, I know what I'm doing!"
  elseif str[end] == '?'
    answer = "Sure."
  elseif upper > 0 && upper == letter
    answer = "Whoa, chill out!"
  else
    answer = "Whatever."
  end
  println("$stimulus -> $answer (L=$letter, U=$upper, l=$lower)")
  return answer
end
