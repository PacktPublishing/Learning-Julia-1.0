# julia1_4.1.jl  Basic Stream I/O
#
# well depth example with file i/o
# constants
using Printf
g= 9.807 # acceleration due to gravity m/s^2
vs= 343.21 # velocity of sound in air m/s 20˚C
# (depth,tv)=well(t)  judging well depth using a rock
function well(t)
  tdn = (-vs + sqrt(vs^2 + 2.0*g*vs*t))/g
  tup = t - tdn
  depth = vs*tup; termvel=g*tdn
  return (depth,termvel)
end
t=5.0       # seconds from drop to ear
(d,tv)=well(t)
println(t," ",d,"  ",tv)
#rounding results
rd=(round(d*10))/10.0
rtv=(round(tv*10))/10.0
println("depth $rd meters")
println("terminal velocity $rtv meters/second")
# could also use @printf() macro for C printf
@printf("depth %6.1f meters",d)
@printf("%6.1f,%6.1f,%6.1f\n",t,d,tv)
#
###
#
win=open("wellin.dat","r")
wout=open("wellout.csv","w")
@printf(wout,"   Time  Depth Speed  Place\n")
@printf(wout,"   sec     M    M/s   CA/USA\n")
while true
  s=readline(win)
  if(s==""); break; end
  st=split(s)
  t=parse(Float64,st[1])
  (d,tv)=well(t)
  @printf(wout,"%6.1f,%6.1f,%6.1f %-22s\n",t,d,tv,st[2])
end
println("done")
close(win)
close(wout)
# other printf formats designators:
#
# many system-like directory functions
# examples:
pwd() # path to current working directory
readdir() # list of files/directories in working directory

stat("wellin.dat") # yields string, list of file parameters
# mode=6 Owner R&W, =4 Group R only, =4 Others R only
# uperm(file) user permission, gperm(file) group permission
# operm(file) other permission

chmod("wellout.csv",0o664)
stat("wellout.csv")
