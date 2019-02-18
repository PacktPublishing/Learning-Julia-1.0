# Julia1_2.5.jl Strings (Unicode and UTF-8)
#
# ASCII is preserved in the first 128
#  characters of UTF-8 so only 1 byte necessary
# A UTF-8 encoding can take 1 to 4 bytes in a UTF-8 String
#  to get the size in bytes:
sizeof("∑")  # ∑ is upper case sigma

s1="abcπ∑d" # UTF-8 String type
println(sizeof(s1))   # Number of bytes

hg=80
s2=string("xy",3,Char(0x3B1),false,s1,hg) # function converts UTF-8
println(s2)
println(sizeof(s2))   # Number of bytes
println(length(s1))   # number of characters
# translate a UTF-8 string to a vector of UInt8,
#  UInt16, UInt32 or vice-versa
s="abcde"
t=transcode(UInt8,s)

a1=ascii(s)  # Will convert to an ascii string or error
#    if non-ascii (used to send strings to a C routine)
a1=ascii(s1) # will report invalid ascii character

println(s1)
a2=transcode(UInt32,s1)  # can make 32-bit Char Vector.
println(a2)
println(sizeof(a2))   # Number of bytes
println(length(a2))   # number of 32-bit character


# Char() can be used to check out unicode characters to see
#    if they are what you want
#  I always use the hexadecimal representations of the Unicode
Char(0x3B3)
'γ'  # to see the hex Unicode for a character
Char(0x3C6)
Char(0x3C9)  # Greek alphabet 0x3B1 through 0x3C9.
Char(0x263A)
