# julia1_1.4.jl Julia Resources
#
Pkg.add("GLM")
using GLM
using DataFrames
data=DataFrame(x=[1.0,2.0,3.0],y=[2.0,4.0,7.0])
OLS=glm(@formula(y ~ x), data, Normal(), IdentityLink())
X=4.0
Y=2.5X-0.666667
