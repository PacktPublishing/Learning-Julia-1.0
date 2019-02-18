# julia1_1.3.jl Running Julia.
println("Who are you?")
s=readline()
println("Hello $s and Hello World!")
# Bad name dictionary can be as big as one wants
# and severity of baddness can be designated by the number
badnames=Dict("Dope" => 1, "Knothead" => 1,"Stupid" => 1)
# The bot wants a name
println("Please give me a name for I have none.")
name=readline()
# Is it a bad name or a good name
n=get(badnames,name,0)
if n==0
    println("$name is nice, I will take it." )
else
    println("I think that's not a very nice name.")
    name="Sky"  #could use a random name selector here
    println("I chose the name $name for myself.")
    println("$name is a strong name and I like it.")
end
# after this you could read in sentences
# have a verb and noun dictionary
# match on the verb and the noun and do stuff
# or do the psychiatrist thing and turn their
# responses back into questions.
