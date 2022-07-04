def mad_libs
  system 'clear'
  words = { noun: '', "verb (present tense)"=> '', adjective: '', adverb: '' }

  words.each_key do |word|
    a = (word[0] == 'a') ? 'an' : 'a'

    print "Enter #{a} #{word.to_s}: "
    words[word] = gets.chomp
  end

  sentences = [
"Do you #{words["verb (present tense)"]} your #{words[:adjective]} \
#{words[:noun]} #{words[:adverb]}? That's hilarious!",
"Let's go camping near the #{words[:adjective]} #{words[:noun]} next week.  \
We can #{words["verb (present tense)"]} #{words[:adverb]} without a care in \
the world!",
"It's true!  This morning a #{words[:adjective]} #{words[:noun]} \
#{words[:adverb]} fell out of the sky and that's why I can't \
#{words["verb (present tense)"]} anymore."
  ]

  puts
  puts sentences.sample
end

mad_libs

# Example output, 1:
# Enter a noun: bicycle
# Enter a verb (present tense): grow
# Enter an adjective: fast
# Enter an adverb: cautiously

# Do you grow your fast bicycle cautiously? That's hilarious!

# Example output, 2:
# Enter a noun: water bottle
# Enter a verb (present tense): eat
# Enter an adjective: pleasant
# Enter an adverb: patiently

# It's true!  This morning a pleasant water bottle patiently fell out of the sky and that's why I can't eat anymore.