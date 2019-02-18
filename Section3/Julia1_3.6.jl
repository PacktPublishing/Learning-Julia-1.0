# Julia1_3.6.jl Modules
# defining a Module

module Gravity      # introduces new global scope
#using somelib       # presuming somelib contains something you need 
#import Base.show # if you just want to use show you could use using 
# import allows you to extend show with new methods
g=9.80665           # m/s^2
v(t) = g*t            # velocity as a function of time
s(t) = 0.5*g*t^2   # Distance as a function of time
export v, s, g      # make these functions and variables global
end

using Main.Gravity
for t=0.0:0.5:5.0
    print("t=$t v=$(v(t))\n      s=$(s(t)) \n")
end
#
###
#
module Astronomy
# constants
const c = 299792.458     # speed of light km/s
const dsec=24.0*3600.0   # seconds in a day
const ly = 365.25*dsec*c # light year in km
const au = 149597870.7   # astronomical unit in km (Radius of earths orbit)
const parsec = au*648000.0/π   # parsec in km (Distance to create parallax
#                              of 1 arcsecond of parallax from earths orbit)
export c
# functions
parsectoly(ps)= ps*parsec/ly  #  cnv parsecs to light years
stardis(parallax)=parsectoly(1.0/parallax)  # calc star dist
# An angle of 1 arcsecond of a degree  1/3600 of a degree
# from an object
export stardis
end

using Printf
using Main.Astronomy
nearstars = Dict("ProximaCentauri"=>.76850, "AlphaCentauri"=>.74723,
 "Bernard's Star"=>.54745, "Luhman16"=>.501398,
 "Wise0855-714"=>.449, "Wolf"=>.41516,
 "Lalande21185"=>.30264, "Sirius A"=>.37668)
@printf("       Star name   parallax     d.lightyears\n")
for star in nearstars
    name,plax=star
    @printf("%16s %10.6f %10.4f\n",name,plax,stardis(plax))
end

println(ly)  # error since not exported

println(Astronomy.ly) # But can still get ly using Module name
println(Astronomy.parsectoly(1.0))  # same with functions
