## Favorite Number (Part 2)
#### In the code below, a nested array containing three groups of names and numbers is assigned to favorites.
```ruby
favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
```
Flatten and print this array. That is, the printed result should not have any subarrays, but should have all of the original strings and numbers from the original array:

Expected output:

`["Dave", 7, "Miranda", 3, "Jason", 11]`
___
#### Solution
```ruby
favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]

p favorites.flatten
```
___
#### Solution, LS
```ruby
flat_favorites = favorites.flatten

p flat_favorites
```
#### Discussion
Using `Array#flatten` is pretty straightforward. It returns a new array that is a one-dimensional flattening of the original array. In our solution, we assigned the new array to `flat_favorites` and printed it using `#p`. Lets try printing `favorites`, the original nested array:

```ruby
flat_favorites = favorites.flatten

p flat_favorites # ["Dave", 7, "Miranda", 3, "Jason", 11]
p favorites      # [["Dave", 7], ["Miranda", 3], ["Jason", 11]]
```
That array doesn't look the same as `flat_favorites`. Why is that? There's actually two versions of the `#flatten` method. One with a bang suffix (`!`) and one without. Let's see what happens when we use `#flatten!` instead of `#flatten`:

```ruby
flat_favorites = favorites.flatten!

p flat_favorites # ["Dave", 7, "Miranda", 3, "Jason", 11]
p favorites      # ["Dave", 7, "Miranda", 3, "Jason", 11]
```
They're both the same now. This is because `#flatten!` modifies the original array while `#flatten` only returns the modified version.
___
#### Notes
