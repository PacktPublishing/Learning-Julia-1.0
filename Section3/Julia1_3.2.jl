# Julia1_3.2.jl  Looping Control Structures
#
# while loops keeps evaluating body of loop
#   until condition is false
# as with other blocks value defined in block
#    is not available in outer blocks
#    but is available to a nested inner blocks
i=0
while i<26
    global i
    print('A'+i)
    i+=1
end

# for loop
# i steps through <range> 0 to 25 by 1
# loop index not available outside loop block
for i=0:25
    print('a'+i)
end

# i steps through range by 2s*
for i=0:2:25
    print('a'+i)
end

# for can loop over any container
for i in [2,0,19]
    print('a'+i)
end

# The word <break> will exit a <while> or <for> loop
# This is useful for iterations that can terminate
#   early either because it is diverging or
#   has converged below an error bound.
i=0
while i<26
    global i
    print('A'+i)
    i+=1
    if i>5; break; end
end

# <continue> key word skips to next loop start
# in a for loop
for i=0:25
    2<i<23 && continue
    print('a'+i)
end

###

# nested <for> loops for matrices and in general
M=Array{Int,2}(undef,3,3)
(d1,d2)=size(M)
for i=1:d1, j=1:d2
    global M
    M[i,j]=i*j
end
println(M)

# exception handling
# try <do something>
# catch <if error, handle it>
# end
function fsqrt(x)
    try; sqrt(x)
    catch; sqrt(Complex(x,0))
    end
end
fsqrt(-4)

# <throw> your own error
# there is a list of 35 Built-in exceptions
#  but you can add your own if you don't find
#  it on the list
f(x)= x≥0 ? exp(-x) : throw(DomainError(x, "arg must be non-negative"))
#
f(-1)
f(1)
