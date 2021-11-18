What method could you use to find out if a Hash contains a specific value in it? Write a program that verifies that the value is within the hash.

##### MY SOLUTION
```
todays_menu = {
  breakfast: ["eggs", "toast", "hashbrowns", "fruit"],
  lunch: ["sandwich", "salad"],
  dinner: ["salad", "pumpkin soup", "garlic bread", "steamed veggies", "rice"],
  second_dinner: "pizza",
  midnight_snack: ["rolled oats", "milk", "bananas"]}

p todays_menu.value?("pizza")
```
