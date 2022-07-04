### Understanding the Problem
Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

**Explicit Requirements:**

- Input: A string.
- Return: An array of string elements.
- Return array's all substrings of argument which are palindromic.
- Duplicate palindromes found shoud be returned.
- Palindrome values should appear in the order they are found.
- Can use methods made in previous exercises.
- All characters should be considered.
- The method should be case-sensitive.
- Single characters are not considered palindromic.

```ruby
def substrings(string)
  string.chars.map.with_index do |_, outer_i|
    set = string.chars[outer_i..]

    set.map.with_index { |_, inner_i| set[..inner_i].join }
  end.flatten
end
```

**Implicit requirements:**

- How should arguments without any palindromes found be handled?
  - Return an empty array.

**Mental Model:**

- Create a method that takes a string argument.  Iterate through its characters and return an array of substrings using each iteration's return value as an element.  On each iteration, set the current element as a starting index, `current_start`.  Iterate through the argument again and return an array of elements using the block's return values as elements.  On each inner iteration, create a string using the argument's substrings from `current_start` to the inner iteration's current element.  If the new string matches itself in reverse order, use it as an element for inner iteration's return array.  After both inner and outer iterations are complete, flatten the array.  Return the array.

- Create a method that taks a string argument.  Use the argument to create an array of all substrings combinations.  Iterate through the array and elect all elements that are the same in reverse.

---
### Examples/Tests
```ruby
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
# # Further Exploration
p palindromes('hello-madam-did-madam-goodbye', true) == [
"ll", "-madam", "-madam-", "-madam-did-madam", "-madam-did-madam-", "madam", 
"madam-", "madam-did-madam", "madam-did-madam-", "ada", "adam-did-mada", 
"dam-did-mad", "am-did-ma", "m-did-m", "-did", "-did-", "did", "did-", 
"-madam", "-madam-", "madam", "madam-", "ada", "oo"
]
p palindromes("ab434ba?@RakaraK", true) == [
 'ab434ba', 'ab434ba?', 'ab434ba?@', 'b434b', '434', 'a?@Ra', 'a?@Rakara', 
 '?@Rakar', '@Rakar', 'Rakar', 'aka', 'karaK', 'ara'
]
```
---
### Data Structures
String.
Array.

---
### Algorithm
**palindromes(string)**
- take a string argument
- pass argument into `substrings`
  - return an array of substrings
- iterate through the array and select elements:
  - if element == element.reverse
    - select
- return array

---
### Code
*see `05_palindromes.rb`*
