What will the following programs return? What is the value of arr after each?
```
1. arr = ["b", "a"]
   arr = arr.product(Array(1..3))
   arr.first.delete(arr.first.last)

2. arr = ["b", "a"]
   arr = arr.product([Array(1..3)])
   arr.first.delete(arr.first.last)
   ```

##### MY SOLUTIONS
1. ```arr = arr.product(Array(1..3))``` muatates and returns ```[["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]```.
This means, ```product``` is selecting the elements within both arrays and returning every combination.
   
```arr.first.delete(arr.first.last)``` returns ```1```.
The mutated value of ```arr``` then becomes ```[["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]```.
The argument ```(arr.first.last)``` selects ```["b", 1]``` with ```arr.first```, then ```last``` selects an element within ```["b", 1]``` and returns ```1```.  With ```1``` as the parameter for ```arr.first.delete```, ```arr.first``` selects the first element within ```arr``` and ```delete(1)``` deletes the second element within ```["b", 1]```.
   
2. ```arr = arr.product([Array(1..3)])``` mutates and returns ```[["b", [1, 2, 3]], ["a", [1, 2, 3]]]```.
This means, ```product``` is combining each element with ```arr``` while treating ```Array(1..3)``` as a single element (due to the square brackets assigning it as a single element within a new array).
   
```arr.first.delete(arr.first.last)```returns ```[1, 2, 3]```.
The mutated value then becomes ```[["b"], ["a", [1, 2, 3]]]```.
