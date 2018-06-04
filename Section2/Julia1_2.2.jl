# julia1_2.2.jl Variables and Scope - Local and Global
#            Static and Dynamic, and Constants
# local vs global
i=0   #(global)
while i==0
    x=π  #(soft local) make global to see outside of while
    i+=1
    println(i)
    println(x)
end
println(i)
println(x)

# "static" type
# state becomes what in C would be called a static type
# It's value persists but is only available inside the let block
# useful for creating pointers in buffers, deques and queues.
let
  state=0
  global counter
  counter() = state+=1
end
println(counter())
println(counter())

# loop indices and externally defined variables local
i=43  # this will be overridden by the loop index
l=66
for i=1:3  # this i is defined in the outer block
    j=i+1  # j is "soft" local to this block and lower
    for k=1:2
        local l #hard local so won't interfere with l=66 global
        l=k+j+i
        println("l",l)
    end
end
println(i) # will override 43
println(l) # note inner for loop l is hard local
println(j) # error j soft local not available to higher level

 # variables defined within functions are hard locals
 # however a nested function with a variable of the same name
 # can modify a parent's variables. Will cover in functions


# constants are like valiables
# however, they will warn you if you override them
const t=43.5
println(t)
t=42

# Built in constants:
π (alias: pi)
e (alias: eu) natural log base
γ (alias: eulergamma) Euler's constant
φ (alias: golden) golden ratio
catalan  Catalan's constant
