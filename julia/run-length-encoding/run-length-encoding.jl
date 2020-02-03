
function encode(s)
  last = '@'
  count = 1
  out = ""
  for c in s
    if c == last
      count += 1
    else
      if last == '@'
        last = c
      elseif count == 1
        out *= string(last)
        last = c
      else
        out *= "$count$last"
        count = 1
        last = c
      end
    end
  end
  if last == '@'
    return out
  elseif count == 1
    out *= string(last)
  else
    out *= "$count$last"
  end
  return out
end



function decode(s)
  count_str = ""
  out = ""
  for c in s
    if c in '0':'9'
      count_str *= string(c)
    elseif length(count_str) > 0
      count = parse(Int, count_str)
      out *= c^count
      count_str = ""
    else
      out *= c
    end
  end
  return out
end
