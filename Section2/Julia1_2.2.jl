# julia1_2.2.jl Variables and Scope - Local and Global
#            Static and Dynamic, and Constants
# local vs global
i=0   #(global)
while i==0  # ok since being read
    global i  # because being written below
    x=π  #(soft local) needs global to see outside of while
    i+=1      # need the global since being written
    println(i)
    println(x)  # x is local
end
println(i)
println(x) # error since x is local in while

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
i=43  # these will NOT be overridden by the loop index i and local l
l=66
for i=1:3  # this i is "soft" local so won't interfere with global i
    j=i+1  # j is also "soft" local to this block and lower
    for k=1:2
        local l #hard local so won't interfere with l=66 global
        l=k+j+i
        println("l",l)
    end
end
println(i) # 1:3 will not override 43
println(l) # note inner for loop l is hard local
println(j) # error! j soft local not available to higher level

 # variables defined within functions are hard locals
 # however a nested function with a variable of the same name
 # can modify a parent's variables. Will cover in functions


# constants are like valiables
# however, they will warn you if you override them
const t=43.5
println(t)
t=42   # warning error

# Built in constants:
π #(alias: pi)
# CODATA.jlexp(1) package has 350 physics constants
const e=2.718284590452353602874713526624977572470937
