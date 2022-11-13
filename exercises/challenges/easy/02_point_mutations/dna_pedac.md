#### Problem
Create a program that calculates the Hamming distance between 2 DNA strands.
- DNA strands are strings of letters
- Hamming distance is the total number of different characters one DNA strand has compared to another
- if DNA strands are of unequal length, comparison stops at the shorter length

#### Examples

```
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
```

There are 7 different characters resulting in a Hamming distance of 7.

#### Data Structure
- create an Array of characters (nucleotide) for each DNA strand

#### Algorithm
- class PointMutations
  - `#initialize`
    - takes 1 string argument
    - initialize an instance variable to an Array of argument's characters
  - `#hamming_distance`
    - take 1 string argument
    - identify shorter and longer dna strands: argument and caller's dna strand 
    - iterate through shorter DNA strand with index
      - compare current nucleotide with nucleotide from other DNA using current index
      - count number of occurrences that don't match
    - return number of occurrences that don't match
