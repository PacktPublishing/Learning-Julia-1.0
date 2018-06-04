# julia1_2.1.jl Syntax and some simple I/O
#
# Shell Game example (Coconut shells and 1 pea)
# shells are variable names
# under each shell, type with value
# This example shows that variable names are just labels
# they can be made concrete and that will be shown later
# type and data go together as the following will illustrate
a=3
println("a is ",typeof(a))
b=[1 2; 3 4]
println("b is ",typeof(b))
c="pea"
println("c is ",typeof(c))
println("Before: $a, $b, $c")
# we can shuffle these around
a,b,c = b,c,a  #shell game
a,b,c = b,a,c  #where's the pea?
println("After: $a, $b, $c")


# How deep is a well? Use a stopwatch
# dropping a rock and listening for the splash
# depth=.5g*td^2 td=time to reach depth (s=.5a*t^2)
# depth=vs*tu    tu=time sound take from bottom to top
g=9.8065    # acceleration due to gravity
vs=343.0    # m/s velocity of sound
print("drop to Splash time: ") # seconds from drop to ear
st=readline();       #Arg STDIN assumed if left out
t=parse(Float32,st)  #string to Float32 conversion for t
# solve equations by
# EQ1: .5g*td^2 - vs*tu = 0
# EQ2: td+tu=t => tu=t-td subsitute in EQ1 and get
# quadratic .5g*td^2 + vs*td -vs*t = 0  in t1
td = (-vs + sqrt(vs^2 +2.0g*vs*t))/g
tu = t - td
depthu = vs*tu
println("depth $depthu meters\n sound time $tu seconds")
# confirm
depthd = .5g*td^2
println("confirming depth $depthd meters\n fall time $td seconds")
# terminal velocity = g*td
termv = g*td
println("terminal velocity $termv meters/second")


# some simple files IO to read and write CSV text files.
fi1=open("str1.csv")
fo1=open("str2.csv","w")
count=1
while(!eof(fi1))
  row=readline(fi1)
  row="$count,"*row*"\n"
  write(fo1,row)
  print(row)
  count+=1
end
close(fi1)
close(fo1)
println("Done")
