Write a program called age.rb that asks a user how old they are and then tells them how old they will be in 10, 20, 30 and 40 years. Below is the output for someone 20 years old.


output of age.rb for someone 20 yrs old
```
How old are you?
In 10 years you will be:
30
In 20 years you will be:
40
In 30 years you will be:
50
In 40 years you will be:
60
```

##### MY SOLUTIONS
Solution is in age.rb

```
print "Morty: Hi, I hope this isn't too personal but I require your age.  But how old are you exactly? "

age = gets.chomp.to_i

puts "Morty: Yikes, that means in 10 years you are going to be #{age + 10}."
puts " "
puts "Morty: Yo- you- you know what?"
puts "Morty: In 20 years, you're going to be #{age + 20} years old.  And oowwwww-eee that sounds awful."
puts " "

puts "Morty: Aw gee man.  I hate to mention it, but things are only going to get worse.  In 30 years, you are going to be #{age + 30} years old.  I mean, can you even still feed yourself at that point??  Maybe it's a good time to start thinking over your plans."
puts " "
puts "Morty: O- oh, okay- oh- okay you're really not going to be happy about this one.  But in 40 years, you will be #{age + 40}.  It might not be such a good idea to wait around for that.  Maybe you should take a look at your insurnace plan."
```