# Understanding the Problem:
# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

# Example text:
# Four score and seven years ago our fathers brought forth
# on this continent a new nation, conceived in liberty, and
# dedicated to the proposition that all men are created
# equal.
#
# Now we are engaged in a great civil war, testing whether
# that nation, or any nation so conceived and so dedicated,
# can long endure. We are met on a great battlefield of that
# war. We have come to dedicate a portion of that field, as
# a final resting place for those who here gave their lives
# that that nation might live. It is altogether fitting and
# proper that we should do this.
#
# But, in a larger sense, we can not dedicate, we can not
# consecrate, we can not hallow this ground. The brave
# men, living and dead, who struggled here, have
# consecrated it, far above our poor power to add or
# detract. The world will little note, nor long remember
# what we say here, but it can never forget what they
# did here. It is for us the living, rather, to be dedicated
# here to the unfinished work which they who fought
# here have thus far so nobly advanced. It is rather for
# us to be here dedicated to the great task remaining
# before us -- that from these honored dead we take
# increased devotion to that cause for which they gave
# the last full measure of devotion -- that we here highly
# resolve that these dead shall not have died in vain
# -- that this nation, under God, shall have a new birth
# of freedom -- and that government of the people, by
# the people, for the people, shall not perish from the
# earth.

# Explicit Requirements:
#   Input: A text file.
#   Output: A new String.
#   File argument contains a text which contains a series sentences.
#   Output is the longest sentence in the argument and the number of words in the longest sentence.
#   Sentences are delimited by ending periods, exclamation points, or question marks: `.`, `!`, `?`
#   Sentence length is determined by the number of words in a sentence.
#   Words are any sequence of characters that aren't whitespaces or sentence-ending characters.

# Implicit Requirements:
#   Can words be a sequence of only non-alphabetical characters?
#     Yes.
#   Are commas considered sentence-ending characters or part of words?
#     Commas are not sentence-ending characters.
#     Commas should be excluded from words.
#   How are the beginning of sentences determined?
#     Ending-sentence characters should be treated as delimiters for the sentences.
#   How are new lines treated (return carriage characters)?
#     Return carriage characters / new lines should be treated as word delimiters, not sentence-ending characters.
#   Is the text considered String objects?
#     It is imported as a String.
#   How are text files received by the program?
#     `file.readlines` will read the file all at once (**CAUTION**: reading files all at once is called 'slurping' and may lead to host computer running out of memory to allocate).
#     `File.foreach` will read line by line.  (File inherits `foreach` from IO)
#     `IO.foreach` will read line by line.
#   Should the program access the entire text at once?
#     No.  Read line by line and build sentences.  Save the current sentence and compare against the next sentence built.

# Mental Model:

# Take a String argument referencing a file.  Create longest_sentence to compare against.  Iterate over the file.  On each iteration, import 1 line and add it to sentence_builder.  Check if a delimiter is found.
# When a delimiter is found, remove the sentence and set it to a new_sentence.  Compare the longest_sentence to the new_sentence.  If the new_sentence is longer, use it to replace the longest_sentence.  Next iteration.  When iterations are finished, split the longest_sentence by whitespaces and count the number of words.  Output the number of words and the sentence.

# ---
# Examples/Tests:

# /four_score.txt # => 86 words long
# /shelly_mary_frankenstein.txt # => 157 words long

# ---
# Algorithm:

# output_longest_sentence(filename)
#   initialize longest_sentence to an empty String
#   initialize new_sentence to an empty String
#   initialize sentence_builder to an empty String
#   iterate over filename:
#     import 1 line and append it to sentence_builder with a whitespace delimiter
#     strip sentence_builder of the beginning and ending of whitespaces and return carriages
#     pass sentence_builder to sentence_found?
#       if true, pass sentence_builder to separate_sentence
#         save sentence_builder and new_sentence
#     check if new_sentence has more words than longest_sentence
#       replace longest_sentence if true
#   output "The following sentence has X words and is the longest sentence in FILENAME:"
#   output longest_sentence
# 
# found_sentence?(string)
#   check if string has a delimiter (\. \?, \! \n\n)
# 
# separate_sentence(string)
#   locate and save delimiter
#   split with delimiter
#   remove first string element and assign to new_sentence String
#   assign the rest of the string to sentence_builder String
#   prepend new_sentence with saved delimiter unless it is a return carriage
#   return new_sentence and sentence_builder

# ---
# Code:

def output_longest_sentence(filename)
  longest_sentence = determine_longest_sentence(filename)
  word_count = longest_sentence.split.size

  puts "The following sentence has #{word_count} words and is the longest sentence in #{filename}:"
  puts
  puts longest_sentence
end

def determine_longest_sentence(filename)
  longest_sentence = ''
  new_sentence = ''
  lines = []

  File.foreach(filename) do |line| # avoids reading entire file at once
    lines << line.chomp!
    lines = lines.join(' ').strip

    if sentence_found?(lines)
      new_sentence, lines = separate_sentence(lines)
    end

    if new_sentence.split.size > longest_sentence.split.size
      longest_sentence = new_sentence
    end

    lines = [lines]
  end
  longest_sentence
end

def sentence_found?(string)
  string.match?(/\.|\?|\!/)
end

def separate_sentence(string) # returns sentence with ending punctuation
  new_sentence, sentence_builder = case delimiter_type(string)
                                   when '.'
                                   string.split(/\./)
                                   when '!'
                                   string.split(/\!/)
                                   when '?'
                                   string.split(/\?/)
                                   end
  [new_sentence + delimiter_type(string), sentence_builder]
end

def delimiter_type(string)
  if string.match(/\./)
    '.'
  elsif string.match(/\!/)
    '!'
  elsif string.match(/\?/)
    '?'
  end
end

output_longest_sentence('four_score.txt') # => 86 words long ...
output_longest_sentence('shelly_mary_frankenstein.txt') # => 1576 words long ...
