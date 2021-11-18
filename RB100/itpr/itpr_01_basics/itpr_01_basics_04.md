Use the dates from the previous example and store them in an array. Then make your program output the same thing as exercise 3.

##### MY SOLUTION
```
movies = {  # don't forget the commas when listing hash-keys.
  the_goonies: 1985,
  city_of_god: 2002,
  the_jungle_book: 1967,
  pulp_fiction: 1994,
  momento: 2000
}

movies_array = movies.collect{ |t, d| d }
puts movies_array
```