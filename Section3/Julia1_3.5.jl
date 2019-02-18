# Julia1_3.4.jl Methods
#
# restricting cylinder function parameters to Float64
# "multiple dispatch" means that all parameters are used
#   to decide which method to use.
# So for efficiency we restrict the call parameters using
#  type assertion operators so that the operations
#  in the expression π*h*r^2 won't have to decide.
cylinder(r::Float64,h::Float64) = π*h*r^2  # for cylinder volume
println(cylinder(5.0,20.0))
println(cylinder(5,20.0))
println(typeof(5))
#
# Generalizing but still efficient for Float64 since it
# will use method 1.
# The most specific specifications take dispatch priority
cylinder(r::Real,h::Real) = π*h*r^2   # for cylinder volume
println(cylinder(5,20.0))

methods(cylinder) # we defined 2 methods for cylinder
#
# What if we just defined cylinder(r,h) = π*h*r^2
#  r and h would be of type 'any' which includes
#  Number, String, Char or any user defined type, often
#    undesirable
cuboid(l,h,d)=l*h*d   # will even take strings without complaining
cuboid("This"," is ","wrong!")

# perhaps want functions to check if types match
sametype(x::T, y::T) where {T}=true
sametype(x,y)=false
println(sametype(3,3.0))
println(sametype(3,2))
println(sametype(1+2im,3.1+4im))
println(sametype(1.0+2.0im,3.1+4.0im))


# Making sure myappend appends data of the same type
myappend(v::Vector{T}, x::T) where {T} = [v..., x]
y=myappend([1,2,3],4)

w=myappend(["stop","forword","slow"],"reverse")

w[3]
