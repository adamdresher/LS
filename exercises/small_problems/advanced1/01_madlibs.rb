# Problem:
# Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

# Example text data:
# The %{adjective} brown %{noun} %{adverb}
# %{verb} the %{adjective} yellow
# %{noun}, who %{adverb} %{verb} his
# %{noun} and looks around.

# Example words:
# adjectives: quick lazy sleepy ugly
# nouns: fox dog head leg
# verbs: jumps lifts bites licks
# adverb: easily lazily noisily excitedly

# Example output:
# The sleepy brown cat noisily
# licks the sleepy yellow
# dog, who lazily licks his
# tail and looks around.

# Input: text file
# Output: text file filled with random words
# Goal: Output sentences from text file filled with random generated words
# Rules:
#   fill text file with random word from predefined list of words
#   list of words for adjectives, nouns, verbs, and adverbs

# Mental Model:
#   Define a list of replacement_words.  Import lines from text file and replace keywords with a random word from replacement_words, then output the line.

# Data Structure:
#   The adjective brown noun adverb
#   'adjective' => ['quick', 'lazy', 'sleepy', 'ugly'] => 'quick' => The quick brown noun adverb
#   'noun' => ['fox', 'dog', 'head', 'leg'] => 'quick' => The quick brown leg adverb
#   'adverb' => ['easily', 'lazily', 'noisily', 'excitedly'] => 'quick' => The quick brown leg lazily
#   output

# Algorithm:
#   define constant Hash replacement_words (keys are types of words, values are Arrays of replacement words)
#   iterate through lines of text file:
#     iterate through replacement_words:
#       if the key is found in the line, replace the word with a random word from the key's Array value
#     output the line

# Code:
REPLACEMENT_WORDS = {
  adjective: ['quick', 'lazy', 'sleepy', 'ugly'],
  noun:      ['fox', 'dog', 'head', 'leg'],
  adverb:    ['easily', 'lazily', 'noisily', 'excitedly'],
  verb:      ['jumps', 'lifts', 'bites', 'licks']
}

def output_madlib(text)
  File.foreach(text) do |line|
    REPLACEMENT_WORDS.each_pair do |word_type, words|
      line = line.gsub(/#{word_type.to_s}/, words.sample)
    end
    puts line
  end
end

output_madlib('01_madlibs_data.txt')
