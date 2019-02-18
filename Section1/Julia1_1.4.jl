# julia1_1.4.jl Julia Resources
# GLM Generealized Linear Model
#Pkg.add("Gadfly")
#using Gadfly
#Pkg.add("DataFrames")
#Pkg.add("GLM")

using Gadfly
using DataFrames, GLM


data=DataFrame(x=[0.9,2.0,3.0],y=[2.0,4.0,6.5])
ols=glm(@formula(y ~ x), data, Normal(), IdentityLink())
c=coef(ols)
#  y=c[1]+c[2]*x
#  y=-0.0370091 + 2.13746*x
plot(data,x=:x,y=:y,Geom.point,intercept=[c[1]],slope=[c[2]],Geom.abline(color="red",style=:dash))


using GLM, DataFrames
data=DataFrame(x1=[0.9,2.0,3.0,3.9],x2=[0.291,0.210,0.105,0.021],y=[2.0,4.0,6.5,7.9])
ols=glm(@formula(y ~ x1 + x2), data, Normal(), IdentityLink())

coef(ols)
stderror(ols)
predict(ols)
