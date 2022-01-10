## Pets
#### Magdalena has just adopted a new pet! She wants to add her new dog, Bowser, to the `pets` hash. After doing so, she realizes that her dogs Sparky and Fido have been mistakenly removed. Help Magdalena fix her code so that all three of her dogs' names will be associated with the key `:dog` in the `pets` hash.
```ruby
pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog] = 'bowser'

p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}
```
___
#### Solution
```ruby
# SOLUTION 1.  EXPLICIT ASSIGNMENT.
pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog] = ['bowser', `sparky`, `fido`]


# SOLUTION 2.  USING `#store`.
pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets.store(:dog, ['sparky', 'fido', 'bowser'])
```
___
#### Solution, LS
Magdalena used element assignment to re-assign the value associated with the key `:dog`. Instead, she intended to access the list of dog names associated with the key `:dog` and add an element to it.
```ruby
pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog].push('bowser')

p pets #=> {:cat=>"fluffy", :dog=>["sparky", "fido", "bowser"], :fish=>"oscar"}
```
#### Discussion
Using element reference, we can access the value associated with the key `:dog`.
```ruby
pets[:dog] #=> ['sparky', 'fido']
```
Because the returned value is an array, we can use the `Array#push` method to append an additional element (in this case, the String `'bowser'`) onto the end of the list.
___
#### Notes
My initial expectation was that `Hash[] = []` would create a nested hash, however this presumption is wrong.

I must remember to check what a method is outputting, so I can be aware of what methods can be invoked by that value.  Here's an instance where I completely ignored that `Array` methods are at our disposal.
