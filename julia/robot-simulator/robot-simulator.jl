using Base
import Base.+

@enum Direction NORTH=0 EAST=1 SOUTH=2 WEST=3

struct Point{T}
    x::T
    y::T
end

function +(p::Point, t::Tuple{Int64,Int64})
    return Point(p.x + t[1], p.y + t[2])
end

mutable struct Robot
    xy::Point
    dir::Direction
end

function Robot(t::Tuple{Int64,Int64}, d::Direction)
    return Robot(Point(t[1],t[2]), d)
end

function position(r::Robot)
    return r.xy
end

function heading(r::Robot)
    return r.dir
end

function turn_right!(r::Robot)
    r.dir = Direction((Int(r.dir) + 1) % 4)
    return r
end

function turn_left!(r::Robot)
    r.dir = Direction((Int(r.dir) + 3) % 4)
    return r
end

function advance!(r::Robot)
    if r.dir === NORTH
        r.xy = r.xy + (0,1)
    elseif r.dir === SOUTH
        r.xy = r.xy + (0,-1)
    elseif r.dir === EAST
        r.xy = r.xy + (1,0)
    elseif r.dir === WEST
        r.xy = r.xy + (-1,0)
    else
        error("Unknown direction")
    end
    return r
end

function move!(r::Robot, s::String)
    for c in lowercase(s)
        if c == 'a'
            advance!(r)
        elseif c == 'l'
            turn_left!(r)
        elseif c == 'r'
            turn_right!(r)
        else
            error("Bad instruction")
        end
    end
end
