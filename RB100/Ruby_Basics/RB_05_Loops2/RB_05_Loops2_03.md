## Conditional Loop
#### Write an `if/else` statement that executes some code if the `process_the_loop` variable is `true` and some other code when `process_the_loop` is `false`. Specifically:
- When `process_the_loop` is `true`, execute a loop that iterates exactly once and prints `The loop was processed` during that iteration.
- When `process_the_loop` is `false`, just print `The loop wasn't processed!`.

Use the following code to initialize `process_the_loop`. It will randomly assign the variable to either `true` or `false`.

`process_the_loop = [true, false].sample`
___
#### Solution
```ruby
# SOLUTION 1.

loop do
  process_the_loop = [true, false].sample
  if process_the_loop
    puts 'The loop was processed'
    break
  else
    puts "The loop wasn't processed!"
  end
end


# SOLUTION 2. USING LS HINT.

if process_the_loop
  process_the_loop = [true, false].sample
  loop do
    puts 'The loop was processed'
    break
  end
else
  puts "The loop wasn't processed!"
end
```
___
#### Solution, LS
Same solution as mine after using LS hint.
#### Discussion
The variable given to us, `process_the_loop`, will be assigned randomly to either `true` or `false`. Our goal here is to run the `loop` only if `process_the_loop` evaluates as `true`. We can use an` if/else` statement to accomplish this task.

To run a `loop` that prints `"The loop was processed!"` once, we can simply add a `break` immediately following `#puts` inside `loop`. We don't need to have any sort of counter variable in this case because we only need to print the string once. Then all we need to do is place puts "The loop wasn't processed!" in the else clause. This will print if process_the_loop evaluates as false.

If using a loop in this code seems kind of silly, it is! The main reason for requiring a loop is to get some practice using the loop syntax.
___
#### Notes
