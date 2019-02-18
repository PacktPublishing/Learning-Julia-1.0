# Julia1_1.1.jl Why Learn Julia?
# running OS utilities using run() and read()
pwd()
run(`echo hello`)  # note (`) is a backtick`
files=String(read(`ls`))
files=split(files,"\n")
println(files)

# Compact
using LinearAlgebra
x = [1 2; 3 4]
y = x^2 .+ 3x .+ 1.1       # .+ corresponding component ops

eye=[1 0; 0 1.0] # unit matrix
z = eye/y                  # matrix inversion

# Notice compactness when working with matrices
# In this example several nested loops are needed in C
# the simple formula representation would also be lost.
# also notice implicit multiplication for constant

x=2.1+3.2im # complex floating-point number
# versatile polymorphic type system

# built in Int8-Int128, UInt8-UInt128, Float16-Float64
# other compound types made from these
# designed for linear algebra
# automatic conversions and promotions

# There is no meaningful concept of compile-time type,
# all types are actual at runtime.
# Only values, not variables have types.

# multicore parallel example, 1=head, 0=tail
# How many cores do we have>
Sys.CPU_THREADS

using Distributed
  heads = @distributed (+) for i=1:200000000
  Int(floor(rand()+0.5))
end
print(heads,"\n")

# Calling a c lib function
#using Distributed already called
t1=ccall((:clock, "libc"), UInt32,())
heads = @distributed (+) for i=1:200000000
  Int(floor(rand()+0.5))
end
print(heads,"\n")
t2=ccall((:clock, "libc"), UInt32,())
print((t2-t1)/1000000.," seconds\n")
# Don't need the C clock function since Julia has a
# @time macro and other timing operations.

# unicode characters in strings
s="abπ∑ef\n"
print(s)

# ok to use unicode characters in formulas
# generally Roman and Greek characters
ß=2π/3
µ=3+3.3im
Y=[1 2im; 3.3 6+4im]
Q = π*µ .+ ß*Y^2

# the C swap macro in Julia might be:
macro swap(a, b) # this will work for any type also mixed 
    quote 
        local temp=$(esc(a)) 
        $(esc(a))=$(esc(b))
        $(esc(b))=temp
    end
end
# Don't need swap macro
a,b=b,a

# metaprogramming machinery exposed to the user in Julia
# eval(), Expr(), parse(), Symbol(), typeof(), Regex()

# always check what Julia has to offer before rolling
# your own functions, macros and extensions.
