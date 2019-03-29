# julia1_2.3.jl Primitive, Abstract and Composite Types
#
# Primitive Types
# Integer Types with maxnumber
println(Int8(127))
println(UInt8(255))
println(Int16(32767))
println(UInt16(65535))
println(Int32(2147483647))
println(UInt32(4294067295))
println(Int64(2)^63-1)
println(UInt64(2)^64-1)
#  Int is default for Int64 if a 64 bit CPU else 32
# UInt is default for UInt64 if a 64 bit CPU else 32
println(Int128(2)^127-1)
println(UInt128(2)^128-1)
println(BigInt(2)^2046-1)

# floating point Types and irrational numbers
# Float16 to Float64 and BigFloat
println(Float16(π))  # 11 bits of precision
println(Float32(π))  # 24 bits of precision
println(Float64(π))  # 53 bits of precision
println(BigFloat(π)) # 256 bits of precision - normally
precision(BigFloat)
println(π)           # irrational number cannot be represented as a rational
BigFloat(π)          #Bigfloat defaults to 256 binary places ~77 decimal places
BigFloat(π,500)      # 500+ bits of precision

# complex numbers
println(Complex{Float16}(π+2π*im)) # 11 bits precision each part
println(Complex{Float32}(π+2π*im)) # 24 bits precision each part
println(Complex{Float64}(π+2π*im)) # 53 bits precision each part
# full gamut of elementary functions work on complex numbers
# Complex shortcuts
ComplexF16(3.1+3.2im)  # Alias for Complex{Float16}()
ComplexF32(3.1+3.2im)  # Alias for Complex{Float32}()
ComplexF64(3.1+3.2im)  # Alias for Complex{Float64}()
Complex(3.1+3.2im)     #default for ComplexF64 if 64 bit CPU else ComplexF32

# Rational numbers
# used for exact arithmetic
# for example 1/3 cannot be represented exactly by any
#  floating point number.
# 1//3 represents the rational number 1/3 exactly
a = 1//3 + 2//5 - 3//7
b = (22//7)*(5//13)
c = ((22//7)/2)^2
print("a=$a, b=$b, c=$c")
Rational(3.875) # Make a rational fraction out of a Float
Rational(3.825) # a repeating binary pattern so not exact, use rationalize() function
BigFloat(3.825) # gives wrong precision due to prior conversion step
BigFloat(3825//1000) # or
BigFloat("3.825")
