### Understanding the Problem
Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

Example text:
```
Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.
```

**Explicit Requirements:**

- Input: A text file.
- Output: A new String.
- File argument contains a text which contains a series sentences.
- Output is the longest sentence in the argument and the number of words in the longest sentence.
- Sentences are delimited by ending periods, exclamation points, or question marks: `.`, `!`, `?`
- Sentence length is determined by the number of words in a sentence.
- Words are any sequence of characters that aren't whitespaces or sentence-ending characters.

**Implicit requirements:**

- Can words be a sequence of only non-alphabetical characters?
  - Yes.
- Are commas considered sentence-ending characters or part of words?
  - Commas are not sentence-ending characters.
  - Commas should be excluded from words.
- How are the beginning of sentences determined?
  - Ending-sentence characters should be treated as delimiters for the sentences.
- How are new lines treated (return carriage characters)?
  - Return carriage characters / new lines should be treated as word delimiters, not sentence-ending characters.
- Is the text considered String objects?
  - 
- How are text files received by the program?
  - `file.readlines` will read the file all at once (**CAUTION**: reading files all at once is called 'slurping' and may lead to host computer running out of memory to allocate).
  - `File.foreach` will read line by line.  (File inherits `foreach` from IO)
  - `IO.foreach` will read line by line.
- Should the program access the entire text at once?
  - No.  Read line by line and build sentences.  Save the current sentence and compare against the next sentence built.

**Mental Model:**

- 

---
### Examples/Tests
```ruby
/four_score.txt
/shelly_mary_frankenstein.txt
```
---
### Data Structures


---
### Algorithm
****
- 

---
### Code
