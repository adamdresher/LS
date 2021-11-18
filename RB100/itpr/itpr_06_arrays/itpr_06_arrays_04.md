What does each method return in the following example?
```
arr = [15, 7, 18, 5, 12, 8, 5, 1]

1. arr.index(5)

2. arr.index[5]

3. arr[5]
```

##### MY SOLUTIONS
1. ```3```
```index``` returns the index for the argument given, but only the first occurance.

2. ```NoMethodError```
This is because the syntax is incorrect.  ```index``` expects paratheses for its argumeent.

3. ```8```
This calls the array to return an element with a specified index.
