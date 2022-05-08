def anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def display_anagrams(arr)
  anagrams = Array.new

  arr.map do |outer_word|
    anagram = arr.select do |inner_word|
                anagram?(outer_word, inner_word)
              end
    anagrams << anagram unless anagrams.include? anagram
  end

  anagrams.each { |anagram| p anagram } # output is formatted to match test case
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

display_anagrams(words)
# ["demo", "dome", "mode"]
# ["neon", "none"]
# ["tied", "diet", "edit", "tide"]
# ["evil", "live", "veil", "vile"]
# ["fowl", "wolf", "flow"]
