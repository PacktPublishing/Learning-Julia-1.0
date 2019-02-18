# Julia1_2.4.jl Operators and Elementary Math Functions
#
#Operators + - * / \ ^
e=Base.MathConstants.e
a=2//3 + 3.4*π/e
b=(3//4)^2 - 55\5  # x=a\b is x=b/a

V=[1, 2, 3]    # vector
3V

M=[1 2; 3 4] # 2x2 matrix
Y=3M         # * implied, 3* each entry

Z1=M/3  # matrix M divided by 3
Z2=3\M  # divide into -- same result

W1=(3+3im)\M
W2=(3+3im)W1
# op= Operators
i=0
i+=1
M*=2 # Stays integer, all antries times 2
M.-=1 # Stays integer, -1 from each entry
M*=2.0 # now floating, all entries * 2.0
# Special functions for complex numbers
real(1+2im)
imag(1+2im)
conj(1+2im)

# Basic function library
d=3+3im
a=sqrt(d)
a^2

# notice sqrt(-1) gives an error
sqrt(-1)
# but sqrt(-1 + 0im) works

a1=abs(1+2im)
a2=abs2(1+2im)
a3=sqrt(-1+0im)
a4=sqrt(-1+2im)
a5=sin(1+2im)
a6=cosh(1+2im)
a7=exp(1+2im)
a8=log(1+2im)

# Miscellaneous functions for Ints and Floats
# also round(x), floor(x), ceil(x), trunc(x),
# rem(x,y), mod(x,y), gcd(x,y), lcm(x,y) and many variations
# also hypot(x,y) hypotenuse, cbrt(x) cube root,
# various log  and exp functions
println(ceil(4.3))
println(round(4.3))
println(floor(4.3))
println(hypot(3,4))
println(cbrt(27))
#
