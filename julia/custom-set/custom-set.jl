using Base
import Base.isempty, Base.union, Base.intersect, Base.union!, Base.intersect!, Base.in, Base.issubset, Base.==, Base.length, Base.push!, Base.iterate, Base.copy


struct CustomSet{T} <: Base.AbstractSet{T}
    array::Array{T,1}
    b::Int
end

function CustomSet(a::Array)
    return CustomSet(sort(union(a, [])),0)
end

function isempty(set::CustomSet)
    return length(set.array) == 0
end
    
function intersect(s::CustomSet, t::CustomSet)
    return CustomSet(intersect(s.array, t.array))
end

    
function intersect!(s::CustomSet, t::CustomSet)
    sort!(intersect!(s.array, t.array))
end

function union(s::CustomSet, t::CustomSet)
    return CustomSet(union(s.array, t.array))
end

function union!(s::CustomSet, t::CustomSet)
    sort!(union!(s.array, t.array))
end

function issubset(s::CustomSet, t::CustomSet)
    return issubset(s.array, t.array)
end

function length(s::CustomSet)
    return length(s.array)
end

function disjoint(s::CustomSet, t::CustomSet)
    return length(intersect(s, t)) == 0
end

function ==(s::CustomSet, t::CustomSet)
    return s.array == t.array
end

function push!(s::CustomSet, e::Any)
    if !(e in s) 
        sort!(push!(s.array, e))
    end
end

function complement(superset::CustomSet, s::CustomSet)
    return CustomSet(setdiff(superset.array, s.array))
end
   
function complement!(superset::CustomSet, s::CustomSet)
    setdiff!(superset.array, s.array)
end
   
function in(e::Any, s::CustomSet)
    return e in s.array
end

function iterate(s::CustomSet, i::Int)
    return iterate(s.array, i)
end

function copy(s::CustomSet)
    return CustomSet(copy(s.array))
end