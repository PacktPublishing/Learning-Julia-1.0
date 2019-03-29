# Julia1_3.1.jl  Conditional Control Structures
#
# Boolean values are
true, false # are Boolean values (type Bool)
#   (one byte values that are 1 or 0).
# Flow control - Conditionals if-block
# if-elseif-else-end can be nested to any level
x=2; y=1
if x<y
    println("x is less than y")
elseif x>y
    println("x is greater than y")
else
    println("x is equal to y")
end

# you can have a chain of elseifs for
# handling different cases

# watch out for x=1//3; y=1/3, won't be equal
# however rationalize(1/3)==1//3
# 1 ≈ 0.999999999 where ≈ means approximately equal
# 3.825==153/40 this is false
# 3.825≈153/40  this is true

# one liner conditional borrowed from C
# cond? true-expr:false-expr
x=-2
y = x<0 ? -x : x  # gets absolute value of x
# same as y=abs(x)

# other one liner conditional executions
# if <cond>; <expression>; end can be reduced to:
#  where && read as "and then"
x=-3
x<0 && (x=-x) # if x<0 and then x set to -x
# if !<cond>; <expression>; end   can be reduced to:
#  where || read as "or else"
x=-4
!(x<0) || (x=-x) # if not x<0 bypass else x set to -x
# in this case both perform x=abs(x)

# the above operations use a side effect of eval
# when used in this fashion
#  It can obsfuscate code

# Now as clarity intended.
# logical operator && is "and"
# logical operator || is non-exclusice "or"
# a && b is true, if and only if, both a and b are true.
# a || b is true, if either a or b or both are true.
 3<5 && 7>6  # is true
 3>5 || 2<5  # is true, note had to continue to eval
 3>5 && 7>6  # 3>5 false so needn't eval rest

# numeric(and alphanumeric)comparison operators
# < less than, > greater than, == equal to
# <= or ≤  less than or equal,     ≤ is Char(0x2264)
# >= or ≥  greater than or equal,  ≥ is Char(0x2265)
# != or ≠  not equal,              ≠ is Char(0x2260)
# != or ≠  same as !(x==y) which is often preferred
# many other operators for checking types, etc.

# operators can be chained:
1<2≤2<3==3>2≥1==1<3≠5
# results in true

# logical Operators
# && = AND, || = OR,
# xor(x,y) XOR true if x or y true but not both!
xor(true,true)

x=1; y=2
x<5 && y>2
# false
0.0≤x≤1.0 && 1.0≤y≤2.0
# true
