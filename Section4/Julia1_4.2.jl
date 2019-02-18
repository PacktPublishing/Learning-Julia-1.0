# julia1_4.2.jl Vector and Matrix Operations
#
# Most of the math functions work equally well on Vectors
# and matrices.
# The same goes for operations but some need a preceding
# dot (.) to be corresponding element by element ops
# Those include .* .+ .- .% ./ .\ and .^ or any op with otherwise
#  different normal vector/matrix behavior. .+ and .- were enforced
#  recently for clarity of intent.
#  library functions that are operating on element-wise also require a dot
# The following types have a variety of elementary
# operations and functions with optimized methods:
# Type	            Description
# Diagonal	        Diagonal matrix
# Hermitian	        Hermitian matrix - Square, self conjugate
# UpperTriangular	Upper right triangular matrix
# LowerTriangular	Lower left triangular matrix
# Tridiagonal	    Tridiagonal matrix
# SymTridiagonal	Symmetric tridiagonal matrix
# Bidiagonal	    (true)Upper/(false)Lower bidiagonal matrix

# In addition, The LAPACK library is available.
# and a large variety of matrix factorizations

# Examples:
using LinearAlgebra
A = [2.5 2 -4; 3 -1 -6; -10 2.3 4.4]
println(eigvals(A))
println(eigvecs(A))
# 3 ways to get an inverse
Ainv=inv(A)
A^-1
A\I  # I is the identity/uniform-scaling operator
# checking out the inverse
A*Ainv

Am1=A^2 .+ exp.(A) .- 1

B = [2.5 2 -4; 2 -1 -3; -4 -3 4.4]
sB=Symmetric(B)  # less computation
# solve for x in sB*x=v linear system of equations
v=[1.0,2,3]
x=sB\v
println(x)  # Linear Solutions
#
###
#
# more than 12 different factorizations are available
# Single Valued Decomposition SVD
#
(U,S,V)=svd(B)  # such that U*diagm(S)*V'
println(U)      # Matrix
println(V)      # Matrix
println(S)      # Vector diagonal of matrix
println(U*Diagonal(S)*V') # V' transpose of matrix V
#
# LU decomposition L=lower triangular part,
# U=upper triangular part, p= permutation vector
(L,U,p)=lu(B)
println(L)  # lower triangle
println(U)  # upper triangle
println(p)  # permutation vector for rows
println((L*U)[p,:]) # rearrange rows by p

# Make a random Matrix
R=rand(3,3) .+ Diagonal([1.0, 1, 1])  # random matrix R + unit diag. matrix
Ri=inv(R)            # now invert it

# Sparce matrices - type=SparseMatrixCSC Compressed Sparce Cols
#        colVec       rowVec       Data
using SparseArrays
#          row index    col index    values
S=sparse([1, 2, 3, 3],[1, 3, 1, 2],[3, 3, 2, 0])
S=dropzeros(S)
R=S*I
R*rand(3,3)
