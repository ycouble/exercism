using Base
import Base.+, Base.-, Base.==, Base.show

using Dates

mutable struct Clock
    h   ::Int64
    m   ::Int64
end

function +(a::Clock, b::Clock)
    return Clock(a.h + b.h, a.m + b.m)
end

function normalize(c::Clock)
    nh = (c.h + div(c.m, 60)) % 24
    nm = c.m % 60
    if nm >= 0 && nh >= 0
        return (nh, nm)
    elseif nm >= 0 && nh < 0
        return (nh+24, nm)
    elseif nm < 0 && nh > 0
        return (nh-1, nm+60)
    elseif nm < 0 && nh == 0
        return(23, nm+60)
    elseif nm < 0 && nh < 0
        return (nh+23, nm+60)
    end
end

function ==(a::Clock, b::Clock)
    return normalize(a) == normalize(b)
end

function +(a::Clock, m::Dates.Minute)
    return Clock(a.h, a.m + m.value)
end

function -(a::Clock, m::Dates.Minute)
    return Clock(a.h, a.m - m.value)
end

using Printf
function show(io::IO, c::Clock)
    nh, nm = normalize(c)
    show(io, @sprintf("%02d:%02d", nh, nm))
end