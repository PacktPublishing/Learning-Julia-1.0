# julia1_4.3.jl Perceptron Part 1
# using UCI Machine learning laboratory data
# you need to know your training/test data
# it generally doesn't come in a ready-to-use form
# This sonar data is 60 magnitudes in a time sequence
#  followed by a letter M=mine and R =rock
# read in training data
# Create Sonar Data Set
using Random
numsonar=208     # total number of sonar sweeps
trainln=138      # training length after initial randomization
burstln=60       # sonar burst length
testln=numsonar-trainln   # 70 is test length
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
