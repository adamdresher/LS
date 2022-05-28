def neutralize(sentence)
  words = sentence.split(' ')
  # words.each do |word|
    # words.delete(word) if negative?(word)
    # mutates the caller and results in the element after a deleted element
    # being skipped
  words.delete_if do |word| # very readable
  # words.reject! do |word| # another option
  # words.select! do |word| # another option
    negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
