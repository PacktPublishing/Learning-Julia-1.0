# Julia1_3.3.jl Tasks/Coroutines and Channels
#
# Using Tasks
s1() = sum(i for i=1:1000000) # function to sum 1 to 1000
s1() = sum(1:1000000)         # shorthand for the same thing
st=Task(s1)       # turn function s1 into task st
schedule(st)      # schedule task to run
istaskstarted(st) # true if started

istaskdone(st)    # true if done

st.result    # get results

# returns name and address of currently running task
current_task()
# yield() causes the scheduler to switch to the
# next scheduled Task.
# yield() if called by a task, will restart that task
yield()


# Using Channels using a coroutine
in1=open("data1.csv") # Opening a test data file
c=Channel{Int64}(16)  # defining a 16 word FIFO buffer
function getdata()    # defining a function getdata() a coroutine
    while true        # inf while loop
        s=readline(in1)             # read line as String
        if length(s)==0; break; end # if null loop done
        v=[parse(Int64,ss) for ss in split(s)] #Int64 vector
        for n in v; put!(c,n); end  # put ea # in channel c
    end
end
gt=Task(getdata) # make getdata into a task
schedule(gt)     #schedule it
if isready(c); take!(c); end         # take an Int64 from channel c

current_task()   # what is the currently running task

close(in1)       # Close data file
