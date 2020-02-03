using Base
import Base.+, Base.-, Base.*, Base./

struct ComplexNumber <: Number
  x   ::Float64
  y   ::Float64
end

function +(a::ComplexNumber, b::ComplexNumber)
  return ComplexNumber(a.x + b.x, a.y + b.y)
end

function -(a::ComplexNumber, b::ComplexNumber)
  return ComplexNumber(a.x - b.x, a.y - b.y)
end

function *(a::ComplexNumber, b::ComplexNumber)
  return ComplexNumber(a.x*b.x - a.y*b.y, a.x*b.y + a.y*b.x)
end

function /(a::ComplexNumber, b::ComplexNumber)
  return ComplexNumber((a.x*b.x + a.y*b.y)/(b.x^2 + b.y^2), (a.y*b.x - a.x*b.y)/(b.x^2 + b.y^2))
end

function abs(a::ComplexNumber)
  return a.x >= 0 ? a.x : -a.x
end

function conj
end
function exp
end
