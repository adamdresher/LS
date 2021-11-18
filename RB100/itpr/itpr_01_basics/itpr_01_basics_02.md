Use the modulo operator, division, or a combination of both to take a 4 digit number and find the digit in the: 
1) thousands place
2) hundreds place
3) tens place
4) ones place

#### MY SOLUTIONS
1. ```x / 1000```

2. ```x / 100 % 10``` Removes last 2 digs, then returns new last digit.
```x % 1000 / 100``` Removes first digit, then removes last 2 digits.

3. ```x / 10 % 10``` Removes last digit, then returns new last digit.
```x % 100 / 10``` I hadn't thought of this!

4. ```x % 10``` returns last digit.