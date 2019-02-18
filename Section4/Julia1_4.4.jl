
# julia1_4.4.jl Perceptron Part 2
# using UCI Machine learning laboratory data
# you need to know your training/test data
# it generally doesn't come in a ready-to-use form
# This sonar data is 60 magnitudes in a time sequence
#  followed by a letter M=mine and R =rock
# read in training data
# Create Sonar Data Set
using Printf, Random, LinearAlgebra
numsonar=208   # total number of sonar sweeps
trainln=138    # number of training samples
testln=numsonar-trainln  # number of test samples
burstln=60     # sonar echo burst length
#
traindata=Array{Float64}(undef,trainln,burstln)
trainlabel=Array{Int32}(undef,trainln)
testdata=Array{Float64}(undef,testln,burstln)
testlabel=Array{Int32}(undef,testln)
#
function create_sonar_data_arrays()
    global traindata, trainlabel, testdata, testlabel
    sdata=Array{Float64}(undef,numsonar,burstln)
    stype=Array{Int32}(undef,numsonar)
    sonardata=zeros(Float64,burstln)
    f1=open("sonar-data.csv","r")
    for i=1:numsonar
        sonarlist=split(readline(f1),",")
        stype[i]=Char(sonarlist[burstln+1][1])
        sdata[i,:]=parse.(Float64,sonarlist[1:burstln])
    end
    # randonize and partition training from test data
    seq=randperm(numsonar) # create random index sequence
    for i=1:numsonar
        sonardata[:]=sdata[seq[i],:]
        sonartype=(stype[seq[i]]==Int32('M')) ? 1 : 0
        if i <= trainln
            traindata[i,:]=sonardata
            trainlabel[i]=sonartype
        else
            testdata[i-trainln,:]=sonardata
            testlabel[i-trainln]=sonartype
        end
    end
    close(f1)
end
create_sonar_data_arrays()
#
###
#
# Training module
inputsets=traindata
labels=trainlabel
# parameters
epocs=2000
global learning_rate=.00045 #learning_rate can also be a function that
        # decreases with increasing epochs eg. (1.0/(1.0+log10(epoch#)))
global bias=0.0
global weights=zeros(Float64,burstln)  #could also be randn(Float64,burstln)

# prediction function

predict(sinput,weights,bias) = sinput'*weights + bias > 0.0 ? 1 : 0

# training
function train(inputsets,weights,bias)
    sinput=zeros(Float64,burstln) # will be sonar input sample
    save_weights=zeros(Float64,burstln)
    save_bias=0.0
    last_serror=70
    for i=1:epocs                 # loop through epochs
        score=0
        error=0.0
        serror=0.0
        seq=randperm(trainln)
        lr=learning_rate   # *(1.0/(1.0+log10(i)))
        for j=1:trainln
            sinput[:] = inputsets[seq[j],:]
            p = predict(sinput,weights,bias)
            if p != labels[seq[j]]
                error=labels[seq[j]]-p # either 1 of -1 (could also be the
                               # actual amount that crosses zero in predict)
                serror+=error^2        # number of misses (or actual ∑miss^2 of 0)
                weights .+= lr * error .* sinput
                bias += lr * error
            else
                score+=1
            end
            #println(seq[j]," ",p," ",labels[seq[j]]," ",error," ",sinput[1]," ",weights[1]," ",bias)
        end
        if serror<last_serror
            @printf("epoch=%4d, perscore=%5.1f, serror=%5f1\n",i,score*100.0/trainln,serror)
            last_serror=serror
            save_weights=weights
            save_bias=bias
        end
    end
    return (save_weights,save_bias)
end
(weights,bias)=train(inputsets,weights,bias)

#
###
#
# test the new estimated weights and bias
inputsets=testdata
labels=testlabel

function test(inputsets,weights,bias)
    sinput=zeros(Float64,burstln) # will be sonar input sample
    error=0
    serror=0
    score=0
    for j=1:testln
        sinput[:] = inputsets[j,:]
        p = predict(sinput,weights,bias)
        if p != labels[j]
            error=labels[j]-p
            serror+=error^2
        else
            score+=1
        end
        #println(seq[j]," ",p," ",labels[seq[j]]," ",error," ",sinput[1]," ",weights[1]," ",bias)
    end
    @printf("perscore=%5.2f, serror=%3d\n",score*100.0/testln,serror)
end
test(inputsets,weights,bias)
