## Confucius Says
#### You want to have a small script delivering motivational quotes, but with the following code you run into a very common error message: `no implicit conversion of nil into String (TypeError)`. What is the problem and how can you fix it?
```ruby
def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'
```
___
#### Solution
The problem is that every `if` statement is evaluated.  So unless `get_quote` is passed the argument `'Einstein'`, the last `if` statement will always return `nil` to `get_quote`.

A solution to this would be redesigning the `if` statements into a `case` block.  Another solution is to use a single `if/elisf/else` statement.
```ruby
# SOLUTION 1.  USING `case`.
def get_quote(person)
  case person
  when 'Yoda'
    'Do. Or do not. There is no try.'
  when 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  when 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'


# SOLUTION 2.  USING `if/elsif/else`.
def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  elsif person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  elsif person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  else
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'
```
___
#### Solution, LS
There are several ways to fix this. One is to add explicit `return` statements:
```ruby
def get_quote(person)
  if person == 'Yoda'
    return 'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    return 'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    return 'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end
```
An alternative is to refactor the three `if` statements into one and rely on the implicit return value of our method:
```ruby
def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  elsif person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  elsif person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end
```
#### Discussion
Since our original code did not have an explicit `return` statement, the return value is the evaluated result of the last line executed. The last line is an `if` statement, which returns the evaluated result of the branch whose condition evaluates as `true`, or `nil` if there is no such branch. When we passed `'Confucius'` or `'Yoda'` in as the argument, the condition `person == 'Einstein'` evaluated to `false`, so the last `if` statement evaluated to `nil`. This caused our original method to return `nil` every time an argument other than `'Einstein'` is passed in.
___
#### Notes
