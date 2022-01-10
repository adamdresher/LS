## Warriors and Wizards
#### We started writing an RPG game, but we already run into an error message. Find the problem and fix it.

```ruby
# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase

player.merge(character_classes[input])

puts 'Your character stats:'
puts player
```
___
#### Solution
There are two problems.  One is that `player.merge(character_classes[input])` is not mutating or reassigning `player`.  This can be fixed by choosing a different `Array` method (`Array#merge!` or its alias `Array#update`) or by reassigning `player`.

The second problem is that `character_classes[]` requires a `Symbol` argument, but is given a `String`.  This can be solved by appending `#to_sym` to `input` either when defining it or when invoking `character_classes[input]`.
```ruby
# SOLUTION.
# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase

player.update(character_classes[input.to_sym])

puts 'Your character stats:'
puts player
```
___
#### Approach/Algorithm
The error message says:
```ruby
rpg.rb:17:in `merge': no implicit conversion of nil into Hash (TypeError)
```
The error message tells us that one of the two hashes we are trying to merge is actually `nil`. If you check both hashes, you'll find that it's `character_classes[input]` that references `nil`. This is because we are trying to access the value of a key that doesn't exist in the hash. Here, we have to be conscious of what the type of object our hash keys are and what the type of object input is.

After addressing this error, the initial player stats still don't seem to have updated. Check out the documentation for `Hash#merge`. The important question here is: Does `merge` mutate the caller (i.e. `player`) and do we use it accordingly?
#### Solution, LS
```ruby
# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then she picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase

player = player.merge(character_classes[input.to_sym])

puts 'Your character stats:'
puts player
```
#### Discussion
When we get user input, it is always a `String`. Our `character_classes` hash, however, uses symbols as keys (recall that `{ warrior: some_value }` is syntactic sugar for `{ :warrior => some_value }`). So we first need to convert the input `String` into a symbol, by means of `String#to_sym`.

Next, `Hash#merge` returns a new hash, so when the expression `player.merge character_classes[input.to_sym]` is evaluated, this does not mutate `player` but instead creates a new hash, which we neither use nor assign to a variable. So, in order to update the `player` hash, we have to either use its mutating sibling `Hash#merge!` or re-assign `player` to the newly created hash as in the shown solution.
___
#### Notes
