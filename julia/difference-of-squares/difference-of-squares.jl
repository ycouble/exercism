"Sum the squares of the numbers up to the given number"
function square_of_sum(n::Int)
  numbers = 1:n
  return sum(numbers).^2
end

"Square the sum of the numbers up to the given number"
function sum_of_squares(n::Int)
  numbers = 1:n
  squares = numbers.^2
  return sum(squares)
end

"Subtract sum of squares from square of sums"
function difference(n::Int)
  return square_of_sum(n) - sum_of_squares(n)
end
