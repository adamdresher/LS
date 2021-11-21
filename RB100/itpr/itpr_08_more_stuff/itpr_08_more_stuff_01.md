Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word.

- "laboratory"
- "experiment"
- "Pans Labyrinth"
- "elaborate"
- "polar bear"

##### MY SOLUTION
```
arr = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

def find_lab(words)
  words.each { |string| puts string if string =~ /lab/ else puts "no match" }
end

find_lab(arr)
```
