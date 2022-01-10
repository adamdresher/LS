## Colorful Things
#### The following code throws an error. Find out what is wrong and think about how you would fix it.
```ruby
colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i > colors.length

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end
```
___
#### Solution
The problem is that the two arrays have different lengths but the loop block requires them to be the same.  Currently there are 8 colors and 7 things.

A solution to this is:
```ruby
# SOLUTION 1.  Breaks once reaching the end of either array.
colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i >= colors.length || i >= things.length

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end


# SOLUTION 2.  Breaks after reaching the end of both arrays.
# Make separate variables for indexing `colors` and `things`.
# Cycle back to index `0` if variable equals `Array#length`.
# Check if an array has cycled back.
colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

c = 0
t = 0
finish_up = false

loop do
  break if (c >= colors.length || t >= things.length) && finish_up == true

  if c == colors.length then c = 0 ; finish_up = true end
  if t == things.length then t = 0 ; finish_up = true end

  if (c == 0 || t == 0) && finish_up == false
    puts 'I have a ' + colors[c] + ' ' + things[t] + '.'
  else
    puts 'And a ' + colors[c] + ' ' + things[t] + '.'
  end

  c += 1
  t += 1
end
```
___
#### Solution, LS
```ruby
colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i > things.length - 1

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end
```
#### Discussion
The above solution uses the length of the shorter `things` array to determine whether to break from the loop or not, and stops as soon as i has a value greater than the last array index.
#### Further Exploration
We might change our arrays in the future and we might not always know which of them is shorter, so picking the shorter one by hand is not the best solution. How can you change the `break` condition, such that the loop always stops once we hit the end of the shorter array?
___
#### Notes
